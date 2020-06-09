/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#include <quic/happyeyeballs/QuicHappyEyeballsFunctions.h>

#include <quic/common/SocketUtil.h>
#include <quic/logging/QuicLogger.h>
#include <quic/state/StateData.h>

#include <folly/SocketAddress.h>
#include <folly/io/SocketOptionMap.h>
#include <folly/io/async/AsyncUDPSocket.h>
#include <folly/io/async/EventBase.h>
#include <folly/io/async/HHWheelTimer.h>
#include <folly/net/NetOps.h>
#include <folly/portability/Sockets.h>

#include <chrono>
#include <memory>

namespace fsp = folly::portability::sockets;

namespace quic {

void happyEyeballsAddPeerAddress(
    QuicConnectionStateBase& connection,
    const folly::SocketAddress& peerAddress) {
  // TODO: Do not wait for both IPv4 and IPv6 addresses to return before
  // attempting connection establishment. -- RFC8305
  // RFC8305 HappyEyeballs version 2 implementation will be more complex:
  // HappyEyeballs cache should be checked before DNS queries while the connect
  // part in built within QUIC, which will make HappyEyeballs module separated
  // in two code bases.
  // Current implementation (version 1) will assume all addresses are supplied
  // before start(), that is, addNewPeerAddress cannot be called after start()
  // is called.

  // TODO: Support multiple addresses

  QUIC_TRACE(
      happy_eyeballs, connection, "add addr", peerAddress.getAddressStr());
  if (peerAddress.getFamily() == AF_INET) {
    DCHECK(!connection.happyEyeballsState.v4PeerAddress.isInitialized());
    connection.happyEyeballsState.v4PeerAddress = peerAddress;
  } else {
    DCHECK(!connection.happyEyeballsState.v6PeerAddress.isInitialized());
    connection.happyEyeballsState.v6PeerAddress = peerAddress;
  }
}

void happyEyeballsAddSocket(
    QuicConnectionStateBase& connection,
    std::unique_ptr<folly::AsyncUDPSocket> socket) {
  connection.happyEyeballsState.secondSocket = std::move(socket);
}

void startHappyEyeballs(
    QuicConnectionStateBase& connection,
    folly::EventBase* evb,
    sa_family_t cachedFamily,
    folly::HHWheelTimer::Callback& connAttemptDelayTimeout,
    std::chrono::milliseconds connAttempDelay,
    folly::AsyncUDPSocket::ErrMessageCallback* errMsgCallback,
    folly::AsyncUDPSocket::ReadCallback* readCallback,
    const folly::SocketOptionMap& options) {
  if (connection.happyEyeballsState.v6PeerAddress.isInitialized() &&
      connection.happyEyeballsState.v4PeerAddress.isInitialized()) {
    // A second socket has to be added before happy eyeballs starts
    DCHECK(connection.happyEyeballsState.secondSocket);

    if (cachedFamily == AF_INET) {
      QUIC_TRACE(happy_eyeballs, connection, "start", "cache=v4");
      connection.originalPeerAddress =
          connection.happyEyeballsState.v4PeerAddress;
      connection.peerAddress = connection.happyEyeballsState.v4PeerAddress;
      connection.happyEyeballsState.secondPeerAddress =
          connection.happyEyeballsState.v6PeerAddress;
    } else {
      QUIC_TRACE(happy_eyeballs, connection, "start", "cache=v6");
      connection.originalPeerAddress =
          connection.happyEyeballsState.v6PeerAddress;
      connection.peerAddress = connection.happyEyeballsState.v6PeerAddress;
      connection.happyEyeballsState.secondPeerAddress =
          connection.happyEyeballsState.v4PeerAddress;
    }

    connection.happyEyeballsState.connAttemptDelayTimeout =
        &connAttemptDelayTimeout;

    evb->timer().scheduleTimeout(&connAttemptDelayTimeout, connAttempDelay);

    try {
      happyEyeballsSetUpSocket(
          *connection.happyEyeballsState.secondSocket,
          connection.localAddress,
          connection.happyEyeballsState.secondPeerAddress,
          connection.transportSettings,
          errMsgCallback,
          readCallback,
          options);
    } catch (const std::exception&) {
      // If second socket bind throws exception, give it up
      connAttemptDelayTimeout.cancelTimeout();
      connection.happyEyeballsState.finished = true;
    }
  } else if (connection.happyEyeballsState.v6PeerAddress.isInitialized()) {
    connection.originalPeerAddress =
        connection.happyEyeballsState.v6PeerAddress;
    connection.peerAddress = connection.happyEyeballsState.v6PeerAddress;
    connection.happyEyeballsState.finished = true;
  } else if (connection.happyEyeballsState.v4PeerAddress.isInitialized()) {
    connection.originalPeerAddress =
        connection.happyEyeballsState.v4PeerAddress;
    connection.peerAddress = connection.happyEyeballsState.v4PeerAddress;
    connection.happyEyeballsState.finished = true;
  }
}

void happyEyeballsSetUpSocket(
    folly::AsyncUDPSocket& socket,
    folly::Optional<folly::SocketAddress> localAddress,
    const folly::SocketAddress& peerAddress,
    const TransportSettings& transportSettings,
    folly::AsyncUDPSocket::ErrMessageCallback* errMsgCallback,
    folly::AsyncUDPSocket::ReadCallback* readCallback,
    const folly::SocketOptionMap& options) {
  auto sockFamily = localAddress.has_value() ? localAddress->getFamily()
                                             : peerAddress.getFamily();

  applySocketOptions(
      socket, options, sockFamily, folly::SocketOptionKey::ApplyPos::PRE_BIND);
  socket.setReuseAddr(false);

  if (localAddress.has_value()) {
    socket.bind(*localAddress);
  }
  if (transportSettings.connectUDP) {
    socket.connect(peerAddress);
  }
  if (!socket.isBound()) {
    if (peerAddress.getFamily() == AF_INET) {
      socket.bind(folly::SocketAddress("0.0.0.0", 0));
    } else {
      socket.bind(folly::SocketAddress("::", 0));
    }
  }
  applySocketOptions(
      socket, options, sockFamily, folly::SocketOptionKey::ApplyPos::POST_BIND);
  if (transportSettings.turnoffPMTUD) {
    socket.setDFAndTurnOffPMTU();
  } else {
    socket.dontFragment(true);
  }
  if (transportSettings.enableSocketErrMsgCallback) {
    socket.setErrMessageCallback(errMsgCallback);
  }
  socket.resumeRead(readCallback);
}

void happyEyeballsStartSecondSocket(
    QuicConnectionStateBase::HappyEyeballsState& happyEyeballsState) {
  CHECK(!happyEyeballsState.finished);

  happyEyeballsState.shouldWriteToSecondSocket = true;
}

void happyEyeballsOnDataReceived(
    QuicConnectionStateBase& connection,
    folly::HHWheelTimer::Callback& connAttemptDelayTimeout,
    std::unique_ptr<folly::AsyncUDPSocket>& socket,
    const folly::SocketAddress& peerAddress) {
  if (connection.happyEyeballsState.finished) {
    return;
  }
  QUIC_TRACE(happy_eyeballs, connection, "finish", peerAddress.getAddressStr());
  connAttemptDelayTimeout.cancelTimeout();
  connection.happyEyeballsState.finished = true;
  connection.happyEyeballsState.shouldWriteToFirstSocket = true;
  connection.happyEyeballsState.shouldWriteToSecondSocket = false;
  // If second socket won, update main socket and peerAddress
  if (connection.peerAddress.getFamily() != peerAddress.getFamily()) {
    socket.swap(connection.happyEyeballsState.secondSocket);
    connection.originalPeerAddress = peerAddress;
    connection.peerAddress = peerAddress;
  }
  connection.happyEyeballsState.secondSocket->pauseRead();
  connection.happyEyeballsState.secondSocket->close();
  connection.happyEyeballsState.secondSocket.reset();
}

} // namespace quic

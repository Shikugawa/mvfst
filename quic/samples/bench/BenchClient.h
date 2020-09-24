/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 * Copyright (c) Rei Shimizu
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#pragma once

#include <cmath>
#include <iomanip>
#include <iostream>
#include <string>
#include <thread>

#include <glog/logging.h>

#include <folly/fibers/Baton.h>
#include <folly/io/async/ScopedEventBaseThread.h>

#include <quic/api/QuicSocket.h>
#include <quic/client/QuicClientTransport.h>
#include <quic/common/BufUtil.h>
#include <quic/common/test/TestUtils.h>
#include <quic/fizz/client/handshake/FizzClientQuicHandshakeContext.h>
#include <quic/samples/echo/LogQuicStats.h>

namespace quic {
namespace samples {
class BenchClient : public quic::QuicSocket::ConnectionCallback,
                    public quic::QuicSocket::WriteCallback {
 public:
  BenchClient(
      const std::string& host,
      uint16_t port,
      uint32_t max_stream_size,
      uint32_t max_bytes_per_stream,
      bool gso)
      : host_(host),
        port_(port),
        max_stream_size_(max_stream_size),
        max_bytes_per_stream_(max_bytes_per_stream),
        gso_(gso) {
    evb_.setName("bench");
  }

  void onNewBidirectionalStream(quic::StreamId id) noexcept override {
    LOG(INFO) << "BenchClient: new bidirectional stream=" << id;
  }

  void onNewUnidirectionalStream(quic::StreamId id) noexcept override {
    LOG(INFO) << "BenchClient: new unidirectional stream=" << id;
  }

  void onStopSending(
      quic::StreamId id,
      quic::ApplicationErrorCode /*error*/) noexcept override {
    VLOG(10) << "BenchClient got StopSending stream id=" << id;
  }

  void onConnectionEnd() noexcept override {
    LOG(INFO) << "BenchClient connection end";
  }

  void onConnectionError(
      std::pair<quic::QuicErrorCode, std::string> error) noexcept override {
    LOG(INFO) << "BenchClient error: " << toString(error.first);
  }

  void onTransportReady() noexcept override {
    LOG(INFO) << "transport ready";
    for (auto i = 0; i < max_stream_size_; ++i) {
      createUnidirectionalStream();
    }
  }

  void createUnidirectionalStream() {
    if (quicClient_ == nullptr) {
      return;
    }
    auto id = quicClient_->createUnidirectionalStream().value();
    sent_bytes_per_stream_[id] = 0;
    evb_.runInEventBaseThread([&, id]() {
      auto res = quicClient_->notifyPendingWriteOnStream(id, this);
      if (res.hasError()) {
        LOG(FATAL) << quic::toString(res.error());
      }
    });
  }

  void onStreamWriteReady(quic::StreamId id, uint64_t maxToSend) noexcept
      override {
    sendMessage(id, maxToSend);
  }

  void onStreamWriteError(
      quic::StreamId id,
      std::pair<quic::QuicErrorCode, folly::Optional<folly::StringPiece>>
          error) noexcept override {
    LOG(INFO) << "EchoClient write error with stream=" << id
              << " error=" << toString(error);
  }

  void start() {
    folly::SocketAddress addr(host_.c_str(), port_);

    auto sock = std::make_unique<folly::AsyncUDPSocket>(&evb_);
    auto fizzClientContext =
        FizzClientQuicHandshakeContext::Builder()
            .setCertificateVerifier(test::createTestCertificateVerifier())
            .build();
    quicClient_ = std::make_shared<quic::QuicClientTransport>(
        &evb_, std::move(sock), std::move(fizzClientContext));
    quicClient_->setHostname("tperf");
    quicClient_->addNewPeerAddress(addr);
    quicClient_->setCongestionControllerFactory(
        std::make_shared<DefaultCongestionControllerFactory>());
    auto settings = quicClient_->getTransportSettings();
    //              settings.advertisedInitialUniStreamWindowSize = window_;

    settings.advertisedInitialConnectionWindowSize =
        std::numeric_limits<uint32_t>::max();
    settings.connectUDP = true;
    settings.shouldRecvBatch = true;

    if (gso_) {
      settings.batchingMode = QuicBatchingMode::BATCHING_MODE_GSO;
      settings.maxBatchSize = 16;
    }

    settings.canIgnorePathMTU = true;
    quicClient_->setTransportSettings(settings);

    LOG(INFO) << "TPerfClient connecting to " << addr.describe();
    quicClient_->start(this);
    evb_.loopForever();
  }

  ~BenchClient() override {
    evb_.terminateLoopSoon();
  }

 private:
  void sendMessage(quic::StreamId id, uint64_t maxToSend) {
    auto maybe_send_bytes = std::min<uint64_t>(
        maxToSend, max_bytes_per_stream_ - sent_bytes_per_stream_[id]);
    sent_bytes_per_stream_[id] += maybe_send_bytes;
    auto buf = makeBuffer(maybe_send_bytes);
    bool eof = false;

    if (sent_bytes_per_stream_[id] >= max_bytes_per_stream_) {
      eof = true;
    }

    auto res = quicClient_->writeChain(id, std::move(buf), eof, true);
    if (res.hasError()) {
      LOG(ERROR) << "EchoClient writeChain error=" << uint32_t(res.error());
    }

    if (eof) {
      sent_bytes_per_stream_.erase(id);
      createUnidirectionalStream();
    } else {
      evb_.runInEventBaseThread([&, id]() {
        auto res = quicClient_->notifyPendingWriteOnStream(id, this);
        if (res.hasError()) {
          LOG(FATAL) << quic::toString(res.error());
        }
      });
    }
  }

  std::unique_ptr<folly::IOBuf> makeBuffer(uint64_t size) {
    std::string message;
    for (auto i = 0; i < size; ++i)
      message += 'x';
    return folly::IOBuf::copyBuffer(message);
  }

  struct PerConnClientStats {
    double sent_bytes_;
    int32_t current_stream_size_ = 0;
  };

  PerConnClientStats stats_;
  std::string host_;
  uint16_t port_;
  std::shared_ptr<quic::QuicClientTransport> quicClient_;
  std::map<quic::StreamId, BufQueue> pendingOutput_;
  std::map<quic::StreamId, uint64_t> recvOffsets_;
  folly::EventBase evb_;
  uint32_t max_stream_size_;
  uint32_t max_bytes_per_stream_;
  bool gso_;
  std::map<quic::StreamId, uint32_t> sent_bytes_per_stream_;
};
} // namespace samples
} // namespace quic

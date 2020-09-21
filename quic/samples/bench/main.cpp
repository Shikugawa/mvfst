/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 * Copyright (c) Rei Shimizu
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#include <memory>
#include <vector>
#include <cassert>

#include <spdlog/spdlog.h>
#include <folly/io/async/EventBase.h>
#include <folly/portability/GFlags.h>
#include <fizz/crypto/Utils.h>
#include <quic/QuicConstants.h>
#include <quic/api/QuicSocket.h>
#include <quic/codec/Types.h>
#include <quic/server/QuicServer.h>
#include <quic/server/QuicServerTransport.h>
#include <quic/common/test/TestUtils.h>

static std::shared_ptr<spdlog::logger> logger = spdlog::stdout_color_mt("console");

#define INFO(x) logger->info(x)
#define ERROR(x) logger->error(x)

class QuicBenchServerHandler : public quic::QuicSocket::ConnectionCallback {
public:
  QuicBenchServerHandler(folly::EventBase* ev) : ev_(ev) {}

  // quic::QuicSocket::ConnectionCallback
  void onNewBidirectionalStream(quic::StreamId id) noexcept override;
  void onNewUnidirectionalStream(quic::StreamId id) noexcept override;
  void onStopSending(quic::StreamId id, quic::ApplicationErrorCode error) noexcept override;
  void onConnectionEnd() noexcept override;
  void onConnectionError(
        std::pair<quic::QuicErrorCode, std::string> code) noexcept override;

  folly::EventBase* getEventBase() {
    return ev_;
  }

  void setQuicSocket(std::shared_ptr<quic::QuicSocket> sock) {
    assert(sock_ == nullptr);
    sock_ = sock;
  }

private:
  folly::EventBase* ev_;
  std::shared_ptr<quic::QuicSocket> sock_;
};

using QuicBenchServerHandlerPtr = std::unique_ptr<QuicBenchServerHandler>;

void QuicBenchServerHandler::onNewBidirectionalStream(quic::StreamId id) noexcept {
  INFO("new bidi stream");
}

void QuicBenchServerHandler::onNewUnidirectionalStream(quic::StreamId id) noexcept {
  INFO("new uni stream");
}

void QuicBenchServerHandler::onStopSending(quic::StreamId id, quic::ApplicationErrorCode error) noexcept {
  INFO("stop send");
}

void QuicBenchServerHandler::onConnectionEnd() noexcept {
  INFO("conn end");
}

void QuicBenchServerHandler::onConnectionError(
        std::pair<quic::QuicErrorCode, std::string> code) noexcept {
  INFO("on conn error");
}

// Handle established connection handler.
class QuicBenchTransportFactory : public quic::QuicServerTransportFactory {
public:
  QuicBenchTransportFactory() = default;

  ~QuicBenchTransportFactory() override;

  quic::QuicServerTransport::Ptr make(
      folly::EventBase* evb,
      std::unique_ptr<folly::AsyncUDPSocket> sock,
      const folly::SocketAddress&,
      std::shared_ptr<const fizz::server::FizzServerContext>
          ctx) noexcept override;

private:
  std::vector<QuicBenchServerHandlerPtr> handlers_;
};

QuicBenchTransportFactory::~QuicBenchTransportFactory() noexcept {
  while (!handlers_.empty()) {
    auto& handler = handlers_.back();
    handler->getEventBase()->runImmediatelyOrRunInEventBaseThreadAndWait([this] {
        handlers_.pop_back();
    });
  }
}

quic::QuicServerTransport::Ptr QuicBenchTransportFactory::make(
        folly::EventBase *evb, std::unique_ptr<folly::AsyncUDPSocket> sock,
        const folly::SocketAddress &,
        std::shared_ptr<const fizz::server::FizzServerContext> ctx) noexcept {
  CHECK_EQ(evb, sock->getEventBase());
  auto handler = std::make_unique<QuicBenchServerHandler>(evb);
  auto transport = quic::QuicServerTransport::make(
          evb, std::move(sock), *handler, ctx);
  handler->setQuicSocket(transport);
  handlers_.emplace_back(std::move(handler));
  return transport;
}

class QuicBenchServer {
public:
  QuicBenchServer(std::string& host, uint32_t port);

  void run();

private:
  std::string host_;
  uint16_t port_;
  folly::EventBase ev_;
  std::shared_ptr<quic::QuicServer> server_;
};

QuicBenchServer::QuicBenchServer(std::string &host, uint32_t port)
  : host_(host), port_(port), server_(quic::QuicServer::createQuicServer()) {
  server_->setQuicServerTransportFactory(std::make_unique<QuicBenchTransportFactory>());
  auto ctx = quic::test::createServerCtx();
  server_->setFizzContext(ctx);
}

void QuicBenchServer::run() {
  folly::SocketAddress addr(host_.c_str(), port_);
  addr.setFromHostPort(host_, port_);
  server_->start(addr, 0);
  INFO("QUIC Bench server started...");
  ev_.loopForever();
}

DEFINE_string(host, "::1", "Echo server hostname/IP");
DEFINE_int32(port, 6666, "Echo server port");
DEFINE_string(mode, "server", "Mode to run in: 'client' or 'server'");

int main(int argc, char* argv[]) {
  gflags::ParseCommandLineFlags(&argc, &argv, false);
  fizz::CryptoUtils::init();

  if (FLAGS_mode == "server") {
    QuicBenchServer(FLAGS_host, FLAGS_port).run();
  } else if (FLAGS_mode == "client") {
  } else {
    ERROR("Invalid mode");
    return -1;
  }

  return 0;
}

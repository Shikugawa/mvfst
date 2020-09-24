/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 * Copyright (c) Rei Shimizu
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#include <chrono>
#include <memory>
#include <vector>

#include <fizz/crypto/Utils.h>
#include <folly/io/async/EventBase.h>
#include <folly/portability/GFlags.h>
#include <quic/api/QuicSocket.h>
#include <quic/common/test/TestUtils.h>
#include <quic/fizz/client/handshake/FizzClientQuicHandshakeContext.h>
#include <quic/server/QuicServer.h>
#include <quic/server/QuicServerTransport.h>

#include "BenchClient.h"
#include "BenchServerHandler.h"

using QuicBenchServerHandlerPtr =
    std::unique_ptr<quic::samples::BenchServerHandler>;

// Handle established connection handler.
class QuicBenchTransportFactory : public quic::QuicServerTransportFactory {
 public:
  QuicBenchTransportFactory(int32_t duration);

  ~QuicBenchTransportFactory() override;

  quic::QuicServerTransport::Ptr make(
      folly::EventBase* evb,
      std::unique_ptr<folly::AsyncUDPSocket> sock,
      const folly::SocketAddress&,
      std::shared_ptr<const fizz::server::FizzServerContext> ctx) noexcept
      override;

 private:
  std::vector<QuicBenchServerHandlerPtr> handlers_;
  int32_t duration_;
};

QuicBenchTransportFactory::QuicBenchTransportFactory(int32_t duration)
    : duration_(duration) {}

QuicBenchTransportFactory::~QuicBenchTransportFactory() noexcept {
  while (!handlers_.empty()) {
    auto& handler = handlers_.back();
    handler->getEventBase()->runImmediatelyOrRunInEventBaseThreadAndWait(
        [this] { handlers_.pop_back(); });
  }
}

quic::QuicServerTransport::Ptr QuicBenchTransportFactory::make(
    folly::EventBase* evb,
    std::unique_ptr<folly::AsyncUDPSocket> sock,
    const folly::SocketAddress&,
    std::shared_ptr<const fizz::server::FizzServerContext> ctx) noexcept {
  CHECK_EQ(evb, sock->getEventBase());
  auto handler =
      std::make_unique<quic::samples::BenchServerHandler>(evb, duration_);
  auto transport =
      quic::QuicServerTransport::make(evb, std::move(sock), *handler, ctx);
  handler->setQuicSocket(transport);
  handlers_.emplace_back(std::move(handler));
  return transport;
}

class QuicBenchServer {
 public:
  QuicBenchServer(std::string& host, uint32_t port, int32_t duration);

  void run();

 private:
  std::string host_;
  uint16_t port_;
  folly::EventBase ev_;
  std::shared_ptr<quic::QuicServer> server_;
};

QuicBenchServer::QuicBenchServer(
    std::string& host,
    uint32_t port,
    int32_t duration)
    : host_(host), port_(port), server_(quic::QuicServer::createQuicServer()) {
  server_->setQuicServerTransportFactory(
      std::make_unique<QuicBenchTransportFactory>(duration));
  auto ctx = quic::test::createServerCtx();
  server_->setFizzContext(ctx);
}

void QuicBenchServer::run() {
  folly::SocketAddress addr(host_.c_str(), port_);
  addr.setFromHostPort(host_, port_);
  server_->start(addr, 0);
  LOG(INFO) << "QUIC Bench server started...";
  ev_.loopForever();
}

DEFINE_string(host, "::1", "Echo server hostname/IP");
DEFINE_int32(port, 6666, "Echo server port");
DEFINE_int32(duration, 10 /* 10sec */, "duration");
DEFINE_string(mode, "server", "Mode to run in: 'client' or 'server'");
DEFINE_bool(gso, false, "enable gso or not");
DEFINE_int32(max_stream_num, 8, "max stream size");
DEFINE_int32(max_bytes_per_stream, 100000, "max bytes per stream");

int main(int argc, char* argv[]) {
  gflags::ParseCommandLineFlags(&argc, &argv, false);
  fizz::CryptoUtils::init();

  if (FLAGS_mode == "server") {
    QuicBenchServer(FLAGS_host, FLAGS_port, FLAGS_duration).run();
  } else if (FLAGS_mode == "client") {
    auto p = quic::samples::BenchClient(
        FLAGS_host,
        FLAGS_port,
        FLAGS_max_stream_num,
        FLAGS_max_bytes_per_stream,
        FLAGS_gso);
    p.start();
  } else {
    LOG(ERROR) << "Invalid mode";
    return -1;
  }

  return 0;
}

/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 * Copyright (c) Rei Shimizu
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#pragma once

#include <iostream>
#include <string>
#include <thread>
#include <boost/thread.hpp>
#include <iomanip>

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
                           public quic::QuicSocket::WriteCallback,
                           public quic::QuicSocket::DataExpiredCallback {
        public:
            BenchClient(const std::string& host, uint16_t port)
                    : host_(host), port_(port) {}

            void onNewBidirectionalStream(quic::StreamId id) noexcept override {
              LOG(INFO) << "EchoClient: new bidirectional stream=" << id;
            }

            void onNewUnidirectionalStream(quic::StreamId id) noexcept override {
              LOG(INFO) << "EchoClient: new unidirectional stream=" << id;
            }

            void onStopSending(
                    quic::StreamId id,
                    quic::ApplicationErrorCode /*error*/) noexcept override {
              VLOG(10) << "EchoClient got StopSending stream id=" << id;
            }

            void onConnectionEnd() noexcept override {
              LOG(INFO) << "EchoClient connection end";
            }

            void onConnectionError(
                    std::pair<quic::QuicErrorCode, std::string> error) noexcept override {
              LOG(INFO) << "EchoClient error: " << toString(error.first);
              startDone_.post();
            }

            void onTransportReady() noexcept override {
              startDone_.post();
            }

            void onStreamWriteReady(
                    quic::StreamId id,
                    uint64_t maxToSend) noexcept override {
              LOG(INFO) << "EchoClient socket is write ready with maxToSend="
                        << maxToSend;
              sendMessage(id, pendingOutput_[id]);
            }

            void onStreamWriteError(
                    quic::StreamId id,
                    std::pair<quic::QuicErrorCode, folly::Optional<folly::StringPiece>>
                    error) noexcept override {
              LOG(INFO) << "EchoClient write error with stream=" << id
                         << " error=" << toString(error);
            }

            void onDataExpired(StreamId streamId, uint64_t newOffset) noexcept override {
              LOG(INFO) << "Client received skipData; "
                        << newOffset - recvOffsets_[streamId]
                        << " bytes skipped on stream=" << streamId;
            }

            void start(int32_t psize, int32_t duration) {
              folly::ScopedEventBaseThread networkThread("EchoClientThread");
              evb_ = networkThread.getEventBase();
              folly::SocketAddress addr(host_.c_str(), port_);

              evb_->runInEventBaseThreadAndWait([&] {
                auto sock = std::make_unique<folly::AsyncUDPSocket>(evb_);
                auto fizzClientContext =
                        FizzClientQuicHandshakeContext::Builder()
                                .setCertificateVerifier(
                                        test::createTestCertificateVerifier())
                                .build();
                quicClient_ = std::make_shared<quic::QuicClientTransport>(
                        evb_, std::move(sock), std::move(fizzClientContext));
                quicClient_->setHostname("echo.com");
                quicClient_->addNewPeerAddress(addr);

                TransportSettings settings;
                quicClient_->setTransportSettings(settings);

                LOG(INFO) << "EchoClient connecting to " << addr.describe();
                quicClient_->start(this);
              });

              startDone_.wait();

              std::string message;
              const uint64_t base = 100000;
              for (auto i = 0; i < base * psize; ++i)
                message += 'x';

              auto connection_start = std::chrono::system_clock::now();
              auto conn_expires_at =
                      connection_start + std::chrono::seconds(duration);

              while (std::chrono::system_clock::now() <= conn_expires_at) {
                auto start = std::chrono::system_clock::now();
                auto expires_at = start + std::chrono::seconds(1);

                auto client = quicClient_;
                auto streamId = client->createUnidirectionalStream().value();
                evb_->runImmediatelyOrRunInEventBaseThreadAndWait([&] {
                  pendingOutput_[streamId].append(
                          folly::IOBuf::copyBuffer(message));
                  sendMessage(streamId, pendingOutput_[streamId]);
                });

                LOG(INFO) << "Sent: " << (stats_.sent_bytes_ / 100000) / 1000
                          << " GBytes";
                boost::this_thread::sleep(
                        boost::posix_time::milliseconds(100));
              }
            }

            ~BenchClient() override {
              if (evb_->isRunning())
                evb_->terminateLoopSoon();
            }

        private:
            void sendMessage(quic::StreamId id, BufQueue& data) {
              auto message = data.move();
              auto res = quicClient_->writeChain(id, message->clone(), true, false);
              if (res.hasError()) {
                LOG(ERROR) << "EchoClient writeChain error=" << uint32_t(res.error());
              } else {
                auto str = message->moveToFbString().toStdString();
                stats_.sent_bytes_ += str.size();
                // sent whole message
                pendingOutput_.erase(id);
              }
            }

            struct PerConnClientStats {
              double sent_bytes_;
            };

            PerConnClientStats stats_;
            std::string host_;
            uint16_t port_;
            std::shared_ptr<quic::QuicClientTransport> quicClient_;
            std::map<quic::StreamId, BufQueue> pendingOutput_;
            std::map<quic::StreamId, uint64_t> recvOffsets_;
            folly::fibers::Baton startDone_;
            folly::EventBase* evb_;
        };
    } // namespace samples
} // namespace quic

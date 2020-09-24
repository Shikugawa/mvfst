/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 * Copyright (c) Rei Shimizu
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 */

#pragma once

#include <quic/api/QuicSocket.h>
#include <chrono>
#include <cmath>

#include <folly/io/async/EventBase.h>
#include <quic/common/BufUtil.h>

namespace quic {
namespace samples {
class BenchServerHandler : public quic::QuicSocket::ConnectionCallback,
                           public quic::QuicSocket::ReadCallback,
                           public folly::HHWheelTimer::Callback {
 public:
  explicit BenchServerHandler(folly::EventBase* evbIn, int32_t duration);

  // folly::HHWeelTimer::Callback
  void timeoutExpired() noexcept override;
  void callbackCanceled() noexcept override;

  void setQuicSocket(std::shared_ptr<quic::QuicSocket> socket);
  void onNewBidirectionalStream(quic::StreamId) noexcept override;
  void onNewUnidirectionalStream(quic::StreamId id) noexcept override;
  void onStopSending(
      quic::StreamId id,
      quic::ApplicationErrorCode error) noexcept override;
  void onConnectionEnd() noexcept override;
  void onConnectionError(
      std::pair<quic::QuicErrorCode, std::string> error) noexcept override;
  void readAvailable(quic::StreamId id) noexcept override;
  void readError(
      quic::StreamId id,
      std::pair<quic::QuicErrorCode, folly::Optional<folly::StringPiece>>
          error) noexcept override;

  folly::EventBase* getEventBase();

 private:
  void resultThroughput();

  struct PerConnStats {
    double received_bytes_;
  };

  folly::EventBase* evb_;
  std::shared_ptr<quic::QuicSocket> sock_;
  PerConnStats stats_;
  std::map<quic::StreamId, size_t> input_bytes_;
  const int32_t duration_;
};

BenchServerHandler::BenchServerHandler(
    folly::EventBase* evbIn,
    int32_t duration)
    : evb_(evbIn), duration_(duration) {}

void BenchServerHandler::timeoutExpired() noexcept {
  sock_->closeNow(folly::none);
}

void BenchServerHandler::callbackCanceled() noexcept {}

void BenchServerHandler::setQuicSocket(
    std::shared_ptr<quic::QuicSocket> socket) {
  sock_ = socket;
  evb_->timer().scheduleTimeout(this, std::chrono::seconds(duration_));
}

void BenchServerHandler::onNewBidirectionalStream(quic::StreamId) noexcept {
  // Only to allow uni-directional stream
  assert(false);
}

void BenchServerHandler::onNewUnidirectionalStream(quic::StreamId id) noexcept {
  LOG(INFO) << "Got unidirectional stream id=" << id;
  sock_->setReadCallback(id, this);
}

void BenchServerHandler::onStopSending(
    quic::StreamId id,
    quic::ApplicationErrorCode error) noexcept {
  LOG(INFO) << "Got StopSending stream id=" << id << " error=" << error;
}

void BenchServerHandler::onConnectionEnd() noexcept {
  LOG(INFO) << "Socket closed";
  resultThroughput();
}

void BenchServerHandler::onConnectionError(
    std::pair<quic::QuicErrorCode, std::string> error) noexcept {
  LOG(ERROR) << "Socket error=" << toString(error.first);
  resultThroughput();
}

void BenchServerHandler::readAvailable(quic::StreamId id) noexcept {
  auto res = sock_->read(id, 0);
  if (res.hasError()) {
    LOG(ERROR) << "Got error=" << toString(res.error());
    return;
  }
  if (input_bytes_.find(id) == input_bytes_.end()) {
    input_bytes_.emplace(id, 0);
  }
  quic::Buf data = std::move(res.value().first);
  bool eof = res.value().second;
  input_bytes_[id] += data->length();
  if (eof) {
    stats_.received_bytes_ += input_bytes_[id];
    LOG(INFO) << "\nStats: \n"
              << "\ttotal received bytes: "
              << stats_.received_bytes_ / std::pow(10, 9) << " GBytes";
  }
}

void BenchServerHandler::readError(
    quic::StreamId id,
    std::pair<quic::QuicErrorCode, folly::Optional<folly::StringPiece>>
        error) noexcept {
  LOG(ERROR) << "Got read error on stream=" << id
             << " error=" << toString(error);
}

folly::EventBase* BenchServerHandler::getEventBase() {
  return evb_;
}

void BenchServerHandler::resultThroughput() {
  LOG(INFO) << "Throughput: "
            << 8 * stats_.received_bytes_ / std::pow(10, 9) / duration_
            << " Gbps";
}

} // namespace samples
} // namespace quic

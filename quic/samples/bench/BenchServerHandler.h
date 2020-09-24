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
  using StreamData = std::pair<BufQueue, bool>;

  explicit BenchServerHandler(folly::EventBase* evbIn, int32_t duration)
      : evb_(evbIn), duration_(duration) {}

  void timeoutExpired() noexcept override {
    sock_->closeNow(folly::none);
  }

  virtual void callbackCanceled() noexcept override {}

  void setQuicSocket(std::shared_ptr<quic::QuicSocket> socket) {
    sock_ = socket;
    evb_->timer().scheduleTimeout(this, std::chrono::seconds(duration_));
  }

  void onNewBidirectionalStream(quic::StreamId) noexcept override {
    assert(false);
  }

  void onNewUnidirectionalStream(quic::StreamId id) noexcept override {
    LOG(INFO) << "Got unidirectional stream id=" << id;
    sock_->setReadCallback(id, this);
  }

  void onStopSending(
      quic::StreamId id,
      quic::ApplicationErrorCode error) noexcept override {
    LOG(INFO) << "Got StopSending stream id=" << id << " error=" << error;
  }

  void onConnectionEnd() noexcept override {
    LOG(INFO) << "Socket closed";
    resultThroughput();
  }

  void onConnectionError(
      std::pair<quic::QuicErrorCode, std::string> error) noexcept override {
    LOG(ERROR) << "Socket error=" << toString(error.first);
    resultThroughput();
  }

  void readAvailable(quic::StreamId id) noexcept override {
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

  void readError(
      quic::StreamId id,
      std::pair<quic::QuicErrorCode, folly::Optional<folly::StringPiece>>
          error) noexcept override {
    LOG(ERROR) << "Got read error on stream=" << id
               << " error=" << toString(error);
    // A read error only terminates the ingress portion of the stream state.
    // Your application should probably terminate the egress portion via
    // resetStream
  }

  folly::EventBase* getEventBase() {
    return evb_;
  }

 private:
  struct PerConnStats {
    double received_bytes_;
  };

  void resultThroughput() {
    LOG(INFO) << "Throughput: "
              << 8 * stats_.received_bytes_ / std::pow(10, 9) / duration_
              << " Gbps";
  }

  folly::EventBase* evb_;
  std::shared_ptr<quic::QuicSocket> sock_;
  PerConnStats stats_;
  std::map<quic::StreamId, size_t> input_bytes_;
  const int32_t duration_;
};
} // namespace samples
} // namespace quic

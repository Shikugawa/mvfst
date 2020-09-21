# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

if(NOT BUILD_TESTS)
  return()
endif()

file(
  GLOB_RECURSE QUIC_API_HEADERS_TOINSTALL
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  *.h
)
list(FILTER QUIC_API_HEADERS_TOINSTALL EXCLUDE REGEX test/)
foreach(header ${QUIC_API_HEADERS_TOINSTALL})
  get_filename_component(header_dir ${header} DIRECTORY)
  install(FILES ${header} DESTINATION include/quic/samples/${header_dir})
endforeach()

find_package(spdlog REQUIRED)

add_executable(bench bench/main.cpp)
target_include_directories(bench PRIVATE ${spdlog_INCLUDE_PATH})

target_compile_options(
  bench
  PRIVATE
  ${_QUIC_COMMON_COMPILE_OPTIONS}
)

target_link_libraries(
  bench
  mvfst_test_utils
  ${spdlog_LIBRARY_PATH}
  ${GFLAGS_LIBRARIES}
)

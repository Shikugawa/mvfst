# Install script for directory: /home/shikugawa/dev/shikugawa-mvfst/quic

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/quic" TYPE FILE FILES "/home/shikugawa/dev/shikugawa-mvfst/quic/QuicConstants.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/libmvfst_constants.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/quic" TYPE FILE FILES "/home/shikugawa/dev/shikugawa-mvfst/quic/QuicException.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/libmvfst_exception.a")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/api/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/client/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/codec/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/common/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/fizz/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/flowcontrol/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/handshake/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/happyeyeballs/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/logging/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/loss/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/samples/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/server/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/state/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/tools/cmake_install.cmake")
  include("/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/d6d/cmake_install.cmake")

endif()


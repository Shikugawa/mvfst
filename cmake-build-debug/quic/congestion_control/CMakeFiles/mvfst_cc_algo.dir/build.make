# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shikugawa/dev/shikugawa-mvfst

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug

# Include any dependencies generated for this target.
include quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/depend.make

# Include the progress variables for this target.
include quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/progress.make

# Include the compile flags for this target's objects.
include quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o: ../quic/congestion_control/Bandwidth.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bandwidth.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bandwidth.cpp > CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bandwidth.cpp -o CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o: ../quic/congestion_control/Bbr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bbr.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bbr.cpp > CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Bbr.cpp -o CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o: ../quic/congestion_control/BbrBandwidthSampler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrBandwidthSampler.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrBandwidthSampler.cpp > CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrBandwidthSampler.cpp -o CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o: ../quic/congestion_control/BbrRttSampler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrRttSampler.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrRttSampler.cpp > CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/BbrRttSampler.cpp -o CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o: ../quic/congestion_control/CongestionControlFunctions.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControlFunctions.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControlFunctions.cpp > CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControlFunctions.cpp -o CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o: ../quic/congestion_control/CongestionControllerFactory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControllerFactory.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControllerFactory.cpp > CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/CongestionControllerFactory.cpp -o CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o: ../quic/congestion_control/Copa.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Copa.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Copa.cpp > CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Copa.cpp -o CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o: ../quic/congestion_control/NewReno.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/NewReno.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/NewReno.cpp > CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/NewReno.cpp -o CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o: ../quic/congestion_control/QuicCubic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCubic.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCubic.cpp > CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCubic.cpp -o CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o: ../quic/congestion_control/QuicCCP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCCP.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCCP.cpp > CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/QuicCCP.cpp -o CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o: ../quic/congestion_control/Pacer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Pacer.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Pacer.cpp > CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/Pacer.cpp -o CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o: ../quic/congestion_control/ServerCongestionControllerFactory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/ServerCongestionControllerFactory.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/ServerCongestionControllerFactory.cpp > CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/ServerCongestionControllerFactory.cpp -o CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.s

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/flags.make
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o: ../quic/congestion_control/TokenlessPacer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o -c /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/TokenlessPacer.cpp

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.i"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/TokenlessPacer.cpp > CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.i

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.s"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && /opt/llvm/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control/TokenlessPacer.cpp -o CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.s

# Object files for target mvfst_cc_algo
mvfst_cc_algo_OBJECTS = \
"CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o" \
"CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o"

# External object files for target mvfst_cc_algo
mvfst_cc_algo_EXTERNAL_OBJECTS =

quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bandwidth.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Bbr.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrBandwidthSampler.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/BbrRttSampler.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControlFunctions.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/CongestionControllerFactory.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Copa.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/NewReno.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCubic.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/QuicCCP.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/Pacer.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/ServerCongestionControllerFactory.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/TokenlessPacer.cpp.o
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/build.make
quic/congestion_control/libmvfst_cc_algo.a: quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library libmvfst_cc_algo.a"
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_cc_algo.dir/cmake_clean_target.cmake
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mvfst_cc_algo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/build: quic/congestion_control/libmvfst_cc_algo.a

.PHONY : quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/build

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/clean:
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control && $(CMAKE_COMMAND) -P CMakeFiles/mvfst_cc_algo.dir/cmake_clean.cmake
.PHONY : quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/clean

quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/depend:
	cd /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shikugawa/dev/shikugawa-mvfst /home/shikugawa/dev/shikugawa-mvfst/quic/congestion_control /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control /home/shikugawa/dev/shikugawa-mvfst/cmake-build-debug/quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : quic/congestion_control/CMakeFiles/mvfst_cc_algo.dir/depend


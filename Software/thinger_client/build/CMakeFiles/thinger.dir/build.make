# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/thinger_client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/thinger_client/build

# Include any dependencies generated for this target.
include CMakeFiles/thinger.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/thinger.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/thinger.dir/flags.make

CMakeFiles/thinger.dir/src/main.cpp.o: CMakeFiles/thinger.dir/flags.make
CMakeFiles/thinger.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/thinger_client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/thinger.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/thinger.dir/src/main.cpp.o -c /home/pi/thinger_client/src/main.cpp

CMakeFiles/thinger.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/thinger.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/thinger_client/src/main.cpp > CMakeFiles/thinger.dir/src/main.cpp.i

CMakeFiles/thinger.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/thinger.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/thinger_client/src/main.cpp -o CMakeFiles/thinger.dir/src/main.cpp.s

CMakeFiles/thinger.dir/src/mmapGpio.cpp.o: CMakeFiles/thinger.dir/flags.make
CMakeFiles/thinger.dir/src/mmapGpio.cpp.o: ../src/mmapGpio.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/thinger_client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/thinger.dir/src/mmapGpio.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/thinger.dir/src/mmapGpio.cpp.o -c /home/pi/thinger_client/src/mmapGpio.cpp

CMakeFiles/thinger.dir/src/mmapGpio.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/thinger.dir/src/mmapGpio.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/thinger_client/src/mmapGpio.cpp > CMakeFiles/thinger.dir/src/mmapGpio.cpp.i

CMakeFiles/thinger.dir/src/mmapGpio.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/thinger.dir/src/mmapGpio.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/thinger_client/src/mmapGpio.cpp -o CMakeFiles/thinger.dir/src/mmapGpio.cpp.s

# Object files for target thinger
thinger_OBJECTS = \
"CMakeFiles/thinger.dir/src/main.cpp.o" \
"CMakeFiles/thinger.dir/src/mmapGpio.cpp.o"

# External object files for target thinger
thinger_EXTERNAL_OBJECTS =

thinger: CMakeFiles/thinger.dir/src/main.cpp.o
thinger: CMakeFiles/thinger.dir/src/mmapGpio.cpp.o
thinger: CMakeFiles/thinger.dir/build.make
thinger: /usr/lib/arm-linux-gnueabihf/libssl.so
thinger: /usr/lib/arm-linux-gnueabihf/libcrypto.so
thinger: CMakeFiles/thinger.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/thinger_client/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable thinger"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/thinger.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/thinger.dir/build: thinger

.PHONY : CMakeFiles/thinger.dir/build

CMakeFiles/thinger.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/thinger.dir/cmake_clean.cmake
.PHONY : CMakeFiles/thinger.dir/clean

CMakeFiles/thinger.dir/depend:
	cd /home/pi/thinger_client/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/thinger_client /home/pi/thinger_client /home/pi/thinger_client/build /home/pi/thinger_client/build /home/pi/thinger_client/build/CMakeFiles/thinger.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/thinger.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /opt/clion/bin/cmake/bin/cmake

# The command to remove a file.
RM = /opt/clion/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/origamidance/Research/ofxGeoFramework

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug

# Utility rule file for ofApp_pch.

# Include the progress variables for this target.
include CMakeFiles/ofApp_pch.dir/progress.make

CMakeFiles/ofApp_pch: cotire/ofApp_CXX_prefix.hxx.pch


cotire/ofApp_CXX_prefix.hxx.pch: cotire/ofApp_CXX_prefix.hxx
cotire/ofApp_CXX_prefix.hxx.pch: cotire/ofApp_CXX_prefix.hxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX precompiled header cotire/ofApp_CXX_prefix.hxx.pch"
	cd /home/origamidance/Research/ofxGeoFramework && /opt/clion/bin/cmake/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Release -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /home/origamidance/Research/of/dev/cmake/cotire.cmake precompile /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/ofApp_CXX_cotire.cmake /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_prefix.hxx /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_prefix.hxx.pch src/main.cpp

cotire/ofApp_CXX_prefix.hxx: cotire/ofApp_CXX_prefix.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating CXX prefix header cotire/ofApp_CXX_prefix.hxx"
	/opt/clion/bin/cmake/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Release -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /home/origamidance/Research/of/dev/cmake/cotire.cmake combine /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/ofApp_CXX_cotire.cmake /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_prefix.hxx /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_prefix.cxx

cotire/ofApp_CXX_prefix.cxx: cotire/ofApp_CXX_unity.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating CXX prefix source cotire/ofApp_CXX_prefix.cxx"
	cd /home/origamidance/Research/ofxGeoFramework && /opt/clion/bin/cmake/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Release -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /home/origamidance/Research/of/dev/cmake/cotire.cmake prefix /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/ofApp_CXX_cotire.cmake /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_prefix.cxx /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_unity.cxx

cotire/ofApp_CXX_prefix.cxx.log: cotire/ofApp_CXX_prefix.cxx
	@$(CMAKE_COMMAND) -E touch_nocreate cotire/ofApp_CXX_prefix.cxx.log

cotire/ofApp_CXX_unity.cxx: ofApp_CXX_cotire.cmake
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating CXX unity source cotire/ofApp_CXX_unity.cxx"
	cd /home/origamidance/Research/ofxGeoFramework && /opt/clion/bin/cmake/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Release -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /home/origamidance/Research/of/dev/cmake/cotire.cmake unity /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/ofApp_CXX_cotire.cmake /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/cotire/ofApp_CXX_unity.cxx

ofApp_pch: CMakeFiles/ofApp_pch
ofApp_pch: cotire/ofApp_CXX_prefix.hxx.pch
ofApp_pch: cotire/ofApp_CXX_prefix.hxx
ofApp_pch: cotire/ofApp_CXX_prefix.cxx
ofApp_pch: cotire/ofApp_CXX_prefix.cxx.log
ofApp_pch: cotire/ofApp_CXX_unity.cxx
ofApp_pch: CMakeFiles/ofApp_pch.dir/build.make

.PHONY : ofApp_pch

# Rule to build all files generated by this target.
CMakeFiles/ofApp_pch.dir/build: ofApp_pch

.PHONY : CMakeFiles/ofApp_pch.dir/build

CMakeFiles/ofApp_pch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ofApp_pch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ofApp_pch.dir/clean

CMakeFiles/ofApp_pch.dir/depend:
	cd /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/origamidance/Research/ofxGeoFramework /home/origamidance/Research/ofxGeoFramework /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug /home/origamidance/.CLion2016.2/system/cmake/generated/ofxGeoFramework-4ae38f71/4ae38f71/Debug/CMakeFiles/ofApp_pch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ofApp_pch.dir/depend


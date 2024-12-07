# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jesseb08/WPI_SwarmIntelligence/Project/Project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jesseb08/WPI_SwarmIntelligence/Project/Project/build

# Utility rule file for threshold_model.bzz.

# Include any custom commands dependencies for this target.
include CMakeFiles/threshold_model.bzz.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/threshold_model.bzz.dir/progress.make

CMakeFiles/threshold_model.bzz: ../threshold_model.bzz
CMakeFiles/threshold_model.bzz: threshold_model.bo
CMakeFiles/threshold_model.bzz: threshold_model.bdb

threshold_model.bo: ../threshold_model.bzz
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jesseb08/WPI_SwarmIntelligence/Project/Project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Compiling Buzz script threshold_model.bzz"
	BZZPARSE=/usr/local/bin/bzzparse BZZASM=/usr/local/bin/bzzasm /usr/local/bin/bzzc -I /usr/local/share/buzz/include: -b threshold_model.bo -d threshold_model.bdb -a threshold_model.basm /home/jesseb08/WPI_SwarmIntelligence/Project/Project/threshold_model.bzz

threshold_model.basm: threshold_model.bo
	@$(CMAKE_COMMAND) -E touch_nocreate threshold_model.basm

threshold_model.bdb: threshold_model.bo
	@$(CMAKE_COMMAND) -E touch_nocreate threshold_model.bdb

threshold_model.bzz: CMakeFiles/threshold_model.bzz
threshold_model.bzz: threshold_model.basm
threshold_model.bzz: threshold_model.bdb
threshold_model.bzz: threshold_model.bo
threshold_model.bzz: CMakeFiles/threshold_model.bzz.dir/build.make
.PHONY : threshold_model.bzz

# Rule to build all files generated by this target.
CMakeFiles/threshold_model.bzz.dir/build: threshold_model.bzz
.PHONY : CMakeFiles/threshold_model.bzz.dir/build

CMakeFiles/threshold_model.bzz.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/threshold_model.bzz.dir/cmake_clean.cmake
.PHONY : CMakeFiles/threshold_model.bzz.dir/clean

CMakeFiles/threshold_model.bzz.dir/depend:
	cd /home/jesseb08/WPI_SwarmIntelligence/Project/Project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jesseb08/WPI_SwarmIntelligence/Project/Project /home/jesseb08/WPI_SwarmIntelligence/Project/Project /home/jesseb08/WPI_SwarmIntelligence/Project/Project/build /home/jesseb08/WPI_SwarmIntelligence/Project/Project/build /home/jesseb08/WPI_SwarmIntelligence/Project/Project/build/CMakeFiles/threshold_model.bzz.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/threshold_model.bzz.dir/depend

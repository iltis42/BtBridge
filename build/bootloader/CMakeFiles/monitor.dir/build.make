# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gittest2/esp/esp-idf/components/bootloader/subproject

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gittest2/BtBridge/build/bootloader

# Utility rule file for monitor.

# Include the progress variables for this target.
include CMakeFiles/monitor.dir/progress.make

CMakeFiles/monitor:
	cd /home/gittest2/esp/esp-idf/components/esptool_py && /home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -D IDF_PATH="/home/gittest2/esp/esp-idf" -D SERIAL_TOOL="/home/gittest2/esp/esp-idf/tools/idf_monitor.py" -D SERIAL_TOOL_ARGS="/home/gittest2/BtBridge/build/bootloader/bootloader.elf" -D WORKING_DIRECTORY="/home/gittest2/BtBridge/build/bootloader" -P run_serial_tool.cmake

monitor: CMakeFiles/monitor
monitor: CMakeFiles/monitor.dir/build.make

.PHONY : monitor

# Rule to build all files generated by this target.
CMakeFiles/monitor.dir/build: monitor

.PHONY : CMakeFiles/monitor.dir/build

CMakeFiles/monitor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/monitor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/monitor.dir/clean

CMakeFiles/monitor.dir/depend:
	cd /home/gittest2/BtBridge/build/bootloader && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gittest2/esp/esp-idf/components/bootloader/subproject /home/gittest2/esp/esp-idf/components/bootloader/subproject /home/gittest2/BtBridge/build/bootloader /home/gittest2/BtBridge/build/bootloader /home/gittest2/BtBridge/build/bootloader/CMakeFiles/monitor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/monitor.dir/depend

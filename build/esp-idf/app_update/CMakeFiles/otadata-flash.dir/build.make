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
CMAKE_SOURCE_DIR = /home/gittest2/BtBridge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gittest2/BtBridge/build

# Utility rule file for otadata-flash.

# Include the progress variables for this target.
include esp-idf/app_update/CMakeFiles/otadata-flash.dir/progress.make

esp-idf/app_update/CMakeFiles/otadata-flash:
	cd /home/gittest2/esp/esp-idf/components/app_update && /home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -D IDF_PATH="/home/gittest2/esp/esp-idf" -D SERIAL_TOOL="/home/gittest2/.espressif/python_env/idf4.3_py2.7_env/bin/python /home/gittest2/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip esp32" -D SERIAL_TOOL_ARGS="--before=default_reset --after=hard_reset write_flash @otadata-flash_args" -D WORKING_DIRECTORY="/home/gittest2/BtBridge/build" -P /home/gittest2/esp/esp-idf/components/esptool_py/run_serial_tool.cmake

otadata-flash: esp-idf/app_update/CMakeFiles/otadata-flash
otadata-flash: esp-idf/app_update/CMakeFiles/otadata-flash.dir/build.make

.PHONY : otadata-flash

# Rule to build all files generated by this target.
esp-idf/app_update/CMakeFiles/otadata-flash.dir/build: otadata-flash

.PHONY : esp-idf/app_update/CMakeFiles/otadata-flash.dir/build

esp-idf/app_update/CMakeFiles/otadata-flash.dir/clean:
	cd /home/gittest2/BtBridge/build/esp-idf/app_update && $(CMAKE_COMMAND) -P CMakeFiles/otadata-flash.dir/cmake_clean.cmake
.PHONY : esp-idf/app_update/CMakeFiles/otadata-flash.dir/clean

esp-idf/app_update/CMakeFiles/otadata-flash.dir/depend:
	cd /home/gittest2/BtBridge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gittest2/BtBridge /home/gittest2/esp/esp-idf/components/app_update /home/gittest2/BtBridge/build /home/gittest2/BtBridge/build/esp-idf/app_update /home/gittest2/BtBridge/build/esp-idf/app_update/CMakeFiles/otadata-flash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/app_update/CMakeFiles/otadata-flash.dir/depend


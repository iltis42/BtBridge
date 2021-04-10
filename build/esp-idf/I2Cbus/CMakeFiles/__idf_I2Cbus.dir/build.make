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

# Include any dependencies generated for this target.
include esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/depend.make

# Include the progress variables for this target.
include esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/flags.make

esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj: esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/flags.make
esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj: ../components/I2Cbus/src/I2Cbus.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj -c /home/gittest2/BtBridge/components/I2Cbus/src/I2Cbus.cpp

esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.i"
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gittest2/BtBridge/components/I2Cbus/src/I2Cbus.cpp > CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.i

esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.s"
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gittest2/BtBridge/components/I2Cbus/src/I2Cbus.cpp -o CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.s

# Object files for target __idf_I2Cbus
__idf_I2Cbus_OBJECTS = \
"CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj"

# External object files for target __idf_I2Cbus
__idf_I2Cbus_EXTERNAL_OBJECTS =

esp-idf/I2Cbus/libI2Cbus.a: esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/src/I2Cbus.cpp.obj
esp-idf/I2Cbus/libI2Cbus.a: esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/build.make
esp-idf/I2Cbus/libI2Cbus.a: esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libI2Cbus.a"
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && $(CMAKE_COMMAND) -P CMakeFiles/__idf_I2Cbus.dir/cmake_clean_target.cmake
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_I2Cbus.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/build: esp-idf/I2Cbus/libI2Cbus.a

.PHONY : esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/build

esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/clean:
	cd /home/gittest2/BtBridge/build/esp-idf/I2Cbus && $(CMAKE_COMMAND) -P CMakeFiles/__idf_I2Cbus.dir/cmake_clean.cmake
.PHONY : esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/clean

esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/depend:
	cd /home/gittest2/BtBridge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gittest2/BtBridge /home/gittest2/BtBridge/components/I2Cbus /home/gittest2/BtBridge/build /home/gittest2/BtBridge/build/esp-idf/I2Cbus /home/gittest2/BtBridge/build/esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/I2Cbus/CMakeFiles/__idf_I2Cbus.dir/depend


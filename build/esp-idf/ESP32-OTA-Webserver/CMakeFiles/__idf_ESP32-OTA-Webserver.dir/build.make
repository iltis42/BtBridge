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
include esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/depend.make

# Include the progress variables for this target.
include esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/progress.make

# Include the compile flags for this target's objects.
include esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make

index.html.S: /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
index.html.S: ../components/ESP32-OTA-Webserver/WebsiteFiles/index.html
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../../index.html.S"
	/home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -D DATA_FILE=/home/gittest2/BtBridge/components/ESP32-OTA-Webserver/WebsiteFiles/index.html -D SOURCE_FILE=/home/gittest2/BtBridge/build/index.html.S -D FILE_TYPE=TEXT -P /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

favicon.ico.S: /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
favicon.ico.S: ../components/ESP32-OTA-Webserver/WebsiteFiles/favicon.ico
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ../../favicon.ico.S"
	/home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -D DATA_FILE=/home/gittest2/BtBridge/components/ESP32-OTA-Webserver/WebsiteFiles/favicon.ico -D SOURCE_FILE=/home/gittest2/BtBridge/build/favicon.ico.S -D FILE_TYPE=TEXT -P /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

jquery-3.4.1.min.js.S: /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake
jquery-3.4.1.min.js.S: ../components/ESP32-OTA-Webserver/WebsiteFiles/jquery-3.4.1.min.js
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating ../../jquery-3.4.1.min.js.S"
	/home/gittest2/.espressif/python_env/idf4.3_py2.7_env/lib/python2.7/site-packages/cmake/data/bin/cmake -D DATA_FILE=/home/gittest2/BtBridge/components/ESP32-OTA-Webserver/WebsiteFiles/jquery-3.4.1.min.js -D SOURCE_FILE=/home/gittest2/BtBridge/build/jquery-3.4.1.min.js.S -D FILE_TYPE=TEXT -P /home/gittest2/esp/esp-idf/tools/cmake/scripts/data_file_embed_asm.cmake

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj: ../components/ESP32-OTA-Webserver/MyWiFi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj -c /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/MyWiFi.c

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.i"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/MyWiFi.c > CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.i

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.s"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/MyWiFi.c -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.s

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj: ../components/ESP32-OTA-Webserver/OTAServer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj -c /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/OTAServer.c

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.i"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/OTAServer.c > CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.i

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.s"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/gittest2/BtBridge/components/ESP32-OTA-Webserver/OTAServer.c -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.s

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj: index.html.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building ASM object esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj -c /home/gittest2/BtBridge/build/index.html.S

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj: favicon.ico.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building ASM object esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj -c /home/gittest2/BtBridge/build/favicon.ico.S

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/flags.make
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj: jquery-3.4.1.min.js.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building ASM object esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj -c /home/gittest2/BtBridge/build/jquery-3.4.1.min.js.S

# Object files for target __idf_ESP32-OTA-Webserver
__idf_ESP32__OTA__Webserver_OBJECTS = \
"CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj" \
"CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj" \
"CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj" \
"CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj" \
"CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj"

# External object files for target __idf_ESP32-OTA-Webserver
__idf_ESP32__OTA__Webserver_EXTERNAL_OBJECTS =

esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/MyWiFi.c.obj
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/OTAServer.c.obj
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/index.html.S.obj
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/favicon.ico.S.obj
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/__/__/jquery-3.4.1.min.js.S.obj
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/build.make
esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a: esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gittest2/BtBridge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking C static library libESP32-OTA-Webserver.a"
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && $(CMAKE_COMMAND) -P CMakeFiles/__idf_ESP32-OTA-Webserver.dir/cmake_clean_target.cmake
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/__idf_ESP32-OTA-Webserver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/build: esp-idf/ESP32-OTA-Webserver/libESP32-OTA-Webserver.a

.PHONY : esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/build

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/clean:
	cd /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver && $(CMAKE_COMMAND) -P CMakeFiles/__idf_ESP32-OTA-Webserver.dir/cmake_clean.cmake
.PHONY : esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/clean

esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/depend: index.html.S
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/depend: favicon.ico.S
esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/depend: jquery-3.4.1.min.js.S
	cd /home/gittest2/BtBridge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gittest2/BtBridge /home/gittest2/BtBridge/components/ESP32-OTA-Webserver /home/gittest2/BtBridge/build /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver /home/gittest2/BtBridge/build/esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : esp-idf/ESP32-OTA-Webserver/CMakeFiles/__idf_ESP32-OTA-Webserver.dir/depend

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# compile CXX with /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++
CXX_DEFINES = -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\"

CXX_INCLUDES = -I/home/gittest2/BtBridge/build/config -I/home/gittest2/BtBridge/components/MPUdriver/include -I/home/gittest2/BtBridge/components/MPUdriver -I/home/gittest2/esp/esp-idf/components/newlib/platform_include -I/home/gittest2/esp/esp-idf/components/freertos/include -I/home/gittest2/esp/esp-idf/components/freertos/port/xtensa/include -I/home/gittest2/esp/esp-idf/components/esp_hw_support/include -I/home/gittest2/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/home/gittest2/esp/esp-idf/components/heap/include -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/esp/esp-idf/components/lwip/include/apps -I/home/gittest2/esp/esp-idf/components/lwip/include/apps/sntp -I/home/gittest2/esp/esp-idf/components/lwip/lwip/src/include -I/home/gittest2/esp/esp-idf/components/lwip/port/esp32/include -I/home/gittest2/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/gittest2/esp/esp-idf/components/soc/include -I/home/gittest2/esp/esp-idf/components/soc/esp32/. -I/home/gittest2/esp/esp-idf/components/soc/esp32/include -I/home/gittest2/esp/esp-idf/components/hal/esp32/include -I/home/gittest2/esp/esp-idf/components/hal/include -I/home/gittest2/esp/esp-idf/components/esp_rom/include -I/home/gittest2/esp/esp-idf/components/esp_rom/esp32 -I/home/gittest2/esp/esp-idf/components/esp_common/include -I/home/gittest2/esp/esp-idf/components/esp_system/include -I/home/gittest2/esp/esp-idf/components/esp32/include -I/home/gittest2/esp/esp-idf/components/driver/include -I/home/gittest2/esp/esp-idf/components/driver/esp32/include -I/home/gittest2/esp/esp-idf/components/esp_ringbuf/include -I/home/gittest2/esp/esp-idf/components/efuse/include -I/home/gittest2/esp/esp-idf/components/efuse/esp32/include -I/home/gittest2/esp/esp-idf/components/xtensa/include -I/home/gittest2/esp/esp-idf/components/xtensa/esp32/include -I/home/gittest2/esp/esp-idf/components/espcoredump/include -I/home/gittest2/esp/esp-idf/components/esp_timer/include -I/home/gittest2/esp/esp-idf/components/esp_ipc/include -I/home/gittest2/esp/esp-idf/components/esp_pm/include -I/home/gittest2/esp/esp-idf/components/vfs/include -I/home/gittest2/esp/esp-idf/components/esp_wifi/include -I/home/gittest2/esp/esp-idf/components/esp_wifi/esp32/include -I/home/gittest2/esp/esp-idf/components/esp_event/include -I/home/gittest2/esp/esp-idf/components/esp_netif/include -I/home/gittest2/esp/esp-idf/components/esp_eth/include -I/home/gittest2/esp/esp-idf/components/tcpip_adapter/include -I/home/gittest2/esp/esp-idf/components/app_trace/include -I/home/gittest2/BtBridge/components/I2Cbus/include -I/home/gittest2/BtBridge/components/arduino-esp32/variants/esp32 -I/home/gittest2/BtBridge/components/arduino-esp32/cores/esp32 -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/EEPROM/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/ESP32/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/FFat/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/FS/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Preferences/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/SPIFFS/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/SPI/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Ticker/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Update/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Wire/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/BluetoothSerial/src -I/home/gittest2/esp/esp-idf/components/spi_flash/include -I/home/gittest2/esp/esp-idf/components/mbedtls/port/include -I/home/gittest2/esp/esp-idf/components/mbedtls/mbedtls/include -I/home/gittest2/esp/esp-idf/components/mbedtls/esp_crt_bundle/include -I/home/gittest2/esp/esp-idf/components/mdns/include -I/home/gittest2/esp/esp-idf/components/console -I/home/gittest2/esp/esp-idf/components/app_update/include -I/home/gittest2/esp/esp-idf/components/bootloader_support/include -I/home/gittest2/esp/esp-idf/components/bt/include -I/home/gittest2/esp/esp-idf/components/bt/common/osi/include -I/home/gittest2/esp/esp-idf/components/bt/host/bluedroid/api/include/api -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/fatfs/diskio -I/home/gittest2/esp/esp-idf/components/fatfs/vfs -I/home/gittest2/esp/esp-idf/components/fatfs/src -I/home/gittest2/esp/esp-idf/components/wear_levelling/include -I/home/gittest2/esp/esp-idf/components/sdmmc/include -I/home/gittest2/esp/esp-idf/components/spiffs/include

CXX_FLAGS = -mlongcalls -Wno-frame-address -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -O2 -fstack-protector -std=gnu++11 -fno-exceptions -frtti -D_GNU_SOURCE -DIDF_VER=\"v4.3-dev-2586-g526f68239-dirty\" -DESP_PLATFORM -DNDEBUG -DMPU_COMPONENT_TRUE=1 -DI2CBUS_COMPONENT_TRUE=1


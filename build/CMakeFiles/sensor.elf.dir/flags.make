# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# compile C with /home/gittest2/.espressif/tools/xtensa-esp32-elf/esp-2020r3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_DEFINES = -DHAVE_CONFIG_H -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DUNITY_INCLUDE_CONFIG_H -DWITH_POSIX

C_INCLUDES = -I/home/gittest2/esp/esp-idf/components/esp_pm/include -I/home/gittest2/BtBridge/build/config -I/home/gittest2/esp/esp-idf/components/newlib/platform_include -I/home/gittest2/esp/esp-idf/components/freertos/include -I/home/gittest2/esp/esp-idf/components/freertos/port/xtensa/include -I/home/gittest2/esp/esp-idf/components/esp_hw_support/include -I/home/gittest2/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/home/gittest2/esp/esp-idf/components/heap/include -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/esp/esp-idf/components/lwip/include/apps -I/home/gittest2/esp/esp-idf/components/lwip/include/apps/sntp -I/home/gittest2/esp/esp-idf/components/lwip/lwip/src/include -I/home/gittest2/esp/esp-idf/components/lwip/port/esp32/include -I/home/gittest2/esp/esp-idf/components/lwip/port/esp32/include/arch -I/home/gittest2/esp/esp-idf/components/soc/include -I/home/gittest2/esp/esp-idf/components/soc/esp32/. -I/home/gittest2/esp/esp-idf/components/soc/esp32/include -I/home/gittest2/esp/esp-idf/components/hal/esp32/include -I/home/gittest2/esp/esp-idf/components/hal/include -I/home/gittest2/esp/esp-idf/components/esp_rom/include -I/home/gittest2/esp/esp-idf/components/esp_rom/esp32 -I/home/gittest2/esp/esp-idf/components/esp_common/include -I/home/gittest2/esp/esp-idf/components/esp_system/include -I/home/gittest2/esp/esp-idf/components/esp32/include -I/home/gittest2/esp/esp-idf/components/driver/include -I/home/gittest2/esp/esp-idf/components/driver/esp32/include -I/home/gittest2/esp/esp-idf/components/esp_ringbuf/include -I/home/gittest2/esp/esp-idf/components/efuse/include -I/home/gittest2/esp/esp-idf/components/efuse/esp32/include -I/home/gittest2/esp/esp-idf/components/xtensa/include -I/home/gittest2/esp/esp-idf/components/xtensa/esp32/include -I/home/gittest2/esp/esp-idf/components/espcoredump/include -I/home/gittest2/esp/esp-idf/components/esp_timer/include -I/home/gittest2/esp/esp-idf/components/esp_ipc/include -I/home/gittest2/esp/esp-idf/components/vfs/include -I/home/gittest2/esp/esp-idf/components/esp_wifi/include -I/home/gittest2/esp/esp-idf/components/esp_wifi/esp32/include -I/home/gittest2/esp/esp-idf/components/esp_event/include -I/home/gittest2/esp/esp-idf/components/esp_netif/include -I/home/gittest2/esp/esp-idf/components/esp_eth/include -I/home/gittest2/esp/esp-idf/components/tcpip_adapter/include -I/home/gittest2/esp/esp-idf/components/app_trace/include -I/home/gittest2/esp/esp-idf/components/mbedtls/port/include -I/home/gittest2/esp/esp-idf/components/mbedtls/mbedtls/include -I/home/gittest2/esp/esp-idf/components/mbedtls/esp_crt_bundle/include -I/home/gittest2/esp/esp-idf/components/bootloader_support/include -I/home/gittest2/esp/esp-idf/components/app_update/include -I/home/gittest2/esp/esp-idf/components/spi_flash/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/pthread/include -I/home/gittest2/esp/esp-idf/components/esp_gdbstub/include -I/home/gittest2/esp/esp-idf/components/esp_gdbstub/xtensa -I/home/gittest2/esp/esp-idf/components/esp_gdbstub/esp32 -I/home/gittest2/esp/esp-idf/components/wpa_supplicant/include -I/home/gittest2/esp/esp-idf/components/wpa_supplicant/port/include -I/home/gittest2/esp/esp-idf/components/wpa_supplicant/include/esp_supplicant -I/home/gittest2/esp/esp-idf/components/perfmon/include -I/home/gittest2/esp/esp-idf/components/asio/asio/asio/include -I/home/gittest2/esp/esp-idf/components/asio/port/include -I/home/gittest2/esp/esp-idf/components/bt/include -I/home/gittest2/esp/esp-idf/components/bt/common/osi/include -I/home/gittest2/esp/esp-idf/components/bt/host/bluedroid/api/include/api -I/home/gittest2/esp/esp-idf/components/cbor/port/include -I/home/gittest2/esp/esp-idf/components/unity/include -I/home/gittest2/esp/esp-idf/components/unity/unity/src -I/home/gittest2/esp/esp-idf/components/cmock/CMock/src -I/home/gittest2/esp/esp-idf/components/coap/port/include -I/home/gittest2/esp/esp-idf/components/coap/port/include/coap -I/home/gittest2/esp/esp-idf/components/coap/libcoap/include -I/home/gittest2/esp/esp-idf/components/coap/libcoap/include/coap2 -I/home/gittest2/esp/esp-idf/components/console -I/home/gittest2/esp/esp-idf/components/nghttp/port/include -I/home/gittest2/esp/esp-idf/components/nghttp/nghttp2/lib/includes -I/home/gittest2/esp/esp-idf/components/esp-tls -I/home/gittest2/esp/esp-idf/components/esp-tls/esp-tls-crypto -I/home/gittest2/esp/esp-idf/components/esp_adc_cal/include -I/home/gittest2/esp/esp-idf/components/esp_hid/include -I/home/gittest2/esp/esp-idf/components/tcp_transport/include -I/home/gittest2/esp/esp-idf/components/esp_http_client/include -I/home/gittest2/esp/esp-idf/components/esp_http_server/include -I/home/gittest2/esp/esp-idf/components/esp_https_ota/include -I/home/gittest2/esp/esp-idf/components/protobuf-c/protobuf-c -I/home/gittest2/esp/esp-idf/components/protocomm/include/common -I/home/gittest2/esp/esp-idf/components/protocomm/include/security -I/home/gittest2/esp/esp-idf/components/protocomm/include/transports -I/home/gittest2/esp/esp-idf/components/mdns/include -I/home/gittest2/esp/esp-idf/components/esp_local_ctrl/include -I/home/gittest2/esp/esp-idf/components/sdmmc/include -I/home/gittest2/esp/esp-idf/components/esp_serial_slave_link/include -I/home/gittest2/esp/esp-idf/components/esp_websocket_client/include -I/home/gittest2/esp/esp-idf/components/expat/expat/expat/lib -I/home/gittest2/esp/esp-idf/components/expat/port/include -I/home/gittest2/esp/esp-idf/components/wear_levelling/include -I/home/gittest2/esp/esp-idf/components/fatfs/diskio -I/home/gittest2/esp/esp-idf/components/fatfs/vfs -I/home/gittest2/esp/esp-idf/components/fatfs/src -I/home/gittest2/esp/esp-idf/components/freemodbus/common/include -I/home/gittest2/esp/esp-idf/components/idf_test/include -I/home/gittest2/esp/esp-idf/components/idf_test/include/esp32 -I/home/gittest2/esp/esp-idf/components/jsmn/include -I/home/gittest2/esp/esp-idf/components/json/cJSON -I/home/gittest2/esp/esp-idf/components/libsodium/libsodium/src/libsodium/include -I/home/gittest2/esp/esp-idf/components/libsodium/port_include -I/home/gittest2/esp/esp-idf/components/mqtt/esp-mqtt/include -I/home/gittest2/esp/esp-idf/components/openssl/include -I/home/gittest2/esp/esp-idf/components/spiffs/include -I/home/gittest2/esp/esp-idf/components/ulp/include -I/home/gittest2/esp/esp-idf/components/wifi_provisioning/include -I/home/gittest2/BtBridge/components/arduino-esp32/variants/esp32 -I/home/gittest2/BtBridge/components/arduino-esp32/cores/esp32 -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/EEPROM/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/ESP32/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/FFat/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/FS/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Preferences/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/SPIFFS/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/SPI/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Ticker/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Update/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/Wire/src -I/home/gittest2/BtBridge/components/arduino-esp32/libraries/BluetoothSerial/src -I/home/gittest2/BtBridge/components/ESP32-OTA-Webserver -I/home/gittest2/BtBridge/components/I2Cbus/include -I/home/gittest2/BtBridge/main

C_FLAGS = -mlongcalls -Wno-frame-address -DI2CBUS_COMPONENT_TRUE=1


################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../main/ABPMRR.cpp \
../main/AnalogInput.cpp \
../main/AverageVario.cpp \
../main/BME280_ESP32_SPI.cpp \
../main/BMPVario.cpp \
../main/BTSender.cpp \
../main/Cipher.cpp \
../main/Compass.cpp \
../main/CompassMenu.cpp \
../main/DS18B20.cpp \
../main/DallasRmt.cpp \
../main/DisplayDeviations.cpp \
../main/ESP32NVS.cpp \
../main/ESPAudio.cpp \
../main/ESPRotary.cpp \
../main/Flap.cpp \
../main/Flarm.cpp \
../main/I2C.cpp \
../main/IpsDisplay.cpp \
../main/KalmanMPU6050.cpp \
../main/LeakTest.cpp \
../main/MP5004DP.cpp \
../main/MS4525DO.cpp \
../main/MenuEntry.cpp \
../main/OTA.cpp \
../main/OnewireRmt.cpp \
../main/Polars.cpp \
../main/Protocols.cpp \
../main/QMC5883L.cpp \
../main/Router.cpp \
../main/S2F.cpp \
../main/SPL06-007.cpp \
../main/Serial.cpp \
../main/Setup.cpp \
../main/SetupMenu.cpp \
../main/SetupMenuDisplay.cpp \
../main/SetupMenuSelect.cpp \
../main/SetupMenuValFloat.cpp \
../main/SetupNG.cpp \
../main/Switch.cpp \
../main/Version.cpp \
../main/WifiApp.cpp \
../main/WifiClient.cpp \
../main/mcp3221.cpp \
../main/mcp4018.cpp \
../main/sensor.cpp \
../main/sound.cpp 

OBJS += \
./main/ABPMRR.o \
./main/AnalogInput.o \
./main/AverageVario.o \
./main/BME280_ESP32_SPI.o \
./main/BMPVario.o \
./main/BTSender.o \
./main/Cipher.o \
./main/Compass.o \
./main/CompassMenu.o \
./main/DS18B20.o \
./main/DallasRmt.o \
./main/DisplayDeviations.o \
./main/ESP32NVS.o \
./main/ESPAudio.o \
./main/ESPRotary.o \
./main/Flap.o \
./main/Flarm.o \
./main/I2C.o \
./main/IpsDisplay.o \
./main/KalmanMPU6050.o \
./main/LeakTest.o \
./main/MP5004DP.o \
./main/MS4525DO.o \
./main/MenuEntry.o \
./main/OTA.o \
./main/OnewireRmt.o \
./main/Polars.o \
./main/Protocols.o \
./main/QMC5883L.o \
./main/Router.o \
./main/S2F.o \
./main/SPL06-007.o \
./main/Serial.o \
./main/Setup.o \
./main/SetupMenu.o \
./main/SetupMenuDisplay.o \
./main/SetupMenuSelect.o \
./main/SetupMenuValFloat.o \
./main/SetupNG.o \
./main/Switch.o \
./main/Version.o \
./main/WifiApp.o \
./main/WifiClient.o \
./main/mcp3221.o \
./main/mcp4018.o \
./main/sensor.o \
./main/sound.o 

CPP_DEPS += \
./main/ABPMRR.d \
./main/AnalogInput.d \
./main/AverageVario.d \
./main/BME280_ESP32_SPI.d \
./main/BMPVario.d \
./main/BTSender.d \
./main/Cipher.d \
./main/Compass.d \
./main/CompassMenu.d \
./main/DS18B20.d \
./main/DallasRmt.d \
./main/DisplayDeviations.d \
./main/ESP32NVS.d \
./main/ESPAudio.d \
./main/ESPRotary.d \
./main/Flap.d \
./main/Flarm.d \
./main/I2C.d \
./main/IpsDisplay.d \
./main/KalmanMPU6050.d \
./main/LeakTest.d \
./main/MP5004DP.d \
./main/MS4525DO.d \
./main/MenuEntry.d \
./main/OTA.d \
./main/OnewireRmt.d \
./main/Polars.d \
./main/Protocols.d \
./main/QMC5883L.d \
./main/Router.d \
./main/S2F.d \
./main/SPL06-007.d \
./main/Serial.d \
./main/Setup.d \
./main/SetupMenu.d \
./main/SetupMenuDisplay.d \
./main/SetupMenuSelect.d \
./main/SetupMenuValFloat.d \
./main/SetupNG.d \
./main/Switch.d \
./main/Version.d \
./main/WifiApp.d \
./main/WifiClient.d \
./main/mcp3221.d \
./main/mcp4018.d \
./main/sensor.d \
./main/sound.d 


# Each subdirectory must supply rules for building sources it contributes
main/%.o: ../main/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



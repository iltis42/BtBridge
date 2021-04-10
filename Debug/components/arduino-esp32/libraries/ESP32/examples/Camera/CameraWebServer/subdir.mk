################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/arduino-esp32/libraries/ESP32/examples/Camera/CameraWebServer/app_httpd.cpp 

OBJS += \
./components/arduino-esp32/libraries/ESP32/examples/Camera/CameraWebServer/app_httpd.o 

CPP_DEPS += \
./components/arduino-esp32/libraries/ESP32/examples/Camera/CameraWebServer/app_httpd.d 


# Each subdirectory must supply rules for building sources it contributes
components/arduino-esp32/libraries/ESP32/examples/Camera/CameraWebServer/%.o: ../components/arduino-esp32/libraries/ESP32/examples/Camera/CameraWebServer/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



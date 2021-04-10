################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/ESP32-OTA-Webserver/MyWiFi.c \
../components/ESP32-OTA-Webserver/OTAServer.c 

OBJS += \
./components/ESP32-OTA-Webserver/MyWiFi.o \
./components/ESP32-OTA-Webserver/OTAServer.o 

C_DEPS += \
./components/ESP32-OTA-Webserver/MyWiFi.d \
./components/ESP32-OTA-Webserver/OTAServer.d 


# Each subdirectory must supply rules for building sources it contributes
components/ESP32-OTA-Webserver/%.o: ../components/ESP32-OTA-Webserver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



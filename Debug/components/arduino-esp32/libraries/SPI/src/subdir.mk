################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/arduino-esp32/libraries/SPI/src/SPI.cpp 

OBJS += \
./components/arduino-esp32/libraries/SPI/src/SPI.o 

CPP_DEPS += \
./components/arduino-esp32/libraries/SPI/src/SPI.d 


# Each subdirectory must supply rules for building sources it contributes
components/arduino-esp32/libraries/SPI/src/%.o: ../components/arduino-esp32/libraries/SPI/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



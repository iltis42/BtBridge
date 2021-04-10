################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/MPUdriver/src/MPU.cpp \
../components/MPUdriver/src/MPUdmp.cpp 

OBJS += \
./components/MPUdriver/src/MPU.o \
./components/MPUdriver/src/MPUdmp.o 

CPP_DEPS += \
./components/MPUdriver/src/MPU.d \
./components/MPUdriver/src/MPUdmp.d 


# Each subdirectory must supply rules for building sources it contributes
components/MPUdriver/src/%.o: ../components/MPUdriver/src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



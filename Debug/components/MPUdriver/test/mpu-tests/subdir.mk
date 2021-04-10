################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/MPUdriver/test/mpu-tests/test_mpu.cpp 

OBJS += \
./components/MPUdriver/test/mpu-tests/test_mpu.o 

CPP_DEPS += \
./components/MPUdriver/test/mpu-tests/test_mpu.d 


# Each subdirectory must supply rules for building sources it contributes
components/MPUdriver/test/mpu-tests/%.o: ../components/MPUdriver/test/mpu-tests/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



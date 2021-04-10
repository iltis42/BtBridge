################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/MPUdriver/examples/mpu_real/main/mpu_real.cpp 

OBJS += \
./components/MPUdriver/examples/mpu_real/main/mpu_real.o 

CPP_DEPS += \
./components/MPUdriver/examples/mpu_real/main/mpu_real.d 


# Each subdirectory must supply rules for building sources it contributes
components/MPUdriver/examples/mpu_real/main/%.o: ../components/MPUdriver/examples/mpu_real/main/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



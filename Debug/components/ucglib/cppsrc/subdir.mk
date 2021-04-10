################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/ucglib/cppsrc/Ucglib.cpp 

OBJS += \
./components/ucglib/cppsrc/Ucglib.o 

CPP_DEPS += \
./components/ucglib/cppsrc/Ucglib.d 


# Each subdirectory must supply rules for building sources it contributes
components/ucglib/cppsrc/%.o: ../components/ucglib/cppsrc/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



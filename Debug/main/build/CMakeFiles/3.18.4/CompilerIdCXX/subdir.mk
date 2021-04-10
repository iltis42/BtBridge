################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../main/build/CMakeFiles/3.18.4/CompilerIdCXX/CMakeCXXCompilerId.cpp 

OBJS += \
./main/build/CMakeFiles/3.18.4/CompilerIdCXX/CMakeCXXCompilerId.o 

CPP_DEPS += \
./main/build/CMakeFiles/3.18.4/CompilerIdCXX/CMakeCXXCompilerId.d 


# Each subdirectory must supply rules for building sources it contributes
main/build/CMakeFiles/3.18.4/CompilerIdCXX/%.o: ../main/build/CMakeFiles/3.18.4/CompilerIdCXX/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



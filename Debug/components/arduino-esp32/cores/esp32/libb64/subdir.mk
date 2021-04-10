################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/arduino-esp32/cores/esp32/libb64/cdecode.c \
../components/arduino-esp32/cores/esp32/libb64/cencode.c 

OBJS += \
./components/arduino-esp32/cores/esp32/libb64/cdecode.o \
./components/arduino-esp32/cores/esp32/libb64/cencode.o 

C_DEPS += \
./components/arduino-esp32/cores/esp32/libb64/cdecode.d \
./components/arduino-esp32/cores/esp32/libb64/cencode.d 


# Each subdirectory must supply rules for building sources it contributes
components/arduino-esp32/cores/esp32/libb64/%.o: ../components/arduino-esp32/cores/esp32/libb64/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



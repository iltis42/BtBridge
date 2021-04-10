################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/ucglib/tools/font/otf2bdf/otf2bdf.c \
../components/ucglib/tools/font/otf2bdf/remap.c 

OBJS += \
./components/ucglib/tools/font/otf2bdf/otf2bdf.o \
./components/ucglib/tools/font/otf2bdf/remap.o 

C_DEPS += \
./components/ucglib/tools/font/otf2bdf/otf2bdf.d \
./components/ucglib/tools/font/otf2bdf/remap.d 


# Each subdirectory must supply rules for building sources it contributes
components/ucglib/tools/font/otf2bdf/%.o: ../components/ucglib/tools/font/otf2bdf/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



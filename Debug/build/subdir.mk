################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../build/project_elf_src_esp32.c 

S_UPPER_SRCS += \
../build/ca_cert.pem.S \
../build/favicon.ico.S \
../build/index.html.S \
../build/jquery-3.4.1.min.js.S \
../build/x509_crt_bundle.S 

OBJS += \
./build/ca_cert.pem.o \
./build/favicon.ico.o \
./build/index.html.o \
./build/jquery-3.4.1.min.js.o \
./build/project_elf_src_esp32.o \
./build/x509_crt_bundle.o 

C_DEPS += \
./build/project_elf_src_esp32.d 


# Each subdirectory must supply rules for building sources it contributes
build/%.o: ../build/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Assembler'
	as -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

build/%.o: ../build/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



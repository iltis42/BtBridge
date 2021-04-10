################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../components/ucglib/cppsrc_sdspi/SdSpiAVR.cpp \
../components/ucglib/cppsrc_sdspi/SdSpiArduino.cpp \
../components/ucglib/cppsrc_sdspi/SdSpiMK20DX128.cpp \
../components/ucglib/cppsrc_sdspi/SdSpiSAM3X.cpp \
../components/ucglib/cppsrc_sdspi/Ucglib.cpp 

OBJS += \
./components/ucglib/cppsrc_sdspi/SdSpiAVR.o \
./components/ucglib/cppsrc_sdspi/SdSpiArduino.o \
./components/ucglib/cppsrc_sdspi/SdSpiMK20DX128.o \
./components/ucglib/cppsrc_sdspi/SdSpiSAM3X.o \
./components/ucglib/cppsrc_sdspi/Ucglib.o 

CPP_DEPS += \
./components/ucglib/cppsrc_sdspi/SdSpiAVR.d \
./components/ucglib/cppsrc_sdspi/SdSpiArduino.d \
./components/ucglib/cppsrc_sdspi/SdSpiMK20DX128.d \
./components/ucglib/cppsrc_sdspi/SdSpiSAM3X.d \
./components/ucglib/cppsrc_sdspi/Ucglib.d 


# Each subdirectory must supply rules for building sources it contributes
components/ucglib/cppsrc_sdspi/%.o: ../components/ucglib/cppsrc_sdspi/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/nvs_flash/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



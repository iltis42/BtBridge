################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_font.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_glyph.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_map.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_parser.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_rle.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/bdf_tga.c \
../components/ucglib/tools/font/bdf2ucg_obsolete/main.c 

OBJS += \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_font.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_glyph.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_map.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_parser.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_rle.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_tga.o \
./components/ucglib/tools/font/bdf2ucg_obsolete/main.o 

C_DEPS += \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_font.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_glyph.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_map.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_parser.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_rle.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/bdf_tga.d \
./components/ucglib/tools/font/bdf2ucg_obsolete/main.d 


# Each subdirectory must supply rules for building sources it contributes
components/ucglib/tools/font/bdf2ucg_obsolete/%.o: ../components/ucglib/tools/font/bdf2ucg_obsolete/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../components/ucglib/tools/font/bdfconv/bdf_8x8.c \
../components/ucglib/tools/font/bdfconv/bdf_font.c \
../components/ucglib/tools/font/bdfconv/bdf_glyph.c \
../components/ucglib/tools/font/bdfconv/bdf_map.c \
../components/ucglib/tools/font/bdfconv/bdf_parser.c \
../components/ucglib/tools/font/bdfconv/bdf_rle.c \
../components/ucglib/tools/font/bdfconv/bdf_tga.c \
../components/ucglib/tools/font/bdfconv/fd.c \
../components/ucglib/tools/font/bdfconv/main.c 

OBJS += \
./components/ucglib/tools/font/bdfconv/bdf_8x8.o \
./components/ucglib/tools/font/bdfconv/bdf_font.o \
./components/ucglib/tools/font/bdfconv/bdf_glyph.o \
./components/ucglib/tools/font/bdfconv/bdf_map.o \
./components/ucglib/tools/font/bdfconv/bdf_parser.o \
./components/ucglib/tools/font/bdfconv/bdf_rle.o \
./components/ucglib/tools/font/bdfconv/bdf_tga.o \
./components/ucglib/tools/font/bdfconv/fd.o \
./components/ucglib/tools/font/bdfconv/main.o 

C_DEPS += \
./components/ucglib/tools/font/bdfconv/bdf_8x8.d \
./components/ucglib/tools/font/bdfconv/bdf_font.d \
./components/ucglib/tools/font/bdfconv/bdf_glyph.d \
./components/ucglib/tools/font/bdfconv/bdf_map.d \
./components/ucglib/tools/font/bdfconv/bdf_parser.d \
./components/ucglib/tools/font/bdfconv/bdf_rle.d \
./components/ucglib/tools/font/bdfconv/bdf_tga.d \
./components/ucglib/tools/font/bdfconv/fd.d \
./components/ucglib/tools/font/bdfconv/main.d 


# Each subdirectory must supply rules for building sources it contributes
components/ucglib/tools/font/bdfconv/%.o: ../components/ucglib/tools/font/bdfconv/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -I/home/gittest2/esp/esp-idf/components/log/include -I/home/gittest2/XCVario/components/MPUdriver/include -I/home/gittest2/esp/esp-idf/components/hal/include/hal -I/home/gittest2/esp/esp-idf/components/driver/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



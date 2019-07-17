#include <stdlib.h>

SRCS=main.c

STM_PERIPH=STM32F4xx_DSP_StdPeriph_Lib_V1.8.0

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
CFLAGS += --specs=nosys.specs
CFLAGS += -DUSE_STDPERIPH_DRIVER


.PHONY: FIR

all: FIR

FIR: FIR.elf

FIR.elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@ 
	$(OBJCOPY) -O binary FIR.elf FIR.bin

flash: FIR
	st-flash write FIR.bin 0x8000000

clean:
	rm -f FIR.elf FIR.bin
#include <stdlib.h>

SRCS=main.c

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS += --specs=nosys.specs

.PHONY: FIR

all: FIR

FIR: FIR.elf

FIR.elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@ 
	$(OBJCOPY) -O binary FIR.elf FIR.bin


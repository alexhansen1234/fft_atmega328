BINARY := fft.hex
ELF := fft.elf

CC := avr-gcc
CC_FLAGS := -W -c -mmcu=atmega328p

LD := avr-ld
LD_FLAGS := -e init

OBJ_COPY := avr-objcopy
OBJ_COPY_FLAGS := -O ihex

C_OBJ := $(patsubst %.c, %.o, $(wildcard *.c))
ASM_OBJ := $(patsubst %.s, %.o, $(wildcard */*.s))
C_SRC := $(wildcard */*.s)
ASM_SRC := $(wildcard */*.c)

INTERRUPT_DEFS := interrupt_vectors/interrupt_defs.o

$(BINARY): $(ELF)
	@echo Obj-Copy $(ELF) to $(BINARY)
	$(OBJ_COPY) $(OBJ_COPY_FLAGS) $(ELF) $(BINARY)

$(ELF): $(ASM_OBJ) $(C_OBJ)
	@echo Linking $(ASM_OBJ) $(C_OBJ)
	$(LD) $(LD_FLAGS) -o $(ELF) $(INTERRUPT_DEFS) $(ASM_OBJ) $(C_OBJ)

.s.o:
	@echo Assembling $<
	$(CC) $(CC_FLAGS) -o $@ $<

.c.o:
	@echo Compiling $<
	$(CC) $(CC_FLAGS) -o $@ $<

clean:
	rm -f $(BINARY) $(ELF) $(ASM_OBJ) $(C_OBJ)

push:
	make clean
	git add .
	git commit -m "update"
	git push origin master

BINARY := fft.hex
ELF := fft.elf

CC := avr-gcc
CC_FLAGS := -W -c -mmcu=atmega328p

LD := avr-ld
LD_FLAGS := -e

OBJ_COPY := avr-objcopy
OBJ_COPY_FLAGS := -O ihex

OBJ := $(patsubst %.c || %.s, %.o, $(wildcard */*.c))
SRC := $(wildcard */*.c || */*.s)

ifeq (0, 1)
$(BINARY): $(ELF)
	$(OBJ_COPY) $(OBJ_COPY_FLAGS) $(ELF) $(BINARY)

$(ELF): $(OBJ)
	$(LD) $(LD_FLAGS) $(ELF) $(OBJ)
endif

ops/%.o: ops/*.s
	$(CC) $(CC_FLAGS) -o $@ $<

ifeq (0,1)
complex_demo.hex: complex_demo.elf
	avr-objcopy -O ihex complex_demo.elf complex_demo.hex
complex_demo.elf: interrupt_defs.o main.o float16_add.o float16_sub.o float16_mul.o float16_div.o int_to_float16.o complex_add.o complex_sub.o complex_mul.o reverse_bits.o permute_input.o log2n.o fft.o complex_magnitude.o complex16_array_magnitudes.o float16_sqrt.o convert_ints_complex16_array.o convert_complex16_array_int16.o float16_to_int8.o mul_mag_colors.o display_color_array.o load_grb_val.o show.o enable_adc.o enable_timer0.o init_ws2812.o
	avr-ld -e init -o complex_demo.elf interrupt_defs.o main.o float16_add.o float16_sub.o float16_mul.o float16_div.o int_to_float16.o complex_add.o complex_sub.o complex_mul.o convert_ints_complex16_array.o reverse_bits.o permute_input.o log2n.o fft.o complex_magnitude.o complex16_array_magnitudes.o float16_sqrt.o convert_complex16_array_int16.o float16_to_int8.o mul_mag_colors.o display_color_array.o load_grb_val.o show.o enable_adc.o enable_timer0.o init_ws2812.o
main.o: main.c
	avr-gcc -W -c -mmcu=atmega328p -o main.o main.c
float16_add.o: ./ops/float16_add.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_add.o ./ops/float16_add.s
float16_sub.o: ./ops/float16_sub.s ./ops/float16_add.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_sub.o ./ops/float16_sub.s
float16_mul.o: ./ops/float16_mul.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_mul.o ./ops/float16_mul.s
float16_div.o: ./ops/float16_div.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_div.o ./ops/float16_div.s
int_to_float16.o: ./ops/int_to_float16.s
	avr-gcc -W -c -mmcu=atmega328p -o int_to_float16.o ./ops/int_to_float16.s
float16_to_int8.o: ./ops/float16_to_int8.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_to_int8.o ./ops/float16_to_int8.s
complex_add.o: ./complex/complex_add.s ./ops/float16_add.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_add.o ./complex/complex_add.s
complex_sub.o: ./complex/complex_sub.s ./complex/complex_add.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_sub.o ./complex/complex_sub.s
convert_ints_complex16_array.o: ./complex/convert_ints_complex16_array.s ./ops/int_to_float16.s
	avr-gcc -W -c -mmcu=atmega328p -o convert_ints_complex16_array.o ./complex/convert_ints_complex16_array.s
convert_complex16_array_int16.o: ./complex/convert_complex16_array_int16.s ./ops/float16_to_int8.s
	avr-gcc -W -c -mmcu=atmega328p -o convert_complex16_array_int16.o ./complex/convert_complex16_array_int16.s
complex_mul.o: ./complex/complex_mul.s ./ops/float16_add.s ./ops/float16_sub.s ./ops/float16_mul.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_mul.o ./complex/complex_mul.s
reverse_bits.o: ./fft/reverse_bits.s
	avr-gcc -W -c -mmcu=atmega328p -o reverse_bits.o ./fft/reverse_bits.s
log2n.o: ./fft/log2n.s
		avr-gcc -W -c -mmcu=atmega328p -o log2n.o ./fft/log2n.s
permute_input.o: ./fft/permute_input.s ./fft/reverse_bits.s
	avr-gcc -W -c -mmcu=atmega328p -o permute_input.o ./fft/permute_input.s
fft.o: ./fft/fft.s ./complex/complex_add.s ./complex/complex_sub.s ./complex/complex_mul.s
	avr-gcc -W -c -mmcu=atmega328p -o fft.o ./fft/fft.s
complex_magnitude.o: ./complex/complex_magnitude.s ./complex/complex_add.s ./complex/complex_mul.s ./ops/float16_sqrt.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_magnitude.o ./complex/complex_magnitude.s
complex16_array_magnitudes.o: ./complex/complex16_array_magnitudes.s ./complex/complex_magnitude.s
	avr-gcc -W -c -mmcu=atmega328p -o complex16_array_magnitudes.o ./complex/complex16_array_magnitudes.s
float16_sqrt.o: ./ops/float16_sqrt.s
	avr-gcc -W -c -mmcu=atmega328p -o float16_sqrt.o ./ops/float16_sqrt.s
interrupt_defs.o: ./interrupt_vectors/interrupt_defs.s ./interrupt_vectors/interrupt_vector_table.s
	avr-gcc -W -c -mmcu=atmega328p -o interrupt_defs.o ./interrupt_vectors/interrupt_defs.s
mul_mag_colors.o: ./complex/mul_mag_colors.s
	avr-gcc -W -c -mmcu=atmega328p -o mul_mag_colors.o ./complex/mul_mag_colors.s
display_color_array.o: ./ws2812/display_color_array.s ./ws2812/show.s
	avr-gcc -W -c -mmcu=atmega328p -o display_color_array.o ./ws2812/display_color_array.s
load_grb_val.o: ./ws2812/load_grb_val.s
	avr-gcc -W -c -mmcu=atmega328p -o load_grb_val.o ./ws2812/load_grb_val.s
show.o: ./ws2812/show.s
	avr-gcc -W -c -mmcu=atmega328p -o show.o ./ws2812/show.s
enable_adc.o: ./interrupt_vectors/enable_adc.s
	avr-gcc -W -c -mmcu=atmega328p -o enable_adc.o ./interrupt_vectors/enable_adc.s
enable_timer0.o: ./interrupt_vectors/enable_timer0.s
	avr-gcc -W -c -mmcu=atmega328p -o enable_timer0.o ./interrupt_vectors/enable_timer0.s
init_ws2812.o: ./ws2812/init_ws2812.s
	avr-gcc -W -c -mmcu=atmega328p -o init_ws2812.o ./ws2812/init_ws2812.s
clean:
		\rm *.o complex_demo.hex complex_demo.elf

push:
	make clean
	git add .
	git commit -m "update"
	git push origin master
endif

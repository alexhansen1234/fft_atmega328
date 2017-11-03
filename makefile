complex_demo.hex: complex_demo.elf
	avr-objcopy -O ihex complex_demo.elf complex_demo.hex
complex_demo.elf: main.o float16_add.o float16_sub.o float16_mul.o float16_div.o complex_add.o complex_sub.o complex_mul.o reverse_bits.o
	avr-ld -e init -o complex_demo.elf main.o float16_add.o float16_sub.o float16_mul.o float16_div.o complex_add.o complex_sub.o complex_mul.o reverse_bits.o
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
complex_add.o: ./complex/complex_add.s ./ops/float16_add.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_add.o ./complex/complex_add.s
complex_sub.o: ./complex/complex_sub.s ./complex/complex_add.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_sub.o ./complex/complex_sub.s
complex_mul.o: ./complex/complex_mul.s ./ops/float16_add.s ./ops/float16_sub.s ./ops/float16_mul.s
	avr-gcc -W -c -mmcu=atmega328p -o complex_mul.o ./complex/complex_mul.s
reverse_bits.o: ./fft/reverse_bits.s
	avr-gcc -W -c -mmcu=atmega328p -o reverse_bits.o ./fft/reverse_bits.s

clean:
		\rm *.o complex_demo.hex complex_demo.elf

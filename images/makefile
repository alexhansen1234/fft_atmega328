bmp_demp.hex: bmp_demo.elf
	avr-objcopy -O ihex bmp_demo.elf bmp_demo.hex
bmp_demo.elf: reset.o display_bmp.o lpm_u32.o lpm_u16.o lpm_u8.o mario_image.o
	avr-ld -e init -o bmp_demo.elf reset.o display_bmp.o lpm_u32.o lpm_u16.o lpm_u8.o program_address.o mario_image.o
reset.o: reset.s
	avr-gcc -Wall -pedantic-errors -c -mmcu=atmega328p -o reset.o reset.s
display_bmp.o: display_bmp.c progmem/progmem.h program_address.o
	avr-gcc -Wall -pedantic-errors -c -mmcu=atmega328p -O2 -o display_bmp.o display_bmp.c
lpm_u32.o: ./progmem/lpm_u32.s
	avr-gcc -Wall -c -mmcu=atmega328p -o lpm_u32.o ./progmem/lpm_u32.s
lpm_u16.o: ./progmem/lpm_u16.s
	avr-gcc -Wall -c -mmcu=atmega328p -o lpm_u16.o ./progmem/lpm_u16.s
lpm_u8.o: ./progmem/lpm_u8.s
	avr-gcc -Wall -c -mmcu=atmega328p -o lpm_u8.o ./progmem/lpm_u8.s
program_address.o: ./progmem/program_address.s
	avr-gcc -Wall -c -mmcu=atmega328p -o program_address.o ./progmem/program_address.s
mario_image.o: ./mario_image.s
	avr-gcc -Wall -c -mmcu=atmega328p -o mario_image.o ./mario_image.s

clean:
	rm *.o bmp_demo.elf bmp_demo.hex

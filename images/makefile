bmp_demp.hex: bmp_demo.elf
	avr-objcopy -O ihex bmp_demo.elf bmp_demo.hex
bmp_demo.elf: reset.o display_bmp.o lpm_u32.o lpm_u16.o lpm_u8.o test_image.o show.o load_rgb_val.o
	avr-ld -e init -o bmp_demo.elf reset.o display_bmp.o lpm_u32.o lpm_u16.o lpm_u8.o program_address.o show.o load_rgb_val.o test_image.o
reset.o: reset.s
	avr-gcc -Wall -pedantic-errors -c -mmcu=atmega328 -o reset.o reset.s
display_bmp.o: display_bmp.c progmem/progmem.h program_address.o
	avr-gcc -Wall -pedantic-errors -c -mmcu=atmega328 -O2 -o display_bmp.o display_bmp.c
lpm_u32.o: ./progmem/lpm_u32.s
	avr-gcc -Wall -c -mmcu=atmega328 -o lpm_u32.o ./progmem/lpm_u32.s
lpm_u16.o: ./progmem/lpm_u16.s
	avr-gcc -Wall -c -mmcu=atmega328 -o lpm_u16.o ./progmem/lpm_u16.s
lpm_u8.o: ./progmem/lpm_u8.s
	avr-gcc -Wall -c -mmcu=atmega328 -o lpm_u8.o ./progmem/lpm_u8.s
program_address.o: ./progmem/program_address.s
	avr-gcc -Wall -c -mmcu=atmega328 -o program_address.o ./progmem/program_address.s
load_rgb_val.o: load_rgb_val.s
	avr-gcc -Wall -c -mmcu=atmega328 -o load_rgb_val.o load_rgb_val.s
show.o: show.s
	avr-gcc -Wall -c -mmcu=atmega328 -o show.o show.s
mario_image.o: ./mario_image.s
	avr-gcc -Wall -c -mmcu=atmega328 -o mario_image.o ./mario_image.s
test_image.o: ./test_image.s
	avr-gcc -Wall -c -mmcu=atmega328 -o test_image.o ./test_image.s

clean:
	rm *.o bmp_demo.elf bmp_demo.hex

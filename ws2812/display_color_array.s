SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* extern void display_color_array (complex * array, uint16_t N_SAMPLES, uint16_t N_LEDS ); */
.global display_color_array
.text
display_color_array:
push  r31
push  r30
push  r29
push  r28
lsr   r22
subi  r22,  1
movw  r30,  r24
adiw  r30,  4
cli

display_loop:
ldd   r25,  Z+2
ldd   r24,  Z+1
ld    r23,  Z
call  load_grb_val
adiw  r30,  4
subi  r22,  1
brne  display_loop
call  show
pop r28
pop r29
pop r30
pop r31
ret

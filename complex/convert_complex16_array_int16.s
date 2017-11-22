SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* extern void __convert_complex16_array_int16 (complex16 * array, uint8_t n_items); */
.global __convert_complex16_array_int16
.text
__convert_complex16_array_int16:
push  r31
push  r30
push  r29
push  r28
push  r22
in  r29,  SPH
in  r28,  SPL

movw  r30,  r24
convert_loop:
ldd   r25,  Z+1
ld    r24,  Z
call  __float16_to_int8
std   Z+1,  r25
st    Z,    r24
adiw  r30,  4
ldd   r25,  Y+1
subi  r25,  1
std   Y+1,  r25
brne  convert_loop

pop _temp_reg_
pop r28
pop r29
pop r30
pop r31
ret

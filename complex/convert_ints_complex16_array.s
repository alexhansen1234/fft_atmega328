SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01


.global __convert_ints_complex16_array
.text
__convert_ints_complex16_array:
push  r31
push  r30
push  r29
push  r28
push  r22
in    r29,  SPH
in    r28,  SPL
movw  r30,  r24

convert_loop:
ld    r24,  Z
ldd   r25,  Z+1
call  __int16_to_float16
st    Z,    r24
std   Z+1,  r25
ldd   r22,  Y+1
subi  r22,  1
std   Y+1,  r22
adiw  r30,  4
cpi   r22,  0
brne  convert_loop

pop _temp_reg_
pop r28
pop r29
pop r30
pop r31
ret

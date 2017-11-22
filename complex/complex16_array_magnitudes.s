SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* extern void __complex16_array_magnitudes (complex16 * array, uint8_t n_items); */
.global __complex16_array_magnitudes
.text
__complex16_array_magnitudes:
push  r31
push  r30
push  r29
push  r28
push  r22
movw  r30,  r24

cpx_mag_loop:
ld    r22,  Z
ldd   r23,  Z+1
ldd   r24,  Z+2
ldd   r25,  Z+3
call  __complex_magnitude
st    Z,    r24
std   Z+1,  r25
std   Z+2,  _zero_reg_
std   Z+3,  _zero_reg_
adiw  r30,  4
ldd   r22,  Y+1
subi  r22,  1
std   Y+1,  r22
cpi   r22,  0
brne  cpx_mag_loop

pop _temp_reg_
pop r28
pop r29
pop r30
pop r31
ret

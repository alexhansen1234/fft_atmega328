SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* extern void __mul_mag_colors(complex16 *mags, uint8_t *colors, uint16_t N_SAMPLES); */
.global __mul_mag_colors
.text
__mul_mag_colors:
push  r31
push  r30
push  r29
push  r28
movw  r30,  r24
movw  r28,  r22
lsr   r20
dec   r20
adiw  r30,  4


loop:
ld    r16,  Z
ld    r17,  Y
mul   r16,  r17
st    Z,    r1
clr   _zero_reg_

ldd   r17,  Y+1
mul   r16,  r17
std   Z+1,  r1
clr   _zero_reg_

ldd   r17,  Y+2
mul   r16,  r17
std   Z+2,  r1
clr   _zero_reg_

adiw  r30,  4
adiw  r28,  3
subi  r20,  1
brne  loop

pop r28
pop r29
pop r30
pop r31
ret

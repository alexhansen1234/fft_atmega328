_temp_reg_ = 0x00
_zero_reg_ = 0x01
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
/* float16 __float16_sqrt(float16); */
/* approximates the square root of a 16 bit floating point number */
/* argument is expected to be positive */
.global __float16_sqrt
.text
__float16_sqrt:
lsr r25
ror r24
ldi r23,  0x1F
ldi r22,  0x6C
add r22,  r24
adc r23,  r25
ret

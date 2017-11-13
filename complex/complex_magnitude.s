_temp_reg_ = 0x00
_zero_reg_ = 0x01
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
/*
  float16 __complex_mag(complex16 a)
 */

.global __complex_mag
.text
__complex_mag:
push  r29
push  r28
rcall .
push  r23
push  r22
in  r29,  SPH
in  r28,  SPL
movw  r22,  r24
call  __float16_mul
std   Y+4,  r25
std   Y+3,  r24
ldd   r25,  Y+2
ldd   r24,  Y+1
call  __float16_mul
ldd   r23,  Y+4
ldd   r22,  Y+3
call  __float16_add
call  __float16_sqrt
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   r28
pop   r29
ret

_temp_reg_ = 0x00
_zero_reg_ = 0x01
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
/*
  float16 __complex_mag(complex16 a);
  approximates the magnitude of a complex number
  __complex_mag ~= (a*a + b*b)^(1/2)
 */

.global __complex_magnitude
.text
__complex_magnitude:
cp  _zero_reg_, r25
cpc _zero_reg_, r24
cpc _zero_reg_, r23
cpc _zero_reg_, r22
breq  return_zero

push  r31
push  r30
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
movw  r22,  r24
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
pop   r30
pop   r31

return_zero:

ret

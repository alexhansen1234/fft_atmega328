_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int16_t __float16_mul(int16_t arg1, int16_t arg2); */

.global __float16_mul
.text
__float16_mul:
push  r29
push  r28
push  r23
push  r22
push  r25
push  r24
rcall .
in    r28,  SPL
in    r29,  SPH

eor   _temp_reg_, _temp_reg_
eor   _zero_reg_, _zero_reg_
dec   _temp_reg_
rjmp  mul_procedure

return_zero:
mov   r24,  _zero_reg_
mov   r25,  _zero_reg_
rjmp  epilogue

return_inf:
ldd   r25,  Y+4
ldd   r23,  Y+6
eor   r25,  r23
ori   r25,  0x7F
ldi   r24,  0xFF
rjmp  epilogue

mul_procedure:
cp    _zero_reg_, r24
cpc   _zero_reg_, r25
breq  return_zero

ori   r25,  0x80
cp    r25,  _temp_reg_
cpc   r24,  _temp_reg_
breq  return_inf

cp    _zero_reg_, r22
cpc   _zero_reg_, r23
breq  return_zero

ori   r23,  0x80
cp    r22,  _temp_reg_
cpc   r23,  _temp_reg_
breq  return_inf

andi  r25,  0x7F
andi  r23,  0x7F
subi  r25,  0x3F
add   r25,  r23
brvs  return_inf
brmi  return_zero
std   Y+2,  r25

eor   r16,  r16
eor   r17,  r17
ldi   r19,  8
ldi   r25,  0x01
ldi   r23,  0x01

shift_add_loop:
lsr   r25
ror   r24
brcc  rotate_sum
add   r16,  r22
adc   r17,  r23
rotate_sum:
lsr   r17
ror   r16
dec   r19
cpi   r19,  0
brne  shift_add_loop
add   r16,  r22
adc   r17,  r23

cpi   r17,  0x01
breq  return_mantissa
lsr   r17
ror   r16
inc   r19

return_mantissa:
ldd   r25,  Y+2
add   r25,  r19
ldd   r22,  Y+4
ldd   r23,  Y+6
eor   r22,  r23
andi  r22,  0x80
or    r25,  r22
mov   r24,  r16

epilogue:
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   _temp_reg_
pop   r28
pop   r29
ret

_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int16_t __float16_add(int16_t arg1, int16_t arg2); */

.global __float16_add
.text
__float16_add:
push  r29
push  r28
rcall .       ;; Exponent Difference
rcall .       ;; 0 if same sign, non-zero if different sign
push  r23
push  r22
push  r25
push  r24
in    r29,  SPH
in    r28,  SPL

eor   _zero_reg_, _zero_reg_
eor   _temp_reg_, _temp_reg_
dec   _temp_reg_

cp    _zero_reg_, r25
cpc   _zero_reg_, r24
breq  return_arg2

cp    _zero_reg_, r23
cpc   _zero_reg_, r22
breq  return_arg1

ori   r25,  0x80
cp    r25,  _temp_reg_
cpc   r24,  _temp_reg_
breq  return_arg1

ori   r23,  0x80
cp    r23,  _temp_reg_
cpc   r24,  _temp_reg_
breq  return_arg2

cp    r25,  r23
brne  exit_intro
cp    r24,  r22
brne  exit_intro
ldd   r25,  Y+2
ldd   r23,  Y+4
cp    r25,  r23
breq  return_double
rjmp  return_zero

return_arg1:
ldd   r25,  Y+2
ldd   r24,  Y+1
rjmp  epilogue

return_arg2:
ldd   r25,  Y+4
ldd   r24,  Y+3
rjmp  epilogue

return_zero:
ldi   r25,  0
ldi   r24,  0
rjmp  epilogue

return_double:
ldd   r25,  Y+2
andi  r25,  0x7F
inc   r25
brvs  return_inf
ldd   r24,  Y+2
andi  r24,  0x80
or    r25,  r24
ldd   r24,  Y+1
rjmp  epilogue

exit_intro:
ldd   r25,  Y+2
ldd   r23,  Y+4
andi  r25,  0x7F
andi  r23,  0x7F
sub   r25,  r23
cpi   r25,  9
brge  return_arg1
cpi   r25,  -8
brlt  return_arg2
cpi   r25,  0
breq  cmp_mants
brge  arg1_larger
rjmp  arg2_larger

cmp_mants:
cp    r24,  r22
brsh  arg1_larger

arg2_larger:
neg   r25
std   Y+6,  r25
ldd   r17,  Y+4
ldd   r16,  Y+3
ldd   r19,  Y+2
ldd   r18,  Y+1
std   Y+2,  r17
std   Y+1,  r16
std   Y+4,  r19
std   Y+3,  r18
rjmp  shift_mant

arg1_larger:
std   Y+6,  r25

shift_mant:
ldd   r25,  Y+2
ldd   r24,  Y+4
eor   r25,  r24
andi  r25,  0x80
ldd   r16,  Y+1
ldi   r17,  0x01
ldd   r18,  Y+3
ldi   r19,  0x01
ldd   r20,  Y+6
cpi   r25,  0
breq  positive_shift

negative_shift:
com   r18
com   r19
add   r18,  r17
adc   r19,  _zero_reg_
rjmp  negative_shift_test
negative_shift_loop:
sec
ror   r19
ror   r18
dec   r20
negative_shift_test:
cpi   r20,  0
brne  negative_shift_loop
rjmp  add_mants

return_inf:
ldd   r25,  Y+2
ori   r25,  0x7F
ldi   r24,  0xFF
rjmp  epilogue

positive_shift:
rjmp  positive_shift_test
positive_shift_loop:
lsr   r19
ror   r18
dec   r20
positive_shift_test:
cpi   r20,  0
brne  positive_shift_loop

add_mants:
add   r16,  r18
adc   r17,  r19
cpi   r17,  0x01
breq  store_result
brsh  final_mant_shift_right
rjmp  final_mant_shift_left

final_mant_shift_right:
cp    _zero_reg_, r17
cpc   _zero_reg_, r16
breq  adj_exp
lsr   r17
ror   r16
inc   r20
cpi   r17,  0x01
brne  final_mant_shift_right
rjmp  adj_exp

final_mant_shift_left:
cp    _zero_reg_, r17
cpc   _zero_reg_, r16
breq  adj_exp
lsl   r16
rol   r17
dec   r20
cpi   r17,  0x01
brne  final_mant_shift_left

adj_exp:
ldd   r25,  Y+2
andi  r25,  0x7F
add   r25,  r20
brmi  return_inf
ldd   r24,  Y+2
andi  r24,  0x80
or    r25,  r24
std   Y+2,  r25

store_result:
ldd   r25,  Y+2
mov   r24,  r16

epilogue:
adiw  r28,  8
out   SPH,  r29
out   SPL,  r28
pop   r28
pop   r29
ret

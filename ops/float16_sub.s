_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int16_t __float16_sub(int16_t arg1, int16_t arg2); */

.global __float16_sub
.text
__float16_sub:
cp    _zero_reg_, r23
cpc   _zero_reg_, r22
breq  second_op_zero

ldi   r20,  0x80
eor   r23,  r20
second_op_zero:
call  __float16_add
ret

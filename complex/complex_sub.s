_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int32_t __complex_sub(int32_t arg1, int32_t arg2); */
.global __complex_sub
.text
__complex_sub:
ldi   r16,  0x80
cp    _zero_reg_, r21
cpc   _zero_reg_, r20
breq  jmp1
eor   r21,  r16
jmp1:
cp    _zero_reg_, r19
cpc   _zero_reg_, r18
breq  jmp2
eor   r19,  r16
jmp2:
call  __complex_add
ret

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
eor   r21,  r16
eor   r19,  r16
call  __complex_add
ret   

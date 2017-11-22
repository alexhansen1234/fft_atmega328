SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* extern int8 __float16_to_int8(float16 a); */
/* does divide by 4 to get ready for multiplying RGB bytes */
.global __float16_to_int8
.text
__float16_to_int8:
push  r29
push  r28
push  r25
push  r24
in  r29,  SPH
in  r28,  SPL

mov   r16,  r24
ldi   r17,  1

andi  r25,  0x7F
subi  r25,  (0x3F + 8)
cpi   r25,  2
brge  ret_max
cpi   r25,  -8
brlt  ret_zero
tst   r25
brbs  1,  shift_none
brbs  2,  shift_right
rjmp  shift_left

ret_max:
ldi r25,  0x00
ldi r24,  0xFF
rjmp  epilogue

ret_zero:
eor r25,  r25
eor r25,  r25
rjmp  epilogue

shift_left_loop:
lsl   r16
rol   r17
dec   r25
shift_left:
tst   r25
brne  shift_left_loop
rjmp  load_result

shift_right_loop:
lsr   r17
ror   r16
inc   r25
shift_right:
tst   r25
brne  shift_right_loop
rjmp  load_result

shift_none:
load_result:
movw  r24,  r16
lsr   r25
ror   r24
lsr   r25
ror   r24

epilogue:
pop _temp_reg_
pop _temp_reg_
pop r28
pop r29
ret

_temp_reg_ = 0
_zero_reg_ = 1
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f

/*
  void permute_input(void * array, uint8_t elem_size, uint16_t n_elem);
 */

.global permute_input
.text
permute_input:
push  r29
push  r28
              /* Y+10 current offset for swap high byte */
rcall .       /* Y+9 current offset for swap low byte */
rcall .       /* Y+8 log2(n) high byte */
              /* Y+7 log2(n) low byte */
push  r25     /* Y+6 base address of input array high byte */
push  r24     /* Y+5 base address of input array low byte */
push  r23     /* Y+4 size of elements high byte */
push  r22     /* Y+3 size of elements low byte */
push  r21     /* Y+2 number of elements in array high byte */
push  r20     /* Y+1 number of elements in array low byte */

in  r29,  SPH
in  r28,  SPL

movw r24, r20
call  log2n
std Y+8,  r25
std Y+7,  r24

ldi r25,  0
ldi r24,  1
std Y+9,  r24
std Y+10, r25

swap_init:
ldd r25,  Y+10
ldd r24,  Y+9
ldd r23,  Y+8
ldd r22,  Y+7
call  reverse_bits
ldd r23,  Y+10
ldd r22,  Y+9
cp  r22,  r24
cpc  r23,  r25
brsh  _continue

swap_load:
ldd r31,  Y+6
ldd r30,  Y+5

movw r26, r30

ldd r20,  Y+3
rjmp  offset_shift_test
offset_shift:
lsl r22
rol r23
lsl r24
rol r25
lsr r20
offset_shift_test:
cpi r20,  1
brne  offset_shift


add r26,  r22
adc r27,  r23

add r30,  r24
adc r31,  r25

ldd r20,  Y+3

swap_loop:
ld  r16,  X
ld  r17,  Z
st  Z+,   r16
st  X+,   r17
subi  r20,  1
brne  swap_loop

_continue:
ldi r16,  1
ldd r22,  Y+9
ldd r23,  Y+10
add r22,  r16
adc r23,  _zero_reg_
std Y+9,  r22
std Y+10, r23
ldd r25,  Y+2
ldd r24,  Y+1
cp  r25,  r23
brne swap_init
cp  r24,  r22
brne swap_init

epilogue:
adiw  r28,  10
out SPH,  r29
out SPL,  r28
pop r28
pop r29
ret

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
in  r29,  SPH
in  r28,  SPL
eor _temp_reg_, _temp_reg_
inc _temp_reg_
mov r16,  r20
mov r17,  r21
cp  _temp_reg_, r22
cpc _zero_reg_, r23
breq  init_stack
mov r18,  r22

calc_stack_size:
lsr r18
lsl r16
rol r17
cpi r18,  1
brne  calc_stack_size

init_stack:
sub r28,  r16
sbc r29,  r17
out SPH,  r29
out SPL,  r28
inc   r28
adc   r28,  _zero_reg_
push  r29       /* Y+14 permuted array base addr high */
push  r28       /* Y+13 permuted array base addr low */
rcall .         /* Y+12 temp array size in bytes high */
                /* Y+11 temp array size in bytes low */
rcall .         /* Y+10 log2(n) high */
                /* Y+9 log2(n) low */
rcall .         /* Y+8 current swap index high */
                /* Y+7 current swap index low */
push  r25       /* Y+6 input array base addr high */
push  r24       /* Y+5 input array base addr low */
push  r23       /* Y+4 data type width high */
push  r22       /* Y+3 data type width low */
push  r21       /* Y+2 N elements high */
push  r20       /* Y+1 N elements low */
in    r29,  SPH
in    r28,  SPL
std   Y+12, r17
std   Y+11, r16
std   Y+8,  _zero_reg_
std   Y+7,  _zero_reg_

calc_log2n:
ldd   r17,  Y+2
ldd   r16,  Y+1
eor   r18,  r18
eor   r19,  r19
subi  r16,  1
sbci  r17,  0
rjmp  calc_log2n_test
calc_log2n_loop:
lsr   r17
ror   r16
add   r18,  _temp_reg_
adc   r19,  _zero_reg_
calc_log2n_test:
cp  _zero_reg_, r16
cpc _zero_reg_, r17
brne  calc_log2n_loop
std   Y+10, r19
std   Y+9,  r18

calc_bit_reversal:
ldd   r25,  Y+8
ldd   r24,  Y+7
ldd   r23,  Y+10
ldd   r22,  Y+9
call  reverse_bits

ldd   r17,  Y+8
ldd   r16,  Y+7
mov   r19,  r25
mov   r18,  r24
ldd   r21,  Y+4
ldd   r20,  Y+3
rjmp  calc_offset_test
calc_offset_loop:
lsl   r16
rol   r17
lsl   r18
rol   r19
lsr   r21
ror   r20
calc_offset_test:
cp    _temp_reg_,  r20
cpc   _zero_reg_,  r21
brne  calc_offset_loop

ldd   r27,  Y+14
ldd   r26,  Y+13
ldd   r31,  Y+6
ldd   r30,  Y+5

add   r26,  r16
adc   r27,  r17
add   r30,  r18
adc   r31,  r19

ldd   r17,  Y+4
ldd   r16,  Y+3

store_loop:
ld    r18,  Z+
st    X+,   r18
subi  r16,  1
sbci  r17,  0
cp    _zero_reg_, r16
cpc   _zero_reg_, r17
brne  store_loop

ldd   r17,  Y+8
ldd   r16,  Y+7
add   r16,  _temp_reg_
adc   r17,  _zero_reg_
ldd   r19,  Y+2
ldd   r18,  Y+1
cp    r18,  r16
cpc   r19,  r17
breq  store_to_original_array
std   Y+8,  r17
std   Y+7,  r16
rjmp  calc_bit_reversal

store_to_original_array:
ldd   r27,  Y+14
ldd   r26,  Y+13
ldd   r31,  Y+6
ldd   r30,  Y+5
ldd   r17,  Y+12
ldd   r16,  Y+11
store_to_original_array_loop:
ld    r18,  X+
st    Z+,   r18
subi  r16,  1
sbci  r17,  0
cp    _zero_reg_, r16
cpc   _zero_reg_, r17
brne  store_to_original_array_loop

epilogue:
ldd   r17,  Y+12
ldd   r16,  Y+11
adiw  r28,  14
add   r28,  r16
adc   r29,  r17
out   SPH,  r29
out   SPL,  r28
pop   r28
pop   r29
ret

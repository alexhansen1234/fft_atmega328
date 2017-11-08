SPH = 0x3e
SPL = 0x3d
SREG = 0x3f
_temp_reg_ = 0
_zero_reg_ = 1
_j = 2
_i = 3
_k = 4
_l = 5
_n = 6

/*
  void fft_s(complex16 *input, complex16 *twiddles, uint16_t n_items, uint16_t inverse);
  function limited two 256 input values
 */
.global fft_s
.text
fft_s:
push  r29
push  r28
push  r25 /* Y+8 input array base high byte */
push  r24 /* Y+7 input array base low byte */
push  r23 /* Y+6 twiddle array base high byte */
push  r22 /* Y+5 twiddle array base low byte */
push  r21 /* Y+4 n_items high byte */
push  r20 /* Y+3 n_items low byte */
push  r19 /* Y+2 inverse high byte */
push  r18 /* Y+1 inverse low byte */

/* Initialize loop counters */
ldi _j, 1
ldi _i, 0
ldi _k, 0
ldd _l, Y+3
mov _n, _l
lsr _l

.L1.test:
cp  _j, _n
breq  epilogue

.L2.test:
cp  _i, _n
breq L1

.L3.test:
cp  _k, _j
breq L2

.L3:
ldd r31,  Y+6
ldd r30,  Y+5

mov r24,  _k
mov r25,  _l
mul r24,  r25
add r30,  r0
adc r31,  r1

eor _zero_reg_, _zero_reg_


ld  r22,  Z
ldd r23,  Z+1
ldd r24,  Z+2
ldd r25,  Z+3

ldd r31,  Y+8
ldd r30,  Y+7

add r30,  _j
adc r31,  _zero_reg_

add r30,  _i
adc r31,  _zero_reg_

movw r26,  r30

add r30,  _k
adc r31,  _zero_reg_

ld  r18,  Z
ldd r19,  Z+1
ldd r20,  Z+2
ldd r21,  Z+3

call __complex_mul

ld  r18,  X
ldd r19,  X+1
ldd r20,  X+2
ldd r21,  X+3

movw  r12,  r22
movw  r14,  r24

call  _complex_sub

st    X,    r22
std   X+1,  r23
std   X+2,  r24
std   X+3,  r25

mov r22,  r12
mov r24,  r14

call _complex_add

st    Z,    r22
std   Z+1,  r23
std   Z+2,  r24
std   Z+3,  r25

inc _k
.L2:
lsl _j
add _i, _j
.L1:
rjmp .L1.test

epilogue:
adiw  r28,  8
out SPH,  r29
out SPL,  r28
pop r28
pop r29
ret

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
          /* Y+16 */
rcall .   /* Y+15  Twiddle * Odd High Two Bytes */
          /* Y+14 */
rcall .   /* Y+13 Twiddle * Odd Low Two Bytes */
          /* Y+12 */
rcall .   /* Y+11 Even High Two Bytes */
          /* Y+10 */
rcall .   /* Y+9 Even Low Two Bytes */
push  r25 /* Y+8 input array base high byte */
push  r24 /* Y+7 input array base low byte */
push  r23 /* Y+6 twiddle array base high byte */
push  r22 /* Y+5 twiddle array base low byte */
push  r21 /* Y+4 n_items high byte */
push  r20 /* Y+3 n_items low byte */
push  r19 /* Y+2 inverse high byte */
push  r18 /* Y+1 inverse low byte */
in  r29,  SPH
in  r28,  SPL

loop1_init:
clr _j
inc _j
ldd _n, Y+3
cp  _j, _n
breq  out_loop1_ex
mov _l, _n
lsr _l

loop1_conditional:

loop2_init:
clr _i

loop2_conditional:
cp  _i, _n
breq  out_loop2_ex

loop3_init:
clr _k

loop3_conditional:
cp  _k, _j
breq  out_loop3_ex

/* Start FFT Computations */
mov r25,  _k
mov r24,  _l
mul r24,  r25
lsl r0
rol r1
lsl r0
rol r1

ldd r31,  Y+6
ldd r30,  Y+5
add r30,  r0
adc r31,  r1
clr _zero_reg_

ldd r25,  Z+3
ldd r24,  Z+2
ldd r23,  Z+1
ld  r22,  Z

ldd r27,  Y+8
ldd r26,  Y+7
mov r16,  _i
clr r17
add r16,  _k
lsl r16
rol r17
lsl r16
rol r17
add r26,  r16
adc r27,  r17
movw  r30,  r26
mov r16,  _j
clr r17
lsl r16
rol r17
lsl r16
rol r17
add r30,  r16
adc r31,  r17
rjmp  forward

out_loop1_ex:
rjmp  out_loop1
out_loop2_ex:
rjmp  out_loop2
out_loop3_ex:
rjmp  out_loop3

forward:
ldd r21,  Z+3
ldd r20,  Z+2
ldd r19,  Z+1
ld  r18,  Z

call  __complex_mul

std Y+16, r25
std Y+15, r24
std Y+14, r23
std Y+13, r22

ld  r18,  X+
ld  r19,  X+
ld  r20,  X+
ld  r21,  X

sbiw  r26,  3

std Y+12, r21
std Y+11, r20
std Y+10, r19
std Y+9,  r18

call  __complex_add

st  X+, r22
st  X+, r23
st  X+, r24
st  X,  r25

ldd r25,  Y+12
ldd r24,  Y+11
ldd r23,  Y+10
ldd r22,  Y+9
ldd r21,  Y+16
ldd r20,  Y+15
ldd r19,  Y+14
ldd r18,  Y+13

call  __complex_sub

std Z+3,  r25
std Z+2,  r24
std Z+1,  r23
st  Z,    r22

/* End FFT Computations */

inc _k
rjmp  loop3_conditional
out_loop3:

loop2_increments:
mov _temp_reg_, _j
lsl _temp_reg_
add _i, _temp_reg_
cp  _i, _n
rjmp  loop2_conditional

out_loop2:

loop1_increments:
lsl _j
cp  _j, _n
breq  out_loop1
mov _l, _n
mov _temp_reg_, _j
rjmp  shift_l_test
shift_l:
lsr _l
lsr _temp_reg_

shift_l_test:
cp  _temp_reg_, _zero_reg_
brne  shift_l

rjmp  loop1_conditional
out_loop1:

epilogue:
adiw  r28, 16
out SPH,  r29
out SPL,  r28
pop r28
pop r29
ret

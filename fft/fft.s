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
rcall .   /* Y+15 Odd High Two Bytes */
          /* Y+14 */
rcall .   /* Y+13 Odd Low Two Bytes */
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
breq  out_loop1
mov _l, _n
lsr _l

loop1_conditional:

loop2_init:
clr _i

loop2_conditional:
cp  _i, _n
breq  out_loop2

loop3_init:
clr _k

loop3_conditional:
cp  _k, _j
breq  out_loop3

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

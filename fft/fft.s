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

/* Initialize loop counters */
eor _j, _j
inc _j
eor _i, _i
eor _k, _k
ldd _l, Y+3
mov _n, _l
lsr _l

/* for(j = 1; j<n; j = j<<1) */
.L1.test:
cp    _j, _n
breq  out

/* for(i = 0; i<n; i = i + j<<1) */
.L2.test:
cp  _i, _n
breq .L1jmp

/* for(k = 0, l = (n>>1)>>j; k<j; k++)
.L3.test:
cp  _k, _j
breq .L2

.L3:
/* Twiddle Array base address */
ldd r31,  Y+6
ldd r30,  Y+5

/* calculate k*l */
mov r25,  _l
mov r24,  _k
mul r24,  r25

/* shift k*l four left to get twiddle offset */
lsl r0
rol r1
lsl r0
rol r1
add r30,  r0
adc r31,  r1
eor _zero_reg_, _zero_reg_

/* Load Twiddle Factor for multiplication*/
ld  r22,  Z
ldd r23,  Z+1
ldd r24,  Z+2
ldd r25,  Z+3

/* Calculate Even Term Offset */
eor r26,  r26
eor r27,  r27
add r26,  _i
adc r27,  _zero_reg_
add r26,  _k
adc r27,  _zero_reg_
lsl r26
rol r27
lsl r26
rol r27
ldd r31,  Y+8
ldd r30,  Y+7
add r26,  r30
adc r27,  r31
rjmp skip1
.L1jmp:
rjmp  .L1

skip1:
mov r30,  _j
clr r31
lsl r30
rol r31
lsl r30
rol r31
add r30,  r26
adc r31,  r27
rjmp skip2
out:
rjmp  epilogue
skip2:
/* Load Odd Term for Complex Mul */
ld  r18,  Z
ldd r19,  Z+1
ldd r20,  Z+2
ldd r21,  Z+3

/* Mul twiddle with odd term */
call __complex_mul

std Y+16, r25
std Y+15, r24
std Y+14, r23
std Y+13, r22

ld  r18,  X+
ld  r19,  X+
ld  r20,  X+
ld  r21,  X

std Y+12, r21
std Y+11, r20
std Y+10, r19
std Y+9,  r18

sbiw  r26,  3

call __complex_add

st  X+, r22
st  X+, r23
st  X+, r24
st  X,  r25

sbiw  r26,  3

ldd r25,  Y+12
ldd r24,  Y+11
ldd r23,  Y+10
ldd r22,  Y+9

ldd r21,  Z+3
ldd r20,  Z+2
ldd r19,  Z+1
ld  r18,  Z

call  __complex_sub

std Z+3,  r25
std Z+2,  r24
std Z+1,  r23
st  Z,    r22
.L2_:
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

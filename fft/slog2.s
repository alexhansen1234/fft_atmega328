_temp_reg_ = 0x00
_zero_reg_ = 0x01
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f

.global slog2
.text
slog2:
ldi   r16,  1
eor   r23,  r23
eor   r22,  r22
subi  r24,  1
sbci  r25,  0
rjmp  log2_loop_test
log2_loop:
lsr   r25
ror   r24
add   r22,  r16
adc   r23,  _zero_reg_
log2_loop_test:
cp  _zero_reg_, r24
cpc _zero_reg_, r25
brne  log2_loop
mov   r24,  r22
mov   r25,  r23
ret

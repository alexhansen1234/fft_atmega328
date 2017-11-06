_temp_reg_ = 0x00
_zero_reg_ = 0x01
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f

.global log2n
.text
log2n:
subi  r24,  1
sbci  r25,  0
movw  r18,  r24
eor   r24,  r24
eor   r25,  r25
cp    r18,  _zero_reg_
cpc   r19,  _zero_reg_
breq  log2n_end
log2n_loop:
lsr   r19
ror   r18
adiw  r24,  1
cp    r18,  _zero_reg_
cpc   r19,  _zero_reg_
brne  log2n_loop
log2n_end:
ret

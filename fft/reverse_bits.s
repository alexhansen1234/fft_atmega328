_temp_reg_ = 0
_zero_reg_ = 1
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f

.global reverse_bits
.text
reverse_bits:
  eor r17,  r17
  eor r16,  r16
  shift_loop1:
  lsr r25
  ror r24
  rol r16
  rol r17
  subi  r22, 1
  brne  shift_loop1
  mov r24,  r16
  mov r25,  r17
  ret

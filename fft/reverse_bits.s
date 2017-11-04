_temp_reg_ = 0
_zero_reg_ = 1
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f

.global reverse_bits
.text
reverse_bits:
  eor r16,  r16
  shift_loop1:
  lsr r24
  rol r16
  subi  r22, 1
  brne  shift_loop1
  mov r24,  r16
  ret

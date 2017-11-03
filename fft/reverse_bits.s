.global reverse_bits
.text
reverse_bits:
  eor r16,  r16
  shift_loop1:
  lsr r24
  rol r16
  dec r22
  brne  shift_loop1
  mov r24,  r16
  ret

.global reverse_bits
.text
reverse_bits:
  eor r16,  r16
  eor r17,  r17
  shift_loop1:
  lsr r24
  rol r16
  inc r17
  cpi r22,  0
  brne  shift_loop
  cp  r22,  r17
  breq  epilogue
  shift_loop2:
  lsl r16
  inc r17
  cp  r17,  r22
  brne  shift_loop2
  epilogue:
  ret

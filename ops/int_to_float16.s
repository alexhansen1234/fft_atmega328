_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int16_t __int16_to_float16(int16_t arg1); */
.global __int16_to_float16
.text
__int16_to_float16:
  push  r29
  push  r28
  push  r25
  push  r24
  in    r29,  SPH
  in    r28,  SPL
  eor   _zero_reg_, _zero_reg_
  cp    _zero_reg_, r25
  cpc   _zero_reg_, r24
  breq  epilogue

  eor   _temp_reg_, _temp_reg_
  inc   _temp_reg_
  mov   r17,  r25
  mov   r16,  r24
  eor   r25,  r25
  eor   r24,  r24
  subi  r25,  -63
  andi  r17,  0x80
  breq  restore_high
  ldd   r17,  Y+2
  com   r17
  com   r16
  add   r16,  _temp_reg_
  adc   r17,  _zero_reg_
  ori   r25,  0x80
  rjmp  shift_to_one

  restore_high:
  ldd   r17,  Y+2
  rjmp  shift_to_one

  shift_to_one_loop:
  lsr   r17
  ror   r16
  ror   r24
  inc   r25
  shift_to_one:
  cp    _zero_reg_, r17
  cpc   r16, _temp_reg_
  brne  shift_to_one_loop

  epilogue:
  pop   _temp_reg_
  pop   _temp_reg_
  pop   r28
  pop   r29
  ret

_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int16_t __float16_div(int16_t arg1, int16_t arg2); */
.global __float16_div
.text
__float16_div:
  push  r29
  push  r28
  push  r23
  push  r22
  push  r25
  push  r24
  in    r29,  SPH
  in    r28,  SPL
  eor   _zero_reg_, _zero_reg_
  eor   _temp_reg_, _temp_reg_
  dec   _temp_reg_

  cp    _zero_reg_, r25
  cpc   _zero_reg_, r24
  breq  return_zero

  cp    _zero_reg_, r23
  cpc   _zero_reg_, r22
  breq  return_inf

  ori   r25,  0x80
  cp    r25,  _temp_reg_
  cpc   r24,  _temp_reg_
  breq  return_inf

  ori   r23,  0x80
  cp    r23,  _temp_reg_
  cpc   r22,  _temp_reg_
  breq  return_zero
  rjmp  calc_exp

  return_inf:
  ldi   r25,  0x7F
  ldi   r24,  0xFF
  ldd   r23,  Y+2
  ldd   r22,  Y+4
  eor   r23,  r22
  andi  r23,  0x80
  or    r25,  r23
  rjmp  epilogue

  return_zero:
  mov   r25,  _zero_reg_
  mov   r24,  _zero_reg_
  rjmp  epilogue

  calc_exp:
  andi  r23,  0x7F
  andi  r25,  0x7F
  sub   r25,  r23
  subi  r25,  -63
  brvs  return_inf
  brmi  return_zero
  ldd   r17,  Y+2
  ldd   r16,  Y+4
  eor   r17,  r16
  andi  r17,  0x80
  or    r25,  r17

  mov   r16,  r24
  mov   r18,  r22
  ldi   r17,  0x01
  ldi   r19,  0x01
  eor   r20,  r20
  eor   r21,  r21
  ldi   r23,  0x00

  shift_loop:
  cp    r16,  r18
  cpc   r17,  r19
  brmi  shift_in_zero

  shift_in_one:
  sub   r16,  r18
  sbc   r17,  r19
  sec
  rol   r20
  rol   r21
  inc   r23
  lsl   r16
  rol   r17
  cpi   r21,  0x01
  brne  shift_loop
  rjmp  adj_exp

  shift_in_zero:
  lsl   r16
  rol   r17
  lsl   r20
  rol   r21
  inc   r23
  cpi   r21,  0x01
  brne  shift_loop

  adj_exp:
  subi  r23,  0x09
  sub   r25,  r23
  brvs  return_zero
  mov   r24,  r20

  epilogue:
  pop   _temp_reg_
  pop   _temp_reg_
  pop   _temp_reg_
  pop   _temp_reg_
  pop   r28
  pop   r29
  ret

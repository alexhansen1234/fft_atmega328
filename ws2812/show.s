SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01
OUTPUT_PORT = 0x0B
OUTPUT_BIT = 7

/* extern void show(); */
.global show
.text
show:
; Wait 6us
  in  r16,  OUTPUT_PORT
  andi r16, ~(1<<OUTPUT_BIT)
  out OUTPUT_PORT,  r16
  ldi r16, 28
reset_loop:
  dec r16
  brne reset_loop
  nop
  nop
  ret

.include "./interrupt_vectors/memory_map.s"

SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

/* void init_ws2812 (uint16_t n_leds) */
.global init_ws2812
.text
init_ws2812:
push  r27
push  r26
movw  r26,  r24
rjmp  set_test
ldi r25,  0
ldi r24,  0
ldi r23,  0
set_loop:
call load_grb_val
sbiw  r26,  1
set_test:
cp  _zero_reg_, r27
cpc _zero_reg_, r26
brne set_loop
call show
pop r26
pop r27
ret

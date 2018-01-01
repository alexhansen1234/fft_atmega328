.global init
.text
init:
ldi r16,  0x07
out 0x3e, r16
ldi r16,  0xF7
out 0x3d, r16
ldi r16,  0xFF
out 0x0a, r16
jmp main

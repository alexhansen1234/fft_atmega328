.include "./interrupt_vectors/memory_map.s"

SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

.global enable_adc
.text
enable_adc:
sei
ret

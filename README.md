# fft_atmega328
fft library for atmega328

/ops/ - 16 bit floating point (float16) operation definitions
/complex/ - complex float16 operation definitions
/fft/ - fft and necessary functions

A 16 bit float represents a number of the form

(-1)^(B15)*(1.B7:B0)*2^(B14:B8 - 63)

Bit 15 - Sign Bit
  0 - positive
  1 - negative

Bits 14:8 - Exponent Bits
  Exponent bias is 63 (0x3F)

Bits 7:0 - Mantissa Bits

compilation requires AVR-GCC.

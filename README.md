# fft_atmega328
fft library for atmega328


ops contains 16 bit floating point operations. A 16 bit float represents a number of the form

(-1)^(B15)*(1.B7:B0)*2^(B14:B8 - 63)

Bit 15 - Sign Bit
  0 - positive
  1 - negative
  
Bits 14:8 - Exponent Bits
  Exponent bias is 63 (0x3F)

Bits 7:0 - Mantissa Bits
  Implicit one is applied for arithemtic functions

make requires AVR-GCC.

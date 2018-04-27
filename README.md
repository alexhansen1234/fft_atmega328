Spectrum Analyzer Visualizer on ATMEGA328P

16 Bit float library handles all floating point operations
 * 1 sign bit
 * 7 exponent bits
 * 8 significand bits
 * exponent bias = 0x3F
 * overflows flush to +/- INF (0x7FFF or 0xFFFF respectively)
 * operations
  * addition
  * subtraction
  * multiplication
  * division
  * sqrt
  * log2

Complex numbers based on float16 struct

struct complex16
{
  float16 real;
  float16 imag;
}

* operations
  * addition
  * subtraction
  * multiplication
  * magnitude

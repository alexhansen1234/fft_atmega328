#ifndef STDINT_H
  #include <stdint.h>
#endif

#ifndef COMPLEX_16_H
  #define COMPLEX_16_H
  typedef int32_t complex16;
  extern complex16 __complex_add(complex16, complex16);
  extern complex16 __complex_sub(complex16, complex16);
  extern complex16 __complex_mul(complex16, complex16);
  extern float16  __complex_mag(complex16);
  extern void __convert_ints_complex16_array(complex16 *, uint16_t);
  extern void __complex16_array_magnitudes (complex16 *, uint8_t);
  extern void __convert_complex16_array_int16 (complex16 *, uint8_t);
  extern void __mul_mag_colors (complex16 *, uint8_t *, uint8_t);
#endif

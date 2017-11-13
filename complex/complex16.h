#ifndef COMPLEX_16_H
  #define COMPLEX_16_H
  typedef int32_t complex16;
  extern complex16 __complex_add(complex16, complex16);
  extern complex16 __complex_sub(complex16, complex16);
  extern complex16 __complex_mul(complex16, complex16);
  extern float16  __complex_mag(complex16);
#endif

#ifndef FLOAT_16_H
  #define FLOAT_16_H
  typedef int16_t float16;
  extern int16_t __float16_add(float16, float16);
  extern int16_t __float16_sub(float16, float16);
  extern int16_t __float16_div(float16, float16);
  extern int16_t __float16_mul(float16, float16);
  extern int16_t __int16_to_float16(int16_t);
  extern int16_t __float16_sqrt(float16);
#endif

#ifndef FLOAT_16_H
  #define FLOAT_16_H
  typedef int16_t float16;
  extern int16_t __float16_add(int16_t, int16_t);
  extern int16_t __float16_sub(int16_t, int16_t);
  extern int16_t __float16_div(int16_t, int16_t);
  extern int16_t __float16_mul(int16_t, int16_t);
  extern int16_t __int16_to_float16(int16_t);
#endif

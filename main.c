#include <stdint.h>
#include "ops/float16.h"
#include "complex/complex16.h"
#include "fft/fft.h"

#define lo8(x) ( (x) & 0xFF)
#define hi8(x) ( ( (x) >> 8) & 0xFF)

int16_t RAMEND = 0x07FF;

complex16 compose_complex(float16, float16);
float16 convert_float_to_float16(void *);

void reset()
{
  __asm__(
    "RESET: \n"
    "ldi  r16,  lo8(0x07EF) \n"
    "out  __SP_L__,  r16  \n"
    "ldi  r16,  hi8(0x07EF) \n"
    "out  __SP_H__,  r16 \n"
    "rjmp main \n"
  );
}

int main()
{
//  float a = 0.995184727;
//  float b = 0.09801714;
//  uint8_t z = 5;
//  uint8_t x = reverse_bits(z, 5);
//  uint8_t y = reverse_bits(x, 5);

#if 1
    uint32_t array[256];
    int i;
    for(i=0; i < 256; i++)
    {
      array[i] = i;
    }
#endif

    permute_input(array, 4, 256);


/*
  float16 e = convert_float_to_float16(&a);
  float16 f = convert_float_to_float16(&b);
  complex16 i = compose_complex(e, f);
  complex16 k = __complex_mul(i, i);
  complex16 l = __complex_mul(k, k);
  complex16 m = __complex_mul(l, l);
  complex16 n = __complex_mul(m, m);
  complex16 o = __complex_mul(n, n);
  complex16 p = __complex_mul(o, o);
*/
  while(1)
    continue;
}

float16 convert_float_to_float16(void *in)
{
  uint32_t *p = in;
  uint32_t temp;
  int16_t ret = 0;
  ret |= ((*p >> 15) & 0xFF);
  temp = ((*p >> 23) - 127) + 63;
  ret |= temp << 8;
  ret |= (*p >> 31) << 15;
  return ret;
}

complex16 compose_complex(float16 a, float16 b)
{
  complex16 ret = (((int32_t)b)<<16) | a;
  return ret;
}

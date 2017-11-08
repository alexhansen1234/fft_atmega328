#include <stdint.h>
#include <math.h>
#include "ops/float16.h"
#include "complex/complex16.h"
#include "fft/fft.h"

#define lo8(x) ( (x) & 0xFF)
#define hi8(x) ( ( (x) >> 8) & 0xFF)
#define RAMEND 0x07FF

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

#if 1
    complex16 array[16];
    complex16 twiddles[8];
    int16_t i;
    float16 j;
    for(i=0; i < 16; i++)
    {
      j = __int16_to_float16(i);
      array[i] = compose_complex(j, __int16_to_float16(0));
    }
#endif

    permute_input(array, 4, 16);

    for(i=0; i < 16; i++)
    {
      array[i] = __complex_mul(array[i], array[i]);
    }

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

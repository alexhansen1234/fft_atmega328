#include <stdint.h>
#include <math.h>
#include "ops/float16.h"
#include "complex/complex16.h"
#include "fft/fft.h"

#define lo8(x) ( (x) & 0xFF)
#define hi8(x) ( ( (x) >> 8) & 0xFF)
#define RAMEND 0x07F7

complex16 compose_complex(float16, float16);
float16 convert_float_to_float16(void *);

void reset()
{
  __asm__(
    "RESET: \n"
    "ldi  r16,  lo8(%0) \n"
    "out  __SP_L__,  r16  \n"
    "ldi  r16,  hi8(%0) \n"
    "out  __SP_H__,  r16 \n"
    "rjmp main \n"
    : /* NO OUTPUT */
    : "ramend" (RAMEND)
    : /* NO CLOBBERS */
  );
}

int main()
{
  unsigned char twiddles[32];
  twiddles[0] = 0x00;   twiddles[1] = 0x3f;   twiddles[2] = 0x00;   twiddles[3] = 0x00;
  twiddles[4] = 0xd9;   twiddles[5] = 0x3e;   twiddles[6] = 0x87;   twiddles[7] = 0xbd;
  twiddles[8] = 0x6a;   twiddles[9] = 0x3e;   twiddles[10] = 0x6a;  twiddles[11] = 0xbe;
  twiddles[12] = 0x87;  twiddles[13] = 0x3d;  twiddles[14] = 0xd9;  twiddles[15] = 0xbe;
  twiddles[16] = 0x00;  twiddles[17] = 0x00;  twiddles[18] = 0x00;  twiddles[19] = 0xbf;
  twiddles[20] = 0x87;  twiddles[21] = 0xbd;  twiddles[22] = 0xd9;  twiddles[23] = 0xbe;
  twiddles[24] = 0x6a;  twiddles[25] = 0xbe;  twiddles[26] = 0x6a;  twiddles[27] = 0xbe;
  twiddles[28] = 0xd9;  twiddles[29] = 0xbe;  twiddles[30] = 0x87;  twiddles[31] = 0xbd;

  complex16 array[16];

  int16_t i;
  float16 j;
  for(i=0; i < 16; i++)
  {
    j = __int16_to_float16(i);
    array[i] = compose_complex(j, __int16_to_float16(0));
  }


  permute_input(array, 4, 16);
  fft_s(array, (complex16 *)twiddles, 16, 0);


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

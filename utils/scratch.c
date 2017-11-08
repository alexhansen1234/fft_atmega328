#include <stdio.h>
#include <math.h>
#include <stdint.h>

typedef int32_t complex16;
typedef int16_t float16;

float16 convert_float_to_float16(void *in)
{
  uint32_t *p = in;
  int8_t temp;
  uint16_t ret = 0x0000;
  temp = (((*p >> 23)&0x7F) - 127) + 63;

  if(temp < 0 || (*(float *)in < 0.000000000000001 && *(float *)in > -0.000000000000001))
  {
    temp = 0; goto ret_zero;
  }

  ret |= ((*p >> 15) & 0xFF);
  ret |= temp << 8;
  ret |= (*p >> 31) << 15;
  ret_zero:;
  return ret;
}

complex16 compose_complex(float16 a, float16 b)
{
  uint32_t ret = 0;
  uint32_t ap = a & 0xFFFF;
  uint32_t bp = b << 16;
  ret = bp | ap;
  return ret;
}

int main()
{
  float a;
  float b;
  long *ap = &a;
  long *bp = &b;
  uint16_t c;
  uint16_t d;
  uint8_t debug = 1;
  int n = 256;

  printf("complex16 twiddles[%d] = {\n", n/2);
  for(int i=0; i < n/2; i++)
  {
    a = cos(-2.0*M_PI*i / n);
    b = sin(-2.0*M_PI*i / n);
    if(debug) {printf("%d\n Float real = %.20f 0x%04x\nFloat imag = %.20f 0x%04x\n", i, a, *ap, b, *bp);}
    c = convert_float_to_float16(&a);
    d = convert_float_to_float16(&b);
    if(debug) {printf("uint16_t real = 0x%04x\nuint16_t imag = 0x%04x\n", c, d);}

    {printf(" %08x", compose_complex(c, d));}
    if(i < n/2 - 1) printf(",\n");
  }
  printf("};");
}

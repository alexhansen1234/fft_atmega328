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
  long *ap = ((long *)&a);
  long *bp = ((long *)&b);
  uint16_t c;
  uint16_t d;
  uint8_t debug = 0;
  int n = 16;

  printf("unsigned char twiddles[%d];\n", 2*n);
  for(int i=0; i < n/2; i++)
  {
    a = cos(-2.0*M_PI*i / n);
    b = sin(-2.0*M_PI*i / n);
    if(debug) {printf("%d\n Float real = %.20f 0x%04lx\nFloat imag = %.20f 0x%04lx\n", i, a, *ap, b, *bp);}
    c = convert_float_to_float16(&a);
    d = convert_float_to_float16(&b);
    if(debug) {printf("uint16_t real = 0x%04hx\nuint16_t imag = 0x%04hx\n", c, d);}
    uint32_t result = compose_complex(c, d);
    for(int j=0; j < 4; j++)
    {
      printf("twiddles[%d] = 0x%02x;\n", i*4 + j, result&0xFF);
      result = result>>8;
    }

  }
}

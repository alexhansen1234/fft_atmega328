#include <stdint.h>
#include "ops/float16.h"
#include "complex/complex16.h"
#include "fft/fft.h"

#define RAMEND 0x07F7
#define ADCSRA 0x007A
#define ADEN 7
#define N_SAMPLES 64

complex16 compose_complex(float16, float16);
float16 convert_float_to_float16(void *);

int main()
{

  complex16 ** COMPLEX16_ARRAY_ADDR = (complex16 **)(RAMEND - 1);
  unsigned char * N_ADC_CONV = (unsigned char *)(RAMEND - 2);
  *N_ADC_CONV = 0x00;

  complex16 array[N_SAMPLES];
  complex16 test;

  (*COMPLEX16_ARRAY_ADDR) = array;
  uint16_t i;

  unsigned char twiddles[128];
  twiddles[0] = 0x00;	twiddles[1] = 0x3f;	twiddles[2] = 0x00;	twiddles[3] = 0x00;
  twiddles[4] = 0xfd;	twiddles[5] = 0x3e;	twiddles[6] = 0x91;	twiddles[7] = 0xbb;
  twiddles[8] = 0xf6;	twiddles[9] = 0x3e;	twiddles[10] = 0x8f;	twiddles[11] = 0xbc;
  twiddles[12] = 0xe9;	twiddles[13] = 0x3e;	twiddles[14] = 0x29;	twiddles[15] = 0xbd;
  twiddles[16] = 0xd9;	twiddles[17] = 0x3e;	twiddles[18] = 0x87;	twiddles[19] = 0xbd;
  twiddles[20] = 0xc3;	twiddles[21] = 0x3e;	twiddles[22] = 0xe2;	twiddles[23] = 0xbd;
  twiddles[24] = 0xa9;	twiddles[25] = 0x3e;	twiddles[26] = 0x1c;	twiddles[27] = 0xbe;
  twiddles[28] = 0x8b;	twiddles[29] = 0x3e;	twiddles[30] = 0x44;	twiddles[31] = 0xbe;
  twiddles[32] = 0x6a;	twiddles[33] = 0x3e;	twiddles[34] = 0x6a;	twiddles[35] = 0xbe;
  twiddles[36] = 0x44;	twiddles[37] = 0x3e;	twiddles[38] = 0x8b;	twiddles[39] = 0xbe;
  twiddles[40] = 0x1c;	twiddles[41] = 0x3e;	twiddles[42] = 0xa9;	twiddles[43] = 0xbe;
  twiddles[44] = 0xe2;	twiddles[45] = 0x3d;	twiddles[46] = 0xc3;	twiddles[47] = 0xbe;
  twiddles[48] = 0x87;	twiddles[49] = 0x3d;	twiddles[50] = 0xd9;	twiddles[51] = 0xbe;
  twiddles[52] = 0x29;	twiddles[53] = 0x3d;	twiddles[54] = 0xe9;	twiddles[55] = 0xbe;
  twiddles[56] = 0x8f;	twiddles[57] = 0x3c;	twiddles[58] = 0xf6;	twiddles[59] = 0xbe;
  twiddles[60] = 0x91;	twiddles[61] = 0x3b;	twiddles[62] = 0xfd;	twiddles[63] = 0xbe;
  twiddles[64] = 0x00;	twiddles[65] = 0x00;	twiddles[66] = 0x00;	twiddles[67] = 0xbf;
  twiddles[68] = 0x91;	twiddles[69] = 0xbb;	twiddles[70] = 0xfd;	twiddles[71] = 0xbe;
  twiddles[72] = 0x8f;	twiddles[73] = 0xbc;	twiddles[74] = 0xf6;	twiddles[75] = 0xbe;
  twiddles[76] = 0x29;	twiddles[77] = 0xbd;	twiddles[78] = 0xe9;	twiddles[79] = 0xbe;
  twiddles[80] = 0x87;	twiddles[81] = 0xbd;	twiddles[82] = 0xd9;	twiddles[83] = 0xbe;
  twiddles[84] = 0xe2;	twiddles[85] = 0xbd;	twiddles[86] = 0xc3;	twiddles[87] = 0xbe;
  twiddles[88] = 0x1c;	twiddles[89] = 0xbe;	twiddles[90] = 0xa9;	twiddles[91] = 0xbe;
  twiddles[92] = 0x44;	twiddles[93] = 0xbe;	twiddles[94] = 0x8b;	twiddles[95] = 0xbe;
  twiddles[96] = 0x6a;	twiddles[97] = 0xbe;	twiddles[98] = 0x6a;	twiddles[99] = 0xbe;
  twiddles[100] = 0x8b;	twiddles[101] = 0xbe;	twiddles[102] = 0x44;	twiddles[103] = 0xbe;
  twiddles[104] = 0xa9;	twiddles[105] = 0xbe;	twiddles[106] = 0x1c;	twiddles[107] = 0xbe;
  twiddles[108] = 0xc3;	twiddles[109] = 0xbe;	twiddles[110] = 0xe2;	twiddles[111] = 0xbd;
  twiddles[112] = 0xd9;	twiddles[113] = 0xbe;	twiddles[114] = 0x87;	twiddles[115] = 0xbd;
  twiddles[116] = 0xe9;	twiddles[117] = 0xbe;	twiddles[118] = 0x29;	twiddles[119] = 0xbd;
  twiddles[120] = 0xf6;	twiddles[121] = 0xbe;	twiddles[122] = 0x8f;	twiddles[123] = 0xbc;
  twiddles[124] = 0xfd;	twiddles[125] = 0xbe;	twiddles[126] = 0x91;	twiddles[127] = 0xbb;

  /* Enable ADC Conversions */

  asm volatile(
    "lds  r16,  %0 \n"
    "ori  r16,  %1 \n"
    "sts  %0, r16 \n"
    "sei \n"
    ::"M" (ADCSRA), "M" (1<<ADEN) :"r16");

  #if 1
  for(i=0; i < N_SAMPLES; i++)
  {
    array[i] = (complex16)i;
  }

  __convert_ints_complex16_array(array, N_SAMPLES);
  permute_input(array, 4, N_SAMPLES);
  fft_s(array, (complex16 *)twiddles, N_SAMPLES, 0);
  __complex16_array_magnitudes(array, N_SAMPLES);
  __convert_complex16_array_int16(array, N_SAMPLES);
  #endif

  /*
  permute_input(array, 4, N_SAMPLES);
  fft_s(array, (complex16 *)twiddles, N_SAMPLES, 0);

  for(i=0; i < N_SAMPLES; i++)
  {
    j = __complex_magnitude(array[i]);
  }
  */
  while(1)
  {
    #if 0
    if((*N_ADC_CONV) == 64)
    {
      __convert_ints_complex16_array(array, N_SAMPLES);
      permute_input(array, 4, N_SAMPLES);
      fft_s(array, (complex16 *)twiddles, N_SAMPLES, 0);
      __complex16_array_magnitudes(array, N_SAMPLES);

    }
    #endif
    continue;
  }
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

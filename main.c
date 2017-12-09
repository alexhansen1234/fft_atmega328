#include <stdint.h>
#include "ops/float16.h"
#include "complex/complex16.h"
#include "fft/fft.h"
#include "ws2812/ws2812.h"

#define RAMEND 0x07F7
#define ADCSRA 0x007A
#define ADEN 7
#define N_SAMPLES 64
#define N_LEDS 31
#define N_ADC_CONV_ADDR (RAMEND - 2)

complex16 compose_complex(float16, float16);
float16 convert_float_to_float16(void *);

int main()
{

  uint8_t * PORTB = (uint8_t *)0x0025;
  uint8_t * PORTD = (uint8_t *)0x002B;

  complex16 ** COMPLEX16_ARRAY_ADDR = (complex16 **)(RAMEND - 1);


  uint8_t * N_ADC_CONV = (uint8_t *)(RAMEND - 2);

  *(N_ADC_CONV) = 0xAA;

  uint8_t ** COLOR_ARRAY_ADDR = (uint8_t **)(RAMEND - 4);

  complex16 array[N_SAMPLES];
  uint8_t colors[93];

  (*COMPLEX16_ARRAY_ADDR) = array;
  (*COLOR_ARRAY_ADDR) = colors;

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

  colors[0] = 0x01;   colors[1] = 0xfe;   colors[2] = 0x00;
  colors[3] = 0x1a;   colors[4] = 0xe5;   colors[5] = 0x00;
  colors[6] = 0x33;   colors[7] = 0xcc;   colors[8] = 0x00;
  colors[9] = 0x4c;   colors[10] = 0xb3;  colors[11] = 0x00;
  colors[12] = 0x65;  colors[13] = 0x9a;  colors[14] = 0x00;
  colors[15] = 0x7e;  colors[16] = 0x81;  colors[17] = 0x00;
  colors[18] = 0x97;  colors[19] = 0x68;  colors[20] = 0x00;
  colors[21] = 0xb0;  colors[22] = 0x4f;  colors[23] = 0x00;
  colors[24] = 0xc9;  colors[25] = 0x36;  colors[26] = 0x00;
  colors[27] = 0xe2;  colors[28] = 0x1d;  colors[29] = 0x00;
  colors[30] = 0xfb;  colors[31] = 0x04;  colors[32] = 0x00;
  colors[33] = 0xea;  colors[34] = 0x00;  colors[35] = 0x15;
  colors[36] = 0xd1;  colors[37] = 0x00;  colors[38] = 0x2e;
  colors[39] = 0xb8;  colors[40] = 0x00;  colors[41] = 0x47;
  colors[42] = 0x9f;  colors[43] = 0x00;  colors[44] = 0x60;
  colors[45] = 0x86;  colors[46] = 0x00;  colors[47] = 0x79;
  colors[48] = 0x6d;  colors[49] = 0x00;  colors[50] = 0x92;
  colors[51] = 0x54;  colors[52] = 0x00;  colors[53] = 0xab;
  colors[54] = 0x3b;  colors[55] = 0x00;  colors[56] = 0xc4;
  colors[57] = 0x22;  colors[58] = 0x00;  colors[59] = 0xdd;
  colors[60] = 0x09;  colors[61] = 0x00;  colors[62] = 0xf6;
  colors[63] = 0x00;  colors[64] = 0x10;  colors[65] = 0xef;
  colors[66] = 0x00;  colors[67] = 0x29;  colors[68] = 0xd6;
  colors[69] = 0x00;  colors[70] = 0x42;  colors[71] = 0xbd;
  colors[72] = 0x00;  colors[73] = 0x5b;  colors[74] = 0xa4;
  colors[75] = 0x00;  colors[76] = 0x74;  colors[77] = 0x8b;
  colors[78] = 0x00;  colors[79] = 0x8d;  colors[80] = 0x72;
  colors[81] = 0x00;  colors[82] = 0xa6;  colors[83] = 0x59;
  colors[84] = 0x00;  colors[85] = 0xbf;  colors[86] = 0x40;
  colors[87] = 0x00;  colors[88] = 0xd8;  colors[89] = 0x27;
  colors[90] = 0x00;  colors[91] = 0xf1;  colors[92] = 0x0e;


#if 0
  float in = 1.0;
  uint16_t i = 0;
  uint8_t j = 0;
  while(1)
  {
    j++;
    for(i=0; i < N_SAMPLES; i++)
    {
      if(i < N_SAMPLES / 2)
        array[i] = (complex16)j;
      else
        array[i] = (complex16)0;
    }

    __convert_ints_complex16_array(array, N_SAMPLES);
    permute_input(array, 4, N_SAMPLES);
    fft_s(array, (complex16 *)twiddles, N_SAMPLES, 0);
    __complex16_array_magnitudes(array, N_SAMPLES);
    __convert_complex16_array_int16(array, N_SAMPLES);
    __mul_mag_colors(array, colors, N_SAMPLES);
    display_color_array(array, N_SAMPLES, N_LEDS);
  }

#endif

#if 1
  uint16_t i = 0;

  enable_adc();

  while(1)
  {
      if(*(N_ADC_CONV) == 64)
      {
        *(PORTB) = (*PORTB) ^ 0x02;
        __convert_ints_complex16_array(array, N_SAMPLES);
        permute_input(array, 4, N_SAMPLES);
        fft_s(array, (complex16 *)twiddles, N_SAMPLES, 0);
        __complex16_array_magnitudes(array, N_SAMPLES);
        __convert_complex16_array_int16(array, N_SAMPLES);
        __mul_mag_colors(array, colors, N_SAMPLES);
        display_color_array(array, N_SAMPLES, N_LEDS);

        *(N_ADC_CONV) = 0;
        enable_timer0();
      }
  }
#endif
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

#include <stdio.h>
#include <stdint.h>

int main()
{
  int N_SAMPLES = 64;
  int N_COLORS = N_SAMPLES / 2 - 1;
  uint8_t red = 255, green = 0, blue = 0;
  uint8_t colors[N_COLORS*3];
  int flag = 0;
  printf("uint8_t colors[%d]; \n", 3*N_COLORS);
  for(int i=0, j=0; i < 768; i++)
  {
    switch(flag % 3)
    {
      case 0: red--, green++; if(red == 0) {green=255; flag++;} break;
      case 1: green--, blue++; if(green == 0) {blue=255; flag++;} break;
      case 2: blue--, red++; if(blue == 0) {red=255; flag++;} break;
    }
    if((i % 25) == 0)
    {
      colors[j] = green; colors[j+1] = red; colors[j+2] = blue;
      printf("colors[%d] = 0x%02x; colors[%d] = 0x%02x; colors[%d] = 0x%02x;\n", j, green, j+1, red, j+2, blue);
      j+=3;
    }
  }
  return 0;
}

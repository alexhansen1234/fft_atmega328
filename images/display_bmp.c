#include <stdint.h>
#include "progmem/progmem.h"

struct BMP_HEADER
{
  uint16_t    size;
  uint32_t    height;
  uint32_t    width;
  uint32_t *  colors;
  uint8_t  *  data;
};

extern uint16_t mario_data_size;
extern uint32_t mario_height;
extern uint32_t mario_width;
extern uint32_t * mario_color_table;
extern uint8_t * mario_data;

void display_bmp(struct BMP_HEADER *);

void reset()
{
  asm volatile("ldi r16,  0x07\n"
               "out 0x3e, r16\n"
               "ldi r16,  0xF7\n"
               "out 0x3d, r16\n"
               "ldi r16,  0xFF\n"
               "out 0x0a, r16\n"
               "jmp main\n");
}

int main()
{
    struct BMP_HEADER mario;
    mario.size    = lpm_u16(&mario_data_size);
    mario.height  = lpm_u32(&mario_height);
    mario.width   = lpm_u32(&mario_width);
    mario.colors  = program_address(&mario_color_table);
    mario.data    = program_address(&mario_data);

    /*
      Example:
      accessing color table
      */
    uint32_t color0 = lpm_u32(mario.colors);
    uint32_t color1 = lpm_u32(mario.colors+1);

    /*
      Example:
      accessing data table
      */
    uint8_t example_data;
    uint32_t index = 0;

    while(index < mario.size)
    {
      example_data = lpm_u8(mario.data + index);
      index++;
      //display_bmp(&mario);
    }
    while(1)
    {
      continue;
    }


}

/*
uint16_t mod(uint16_t num, uint16_t modulus)
{
  if(num < modulus)
    return num;
  else
  {
    while(num > modulus)
      num -= modulus;
    return num;
  }
}

uint16_t divide(uint16_t num, uint16_t divisor)
{
  if(num < divisor)
    return 0;
  else
  {
    uint16_t ret = 0;
    while(num >= divisor)
    {
      num -= divisor;
      ret += 1;
    }
    return ret;
  }
}

void display_bmp(struct BMP_HEADER * bmp_header)
{
  uint16_t  height  = bmp_header->height;
  uint16_t  width   = bmp_header->width;
  uint8_t   *data   = bmp_header->data;
  uint32_t  *colors = bmp_header->colors;

  uint16_t  current_height        = 0;
  uint16_t  current_width         = 0;
  uint16_t  current_data_position = 0;
  uint16_t  delta_height_final;
  uint16_t  delta_width_final;
  uint16_t  run_length;

  while(current_height < height)
  {
    if( ! (*(data + current_data_position)) )
    {
      switch( *(data + current_data_position + 1) )
      {
        case 0: show();
                current_data_position   += 2;
                current_height          += 1;
                current_width            = 0;
                continue;
        case 1: show();
                return;
        case 2: delta_width_final   = (current_width + *(data + current_data_position + 2));
                delta_height_final  = current_height + *(data + current_data_position + 3) + divide(delta_width_final, width);
                delta_width_final   = mod(delta_width_final, width);

                while(current_height != delta_height_final && current_width != delta_width_final)
                {
                  load_grb_val(*colors);
                  current_width++;
                  if(current_width > width)
                  {
                    current_width   = 0;
                    current_height += 1;
                    show();
                  }
                }
                current_data_position += 4;
                continue;
        default:
                run_length = *(data + 1) >> 1;
                current_data_position += 2;
                while(run_length)
                {
                  load_grb_val(*(colors + (*(data + current_data_position) >> 4)));
                  load_grb_val(*(colors + (*(data + current_data_position) & 0x0F)));
                  current_data_position += 1;
                }
      }
    }
  }
}
*/

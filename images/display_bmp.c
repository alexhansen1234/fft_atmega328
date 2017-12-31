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

extern uint16_t   mario_data_size;
extern uint32_t   mario_height;
extern uint32_t   mario_width;
extern uint32_t * mario_color_table;
extern uint8_t  * mario_data;

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

    display_bmp(&mario);

    while(1)
      continue;


}


void display_bmp(struct BMP_HEADER * bmp_header)
{
  uint32_t  current_data_offset = 0;
  uint8_t   current_data;
  uint8_t   run_length;

  while(current_data_offset < bmp_header->size)
  {
    if(current_data = lpm_u8(bmp->data + current_data_offset++))
    {
      /* Run Length */
    }
    else
    {
      switch(current_data = lpm_u8(bmp->data + current_data_offset++))
      {
        case 0: /* End of Line */
                /* show();
                /* current_height += 1;
                /* current_width = 0; */

        case 1: /* End of File */
                /* if(current_height != bmp->height && current_width != bmp->width)
                /* {
                /*    while(current_height < bmp->height && current_width < bmp->width)
                /*    {
                /*      load_grb_val(lpm_u32(bmp_header->color_table));
                /*      if(current_width == bmp->width)
                /*      {
                /*        show();
                /*        current_width = 0;
                /*        current_height += 1;
                /*      }
                /*      current_width += 1;
                /*    }
                /* }
                /* return; */

        case 2: /* Delta */
                /* 
      }
    }
  }
  return;
}

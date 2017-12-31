#include <stdint.h>
#include "progmem/progmem.h"

struct BMP_HEADER
{
  uint16_t    size;
  uint32_t    height;
  uint32_t    width;
  uint32_t *  color_table;
  uint8_t  *  data;
};

extern uint16_t   mario_data_size;
extern uint32_t   mario_height;
extern uint32_t   mario_width;
extern uint32_t * mario_color_table;
extern uint8_t  * mario_data;

uint8_t load_rgb_val(uint32_t color)
{
  if(color)
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint8_t show(void)
{
  return 1;
}

void display_bmp(struct BMP_HEADER *);

int main()
{
    struct BMP_HEADER mario;
    mario.size    = lpm_u16(&mario_data_size);
    mario.height  = lpm_u32(&mario_height);
    mario.width   = lpm_u32(&mario_width);
    mario.color_table  = program_address(&mario_color_table);
    mario.data    = program_address(&mario_data);

    display_bmp(&mario);

    while(1)
      continue;


}


void display_bmp(struct BMP_HEADER * bmp_header)
{
  uint32_t  current_data_offset = 0;
  uint8_t   current_data;
  uint16_t  current_width = 0;
  uint16_t  current_height = 0;
  uint16_t  delta_width;
  uint16_t  delta_height;
  uint8_t   run_length;

  while(current_data_offset < bmp_header->size)
  {
    if((current_data = lpm_u8(bmp_header->data + current_data_offset)))
    {
      /* RUN-LENGTH ENCODING HANDLER */
      /* If current_data is not zero, current_data is the run-length */
      /* the byte after current_data is the pair of 4-bit values to be repeated current_data times */
      /* each nibble is displayed, and the counter increases */
      /* Ex. If currnet_data is 0x05 and current_data + 1 is 0x73 */
      /* the displayed colors will be 7 3 7 3 7 where 7 and 3 are indicies in the color table */
      uint8_t counter = 0;
      run_length = current_data;
      current_data = lpm_u8(bmp_header->data + current_data_offset + 1);
      while(run_length - counter)
      {
        if(counter & 0x01)
        {
          load_rgb_val(lpm_u32(bmp_header->color_table + (current_data & 0x0F)));
          current_width++;
        }
        else
        {
          load_rgb_val(lpm_u32(bmp_header->color_table + (current_data >> 4)));
          current_width++;
        }
        counter++;
      }
      current_data_offset += 2;
    }
    else
    {
      switch((current_data = lpm_u8(bmp_header->data + current_data_offset+1)))
      {
        case 0: /* End of Line */
                /* If line ends before the width of image, fill in with first entry in color table */
                show();
                current_height += 1;
                current_width = 0;
                current_data_offset += 2;
                break;
        case 1: /* End of File */
                /* if(current_height != bmp->height && current_width != bmp->width) */
                /* */
                /*    while(current_height < bmp->height && current_width < bmp->width) */
                /*    { */
                /*      load_grb_val(lpm_u32(bmp_header->color_table)); */
                /*      if(current_width == bmp->width) */
                /*      { */
                /*        show(); */
                /*        current_width = 0;  */
                /*        current_height += 1;  */
                /*      } */
                /*      current_width += 1; */
                /*    } */
                /* }  */
                return;
        case 2: /* Delta */
                delta_width = current_width + lpm_u8(bmp_header->data + current_data_offset + 2);
                delta_height = current_height + lpm_u8(bmp_header->data + current_data_offset + 3);
                if(delta_width >= bmp_header->width)
                {
                  delta_width = 0;
                  delta_height += 1;
                }
                while(current_width != delta_width && current_height != delta_height)
                {
                  load_rgb_val(lpm_u32(bmp_header->color_table));
                  if(current_width == bmp_header->width)
                  {
                    show();
                    current_width = 0;
                    current_height += 1;
                  }
                }
                current_data_offset += 4;
                break;
        default:
                current_data_offset += 2 + (current_data>>1);
                break;
      }
    }
  }
  return;
}

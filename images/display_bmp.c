#include <stdint.h>
#include "progmem/progmem.h"

#define NUM_PIXELS 144

struct ws2812
{
  uint16_t    num_pixels;
  uint32_t  * pixels;
};

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

extern uint16_t   test_data_size;
extern uint32_t   test_height;
extern uint32_t   test_width;
extern uint32_t * test_color_table;
extern uint8_t  * test_data;

extern void load_rgb_val(uint32_t color);
extern void show(void);

void show_pixels(uint32_t * array, uint16_t num_pixels)
{
  uint16_t counter=0;
  while(counter < num_pixels)
  {
    load_rgb_val(array[counter++]);
  }
  show();
}

void display_bmp(struct ws2812 *, struct BMP_HEADER *);

int main()
{
    uint32_t pixels[NUM_PIXELS];
    struct ws2812 strip;
    struct BMP_HEADER test;
    struct BMP_HEADER mario;
    uint16_t counter = 0;

    strip.num_pixels = NUM_PIXELS;
    strip.pixels = pixels;

    test.size         = lpm_u16(&test_data_size);
    test.height       = lpm_u32(&test_height);
    test.width        = lpm_u32(&test_width);
    test.color_table  = program_address(&test_color_table);
    test.data         = program_address(&test_data);

/*
    mario.size    = lpm_u16(&mario_data_size);
    mario.height  = lpm_u32(&mario_height);
    mario.width   = lpm_u32(&mario_width);
    mario.color_table  = program_address(&mario_color_table);
    mario.data    = program_address(&mario_data);
*/
    while(1)
    {
      display_bmp(&strip, &test);
      /*display_bmp(&strip, &mario); */
    }

}

void display_bmp(struct ws2812 * strip, struct BMP_HEADER * bmp_header)
{
  uint32_t  current_data_offset = 0;
  uint8_t   current_data;
  uint16_t  current_width = 0;
  uint16_t  current_height = 0;
  uint16_t  delta_width;
  uint16_t  delta_height;
  uint32_t  delta_color = lpm_u32(bmp_header->color_table);
  uint8_t   run_length;
  uint8_t   run_counter;
  uint8_t   counter;

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
      counter = 0;
      run_length = current_data;
      current_data = lpm_u8(bmp_header->data + current_data_offset + 1);
      while(counter < run_length)
      {
        if(counter & 0x01)
        {
          strip->pixels[current_width] = lpm_u32(bmp_header->color_table + (current_data & 0x0F));
        }
        else
        {
          strip->pixels[current_width] = lpm_u32(bmp_header->color_table + (current_data >> 4));
        }
        current_width++;
        counter++;
      }
      current_data_offset += 2;
    }
    else
    {
      switch((current_data = lpm_u8(bmp_header->data + current_data_offset + 1)))
      {
        case 0: /* End of Line */
                /* If line ends before the width of image, fill in with first entry in color table */
                show_pixels(strip->pixels, bmp_header->width);
                current_height += 1;
                current_width = 0;
                current_data_offset += 2;
                break;
        case 1: /* End of File */
                while(current_height < bmp_header->height && current_width < bmp_header->width)
                {
                  strip->pixels[current_width] = delta_color;
                  if(current_width == bmp_header->width)
                  {
                    show_pixels(strip->pixels, bmp_header->width);
                    current_width = 0;
                    current_height += 1;
                  }
                  current_width += 1;
                }
                return;
        case 2: /* Delta */
                delta_width = current_width + lpm_u8(bmp_header->data + current_data_offset + 2);
                delta_height = current_height + lpm_u8(bmp_header->data + current_data_offset + 3);
                if(delta_width >= bmp_header->width)
                {
                  delta_width = 0;
                  delta_height += 1;
                }
                while(current_height != delta_height && current_width != delta_width)
                {
                  strip->pixels[current_width] = delta_color;
                  current_width += 1;
                  if(current_width == bmp_header->width)
                  {
                    show_pixels(strip->pixels, bmp_header->width);
                    current_width = 0;
                    current_height += 1;
                  }
                }
                current_data_offset += 4;
                break;
        default:
                run_length = current_data>>1;
                run_counter = 0;
                current_data_offset += 2;
                while(run_counter < run_length)
                {
                  current_data = lpm_u8(bmp_header->data + current_data_offset + run_counter);
                  strip->pixels[current_width]      = lpm_u32(bmp_header->color_table + (current_data >> 4));
                  strip->pixels[current_width + 1]  = lpm_u32(bmp_header->color_table + (current_data & 0x0F));
                  run_counter++;
                  current_width += 2;
                }
                current_data_offset += run_length;
                break;

        }
      }
    }
}

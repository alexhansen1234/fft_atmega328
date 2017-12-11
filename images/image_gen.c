#include <stdlib.h>
#include <stdio.h>
#include "bmp_util/bmp.h"

int main(int argc, char ** argv)
{
  FILE *fp;
  struct BMP * bmp;

  if(argc == 1)
  {
    printf("Missing Path to File\n");
    return 1;
  }
  
  fp = fopen(argv[1], "r");
  bmp = getBMP(fp);
  print_BMP(bmp);
/*
  if(fp)
  {
     bmp = getBMP(fp);
     printf("ID: %c%c\nFile Size: %u\nReserved1: %u\nReserved2: %u\nOffset: %u\n", *bmp->identifier, *(bmp->identifier+1), bmp->file_size, bmp->reserved1, bmp->reserved2, bmp->pixel_array_offset);
     printf("DIB Header Size: %u\n", bmp->DIB_header_size);
     printf("Width: %u\n", bmp->width);
     printf("Height: %u\n", bmp->height);
     printf("Planes: %u\n", bmp->planes);
     printf("Bits Per Pixel: %u\n", bmp->bits_per_pixel);
     printf("Compression: %u\n", bmp->compression);
     printf("Image Size: %u\n", bmp->image_size);
     printf("X Pixels per Meter: %u\n", bmp->x_pix_per_meter);
     printf("Y Pixels per Meter: %u\n", bmp->y_pix_per_meter);
     printf("Colors in Table: %u\n", bmp->colors_in_table);
     printf("Important Color Count: %u\n", bmp->important_color_count);
     printf("Red Channel Bitmask: %u\n", bmp->red_channel_bitmask);
     printf("Green Channel Bitmask: %u\n", bmp->green_channel_bitmask);
     printf("Blue Channel Bitmask: %u\n", bmp->blue_channel_bitmask);
     printf("Color Space Type: %u\n", bmp->color_space_type);
     printf("Color Space Endpoints: %u\n", bmp->color_space_endpoints);
     printf("Gamma Red Channel: %u\n", bmp->gamma_red_channel);
     printf("Gamma Green Channel: %u\n", bmp->gamma_green_channel);
     printf("Gamma Blue Channel: %u\n", bmp->gamma_blue_channel);
     printf("Intent: %u\n", bmp->intent);
     printf("ICC Profile Data: %u\n", bmp->icc_profile_data);
     printf("ICC Profile Size: %u\n", bmp->icc_profile_size);
     int i=0;
     while(i < bmp->colors_in_table)
     {
       if(i==0) printf("Color Table Entries:\n");

       printf("\t%u\n", *(bmp->color_table + i));
       i++;
     }

     i=0;
     while(i < bmp->image_size)
     {
       if(i==0) printf("Data Array:\n");
       if(!(i % 16)) printf("\n");
       printf("%02u ", *(bmp->data + i));
       i++;
     }
  }
 */
}

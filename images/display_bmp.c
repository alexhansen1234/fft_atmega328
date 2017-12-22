void display_bmp(struct * bmp_header)
{
  uint16_t  height  = bmp_header->height;
  uint16_t  width   = bmp_header->width;
  uint8_t   *data   = bmp_header->data;
  uint32_t  *colors = bmp_header->colors;

  uint16_t  current_height        = 0;
  uint16_t  current_width         = 0;
  uint16_t  current_data_position = 0;
  uint16_t  delta_height_final;
  uint16_t  delta_width;_final;

  while(current_height < height)
  {
    if( !*(data + current_data_position) )
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
        case 2: delta_width_final   = (current_width + *(data + current_data_position + 2);
                delta_height_final  = current_height + *(data + current_data_position + 3) + (delta_width_final / width);
                delta_width_final   = delta_width_final & width;

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
                
      }
    }

    if(current_width == width)
    {
      show();
    }
  }
}

#ifndef _FFT_H_
  #define _FFT_H_
  void fft(complex16 * in, uint8_t n_items, uint8_t inverse);
  uint8_t reverse_bits(uint8_t val, uint8_t width);
  void permute_input(void * in, uint8_t n_items);
#endif

#ifndef _FFT_H_
  #define _FFT_H_
  void fft_s(complex16 * in, complex16 * twiddles, uint8_t n_items, uint8_t inverse);
  uint8_t reverse_bits(uint8_t val, uint8_t width);
  void permute_input(void * in, uint8_t elem_size, uint16_t n_elem);
  uint16_t log2n(uint16_t x);
#endif

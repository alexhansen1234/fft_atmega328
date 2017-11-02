#ifndef _FFT_H_
  #define _FFT_H_
  void fft(complex16 * in, uint8_t n, uint8_t inverse);
  uint8_t reverse_bits(uint8_t num, uint8_t size);
  void permute_input(complex16 * in, uint8_t size);
#endif

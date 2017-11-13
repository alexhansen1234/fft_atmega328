# fft_atmega328
fft library for atmega328

build with 'make'

clean directory with 'make clean'

ops/* - defines float16, operations and utility functions


complex/* - defines complex float16 (complex16), operations and utility functions

fft/fft.s - iterative fft, up to 256 points

utils/scratch.c - used to generate the twiddle factor constants for fft

utils/fft2.c - used to debug fft results

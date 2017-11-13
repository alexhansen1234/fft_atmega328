#include <stdio.h>
#include <math.h>
#include <complex.h>
#define N_SAMPLES 64
void fft(complex float *input, int size);
void permute_input(complex float *in, complex float *out, int size);
int reverse_bits(int num, int size);
void print_complex(complex float a);

int main(int argc, char *argv[])
{
    float complex data[N_SAMPLES];

    for(int i=0; i < N_SAMPLES; i++)
    {
      data[i] = i;
    }

    float complex permuted[N_SAMPLES];

    permute_input(data, permuted, N_SAMPLES);

    fft(permuted, N_SAMPLES);

    for(int i=0; i < N_SAMPLES; i++)
    {
      print_complex(permuted[i]);
      printf("\n");
    }

    printf("\n");

#if 0
/* INVERSE CALC - JUST PERMUTE RESULT AND RUN THROUGH AGAIN */
    fft(permuted, N_SAMPLES);

    for(int i=0; i < N_SAMPLES; i++)
    {
      print_complex(data[i]);
      printf("\n");
    }

    return 0;
#endif
}

void print_complex(complex float a)
{
  printf("%f %+fj\tMag: %f", creal(a), cimag(a), cabs(a));
}

void permute_input(complex float *in, complex float *out, int size)
{
  for(int i=0; i < size; i++)
  {
    out[i] = in[reverse_bits(i, size)];
  }
}

int reverse_bits(int num, int size)
{
  int ret = 0, log2n = (int)log2(size);
  for(int i=0; i < log2n; i++)
  {
    ret |= ((num>>i)&1)<< (log2n - i - 1);
  }
  return ret;
}

void fft(complex float *in, int n)
{
  float complex twiddles[n/2];
  float complex odd;

  for(int i=0; i < n/2; i++)
  {
    twiddles[i] = cexp(-2*M_PI*I*i/n);
  }


  /* Stage counter, where number of stages = log2(n) */
  for(int j=1; j<n; j=j<<1)
  {
    for(int i=0; i<n; i+=j<<1)
    {
      for(int k=0, l=n/(2*j); k < j; k++)
      {
        float complex temp1 = in[i+k];
        float complex temp2 = in[i+k+j]*twiddles[k*l];

        in[i+k] = temp1 + temp2;
        in[i+k+j] = temp1 - temp2;
      }
    }
  }
}

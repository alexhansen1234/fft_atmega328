void fft_c(complex float *in, int n)
{
  float complex twiddles[n/2];

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

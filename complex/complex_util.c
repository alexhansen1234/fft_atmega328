complex16 compose_complex(float16 a, float16 b)
{
  complex16 ret = (((int32_t)b)<<16) | a;
  return ret;
}

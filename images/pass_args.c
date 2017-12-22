void reset()
{
  asm volatile("RESET:\n"
              "ldi r16, 0x07\n"
              "out 0x3e, r16\n"
              "ldi r16, 0xF7\n"
              "out 0x3d, r16\n"
              "jmp main\n");
}

int volatile some_func(void * a, void * b, void * c, void * d)
{
  return 0;
}

int main()
{
  main_loop: {}
  int a, b, c, d;
  a = 1;
  b = 2;
  c = 3;
  d = 4;

  while(1)
  {
    some_func(&a, &b, &c, &d);
  }
}

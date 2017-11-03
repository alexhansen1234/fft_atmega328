_temp_reg_ = 0
_zero_reg_ = 1
SPL = 3d
SPH = 3e
SREG = 3f

/*
  void permute_input(void * array, uint8_t elem_size, uint16_t n_elem);

  for(counter = 0; counter < n_elem; counter++)
  {
    for(pos = elem_size; pos != 0; pos--)
    {
      *(buffer + ((reverse_bits(counter, n_elem) << (elem_size >> 1))) + pos) = *(array + ((counter) << (elem_size >> 1)) + pos);
    }
  }

 */

.global permute_input
.text
permute_input:
push  r29
push  r28
push  r25 /* High byte of array base */
push  r24 /* Low byte of array base */
push  r23 /*
push  r22
push  r21
push  r20
in  r29,  SPH
in  r28,  SPL
sub r28,  r20
sbc r29,  r21
out SPH,  r29
out SPL,  r28



epilogue:
pop _temp_reg_
pop _temp_reg_
pop _temp_reg_
pop _temp_reg_
pop _temp_reg_
pop _temp_reg_
pop r28
pop r29
ret

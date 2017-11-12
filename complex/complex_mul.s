_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int32_t __complex_mul(int32_t arg1, int32_t arg2); */
.global __complex_mul
.text
__complex_mul:
push  r31
push  r30
push  r29
push  r28
push  r27
push  r26
in    r29,  SPH
in    r28,  SPL
sbiw  r28,  12

;;rcall .   ;; AC - BD
;;rcall .   ;; AD + BC
;;rcall .   ;; AC
;;rcall .   ;; BD
;;rcall .   ;; AD
;;rcall .   ;; BC
out   SPH,  r29
out   SPL,  r28
push  r25
push  r24
push  r23
push  r22
push  r21
push  r20
push  r19
push  r18
in    r29,  SPH
in    r28,  SPL
movw  r24,  r18
call  __float16_mul
std   Y+16, r25
std   Y+15, r24
ldd   r25,  Y+8
ldd   r24,  Y+7
ldd   r23,  Y+4
ldd   r22,  Y+3
call  __float16_mul
std   Y+14, r25
std   Y+13, r24
ldd   r25,  Y+6
ldd   r24,  Y+5
ldd   r23,  Y+4
ldd   r22,  Y+3
call  __float16_mul
std   Y+12, r25
std   Y+11, r24
ldd   r25,  Y+8
ldd   r24,  Y+7
ldd   r23,  Y+2
ldd   r22,  Y+1
call  __float16_mul
std   Y+10, r25
std   Y+9,  r24
ldd   r25,  Y+16
ldd   r24,  Y+15
ldd   r23,  Y+14
ldd   r22,  Y+13
call  __float16_sub
std   Y+20, r25
std   Y+19, r24
ldd   r25,  Y+12
ldd   r24,  Y+11
ldd   r23,  Y+10
ldd   r22,  Y+9
call  __float16_add
ldd   r23,  Y+20
ldd   r22,  Y+19
adiw  r28,  20
out   SPH,  r29
out   SPL,  r28
pop   r26
pop   r27
pop   r28
pop   r29
pop   r30
pop   r31
ret

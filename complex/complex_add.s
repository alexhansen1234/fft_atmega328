_temp_reg_  = 0
_zero_reg_  = 1
SPL         = 0x3D
SPH         = 0x3E
SREG        = 0x3F

/* int32_t __complex_add(int32_t arg1, int32_t arg2); */
.global __complex_add
.text
__complex_add:
push  r31
push  r30
push  r29
push  r28
push  r27
push  r26
rcall .
rcall .
push  r25     ;; BH [8]
push  r24     ;; BL [7]
push  r23     ;; AH [6]
push  r22     ;; AL [5]
push  r21     ;; DH [4]
push  r20     ;; DL [3]
push  r19     ;; CH [2]
push  r18     ;; CL [1]
in    r29,  SPH
in    r28,  SPL
ldd   r25,  Y+6
ldd   r24,  Y+5
ldd   r23,  Y+2
ldd   r22,  Y+1
call  __float16_add
std   Y+10, r25
std   Y+9,  r24
ldd   r25,  Y+8
ldd   r24,  Y+7
ldd   r23,  Y+4
ldd   r22,  Y+3
call  __float16_add
ldd   r23,  Y+10
ldd   r22,  Y+9
adiw  r28,  12
out   SPH,  r29
out   SPL,  r28
pop   r26
pop   r27
pop   r28
pop   r29
pop   r30
pop   r31
ret

	.file	"comparison.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	log2n
	.type	log2n, @function
log2n:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r18,r24
	subi r18,1
	sbc r19,__zero_reg__
	ldi r24,0
	ldi r25,0
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	breq .L4
.L3:
	lsr r19
	ror r18
	adiw r24,1
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L3
	ret
.L4:
	ret
	.size	log2n, .-log2n
.global	reverse_bits
	.type	reverse_bits, @function
reverse_bits:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	movw r30,r24
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L12
	ldi r20,0
	ldi r21,0
	ldi r24,0
	ldi r25,0
	ldi r26,0
.L11:
	movw r18,r30
	mov r0,r26
	rjmp 2f
	1:
	lsr r19
	ror r18
	2:
	dec r0
	brpl 1b
	com r20
	com r21
	add r20,r22
	adc r21,r23
	rjmp 2f
	1:
	lsl r18
	rol r19
	2:
	dec r20
	brpl 1b
	or r24,r18
	or r25,r19
	subi r26,lo8(-(1))
	mov r20,r26
	ldi r21,0
	cp r20,r22
	cpc r21,r23
	brlo .L11
	ret
.L12:
	ldi r24,0
	ldi r25,0
	ret
	.size	reverse_bits, .-reverse_bits
.global	permute_array
	.type	permute_array, @function
permute_array:
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	rcall .
	rcall .
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 6 */
/* stack size = 24 */
.L__stack_usage = 24
	movw r12,r24
	movw r14,r22
	movw r24,r22
	sbiw r24,1
	ldi r18,0
	ldi r19,0
	sbiw r24,0
	breq .L14
.L15:
	lsr r25
	ror r24
	subi r18,-1
	sbci r19,-1
	sbiw r24,0
	brne .L15
.L14:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	brne .+2
	rjmp .L13
	std Y+6,r13
	std Y+5,r12
	mov r2,__zero_reg__
	mov r3,__zero_reg__
.L17:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L19
	ldi r16,0
	ldi r17,0
	ldi r20,0
	ldi r21,0
	ldi r22,0
.L20:
	movw r24,r2
	mov r0,r22
	rjmp 2f
	1:
	lsr r25
	ror r24
	2:
	dec r0
	brpl 1b
	com r20
	com r21
	add r20,r18
	adc r21,r19
	rjmp 2f
	1:
	lsl r24
	rol r25
	2:
	dec r20
	brpl 1b
	or r16,r24
	or r17,r25
	subi r22,lo8(-(1))
	mov r20,r22
	ldi r21,0
	cp r20,r18
	cpc r21,r19
	brlo .L20
	cp r2,r16
	cpc r3,r17
	brsh .L19
	ldd r26,Y+5
	ldd r27,Y+6
	ld r20,X+
	ld r21,X+
	ld r22,X+
	ld r23,X
	sbiw r26,3
	adiw r26,4
	ld r24,X+
	ld r25,X+
	ld __tmp_reg__,X+
	ld r27,X
	mov r26,__tmp_reg__
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
	lsl r16
	rol r17
	lsl r16
	rol r17
	lsl r16
	rol r17
	add r16,r12
	adc r17,r13
	movw r30,r16
	ld r4,Z
	ldd r5,Z+1
	ldd r6,Z+2
	ldd r7,Z+3
	ldd r8,Z+4
	ldd r9,Z+5
	ldd r10,Z+6
	ldd r11,Z+7
	ldd r26,Y+5
	ldd r27,Y+6
	st X+,r4
	st X+,r5
	st X+,r6
	st X,r7
	sbiw r26,3
	movw r30,r26
	std Z+4,r8
	std Z+5,r9
	std Z+6,r10
	std Z+7,r11
	movw r26,r16
	st X+,r20
	st X+,r21
	st X+,r22
	st X,r23
	sbiw r26,3
	ldd r24,Y+1
	ldd r25,Y+2
	ldd r26,Y+3
	ldd r27,Y+4
	movw r30,r16
	std Z+4,r24
	std Z+5,r25
	std Z+6,r26
	std Z+7,r27
.L19:
	ldi r31,-1
	sub r2,r31
	sbc r3,r31
	ldd r24,Y+5
	ldd r25,Y+6
	adiw r24,8
	std Y+6,r25
	std Y+5,r24
	cp r2,r14
	cpc r3,r15
	breq .+2
	rjmp .L17
.L13:
/* epilogue start */
	adiw r28,6
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
	.size	permute_array, .-permute_array
.global	__floatunsisf
	.section	.text.startup,"ax",@progbits
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	subi r28,-128
	sbc r29,__zero_reg__
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 128 */
/* stack size = 130 */
.L__stack_usage = 130
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	mov r15,__zero_reg__
.L33:
	mov r22,r15
	ldi r23,0
	ldi r24,0
	ldi r25,0
	call __floatunsisf
	movw r30,r16
	st Z,r22
	std Z+1,r23
	std Z+2,r24
	std Z+3,r25
	std Z+4,__zero_reg__
	std Z+5,__zero_reg__
	std Z+6,__zero_reg__
	std Z+7,__zero_reg__
	subi r16,-8
	sbci r17,-1
	inc r15
	ldi r31,lo8(16)
	cpse r15,r31
	rjmp .L33
	ldi r22,lo8(16)
	ldi r23,0
	movw r24,r28
	adiw r24,1
	call permute_array
.L34:
	rjmp .L34
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.1"

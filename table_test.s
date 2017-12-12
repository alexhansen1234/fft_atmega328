	.file	"table_test.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
.global	array1
	.data
	.type	array1, @object
	.size	array1, 8
array1:
	.word	1
	.word	2
	.word	3
	.word	4
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.L2:
	rjmp .L2
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.1"
.global __do_copy_data

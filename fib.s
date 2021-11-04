	.file	"fib.s"
	.text
	.section	.rodata
.LC0:
	.string	"13th Fibonacci = %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$13, %edi
	call	my_fib
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	my_fib
	.type	my_fib, @function
my_fib:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$1, -4(%rbp)
	jg	.L4
	movl	%edi, %eax
	jmp	.L5
.L4:
	movl	-4(%rbp), %ebx
	subl	$1, %ebx
	movl	%ebx, %edi
	call	my_fib
	movl	-4(%rbp), %ebx
	movl	%eax, -8(%rbp)
	subl	$2, %ebx
	movl 	%ebx, %edi
	call	my_fib
	movl	-8(%rbp), %ebx
	addl	%ebx, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	my_fib, .-my_fib
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"iir_provided.c"
	.text
	.comm	X,256,32
	.comm	Y,256,32
	.globl	filter_init
	.type	filter_init, @function
filter_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$2, %rax
	movw	$-32767, (%rax)
	movzwl	(%rax), %edx
	movq	-16(%rbp), %rax
	movw	%dx, (%rax)
	movl	$2, %ebx
	jmp	.L2
.L3:
	movslq	%ebx, %rax
	leaq	(%rax,%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movw	$-1, (%rax)
	addl	$1, %ebx
.L2:
	cmpl	$99, %ebx
	jle	.L3
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movw	$-32767, (%rax)
	movzwl	(%rax), %edx
	movq	-24(%rbp), %rax
	movw	%dx, (%rax)
	nop
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	filter_init, .-filter_init
	.section	.rodata
	.align 8
.LC1:
	.string	"Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n"
	.text
	.globl	print
	.type	print, @function
print:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	Y(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	cwtl
	cvtsi2ss	%eax, %xmm0
	movss	.LC0(%rip), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	Y(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	(%rax,%rax), %rdx
	leaq	Y(%rip), %rax
	movzwl	(%rdx,%rax), %eax
	movswl	%ax, %edx
	movl	-4(%rbp), %esi
	movl	-4(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	print, .-print
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 3, -24
	movw	$4296, -38(%rbp)
	movw	$8592, -36(%rbp)
	movw	$4296, -34(%rbp)
	movw	$24503, -32(%rbp)
	movw	$-8920, -30(%rbp)
	leaq	Y(%rip), %rsi
	leaq	X(%rip), %rdi
	call	filter_init
	movl	$2, %ebx
	jmp	.L6
.L7:
	movswl	-38(%rbp), %edx
	movslq	%ebx, %rax
	leaq	(%rax,%rax), %rcx
	leaq	X(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cwtl
	imull	%edx, %eax
	addl	$16384, %eax
	sarl	$15, %eax
	movl	%eax, -28(%rbp)
	movswl	-36(%rbp), %edx
	leal	-1(%rbx), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	X(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cwtl
	imull	%edx, %eax
	addl	$16384, %eax
	sarl	$15, %eax
	movl	%eax, -24(%rbp)
	movswl	-34(%rbp), %edx
	leal	-2(%rbx), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	X(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cwtl
	imull	%edx, %eax
	addl	$16384, %eax
	sarl	$15, %eax
	movl	%eax, -20(%rbp)
	movswl	-32(%rbp), %edx
	leal	-3(%rbx), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	X(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cwtl
	imull	%edx, %eax
	addl	$16384, %eax
	sarl	$15, %eax
	movl	%eax, -16(%rbp)
	movswl	-38(%rbp), %edx
	leal	-4(%rbx), %eax
	cltq
	leaq	(%rax,%rax), %rcx
	leaq	X(%rip), %rax
	movzwl	(%rcx,%rax), %eax
	cwtl
	imull	%edx, %eax
	addl	$16384, %eax
	sarl	$15, %eax
	movl	%eax, -12(%rbp)
	addl	$1, %ebx
.L6:
	cmpl	$99, %ebx
	jle	.L7
	nop
	addq	$32, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1191182336
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits

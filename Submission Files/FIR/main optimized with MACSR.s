	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	FIR_Init
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR_Init, %function
FIR_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movw	r2, #2598
	mov	r1, #0
	movw	r0, #:lower16:insamp
	movt	r0, #:upper16:insamp
	bl	memset
	pop	{r4, pc}
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r7, r2
	mov	r6, r3
	lsl	r5, r3, #1
	mov	r2, r5
	ldr	r0, .L10
	bl	memcpy
.L6:
	

	cmp	r6, #0
	macsr [r0],[r4],r3  
	bne	.L6
.L4:
	movw	r0, #:lower16:insamp
	movt	r0, #:upper16:insamp
	movw	r2, #998
	add	r1, r0, r5
	bl	memmove
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L11:
	.align	2
.L10:
	.word	insamp+998
	.word	insamp+984
	.size	FIR, .-FIR
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 3200
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #3200
	movw	r1, #:lower16:.LC0
	movt	r1, #:upper16:.LC0
	movw	r0, #:lower16:.LC1
	movt	r0, #:upper16:.LC1
	bl	fopen
	subs	r8, r0, #0
	beq	.L18
	movw	r1, #:lower16:.LC3
	movt	r1, #:upper16:.LC3
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	fopen
	subs	r7, r0, #0
	beq	.L19
	bl	FIR_Init
	mov	r5, #2
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
.L15:
	mov	r3, r8
	mov	r2, #800
	mov	r1, r5
	add	r0, sp, #1600
	bl	fread
	mov	r4, r0
	mov	r3, r0
	mov	r2, sp
	add	r1, sp, #1600
	mov	r0, r6
	bl	FIR
	mov	r3, r7
	mov	r2, r4
	mov	r1, r5
	mov	r0, sp
	bl	fwrite
	cmp	r4, #0
	bne	.L15
	mov	r0, r8
	bl	fclose
	mov	r0, r7
	bl	fclose
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	puts
	mov	r0, #0
	add	sp, sp, #3200
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L18:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	mov	r0, #1
	bl	exit
.L19:
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
	mov	r0, #1
	bl	exit
	.size	main, .-main
	.comm	insamp,2598,4
	.global	coeffs
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	coeffs, %object
	.size	coeffs, 1000
coeffs:
	.short	-1
	.short	-1
	.
	.500 COEFFICIENTS HERE
	.
	.short	6
	.short	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"rb\000"
	.space	1
.LC1:
	.ascii	"noisy.wav\000"
	.space	2
.LC2:
	.ascii	"couldn't open input file\000"
	.space	3
.LC3:
	.ascii	"wb\000"
	.space	1
.LC4:
	.ascii	"outputFIR.wav\000"
	.space	2
.LC5:
	.ascii	"couldn't open output file\000"
	.space	2
.LC6:
	.ascii	"Filtering Complete \000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

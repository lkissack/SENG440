	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"iir_optimized.c"
	.text
	.comm	Y,256,4
	.comm	X,256,4
	.align	2
	.global	filter_init_better
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	filter_init_better, %function
filter_init_better:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	movw	r3, #32769
	movt	r3, 32769
	str	r3, [r2]
	mov	r4, #63
	b	.L2
.L3:
	mov	r3, r4
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r2, r2, r3
	movw	r3, #32767
	movt	r3, 32767
	str	r3, [r2]
	sub	r4, r4, #1
.L2:
	cmp	r4, #0
	bne	.L3
	ldr	r3, [fp, #-12]
	add	r2, r3, #2
	movw	r3, #32769
	movt	r3, 65535
	strh	r3, [r2]	@ movhi
	ldrsh	r2, [r2]
	ldr	r3, [fp, #-12]
	strh	r2, [r3]	@ movhi
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
	bx	lr
	.size	filter_init_better, .-filter_init_better
	.align	2
	.global	filter_init
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	filter_init, %function
filter_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r2, r3, #2
	movw	r3, #32769
	movt	r3, 65535
	strh	r3, [r2]	@ movhi
	ldrsh	r2, [r2]
	ldr	r3, [fp, #-8]
	strh	r2, [r3]	@ movhi
	mov	r4, #2
	b	.L5
.L6:
	mov	r3, r4
	lsl	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	mvn	r2, #32768
	strh	r2, [r3]	@ movhi
	add	r4, r4, #1
.L5:
	cmp	r4, #127
	ble	.L6
	ldr	r3, [fp, #-12]
	add	r2, r3, #2
	movw	r3, #32769
	movt	r3, 65535
	strh	r3, [r2]	@ movhi
	ldrsh	r2, [r2]
	ldr	r3, [fp, #-12]
	strh	r2, [r3]	@ movhi
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
	bx	lr
	.size	filter_init, .-filter_init
	.align	2
	.global	short_int_clipping
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	short_int_clipping, %function
short_int_clipping:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	movw	r2, #32766
	cmp	r3, r2
	ble	.L8
	movw	r3, #32767
	str	r3, [fp, #-8]
.L8:
	ldr	r2, [fp, #-8]
	movw	r3, #32770
	movt	r3, 65535
	cmp	r2, r3
	bge	.L9
	movw	r3, #32769
	movt	r3, 65535
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	sxth	r3, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	short_int_clipping, .-short_int_clipping
	.align	2
	.global	round_shift
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	round_shift, %function
round_shift:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	uxth	r3, r3
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-8]
	orr	r3, r3, #32768
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	asr	r3, r3, #15
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	round_shift, .-round_shift
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\012\000"
	.text
	.align	2
	.global	print
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	print, %function
print:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-8]
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r0, r3
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L15
	vdiv.f32	s15, s14, s13
	vcvt.f64.f32	d7, s15
	vstr.64	d7, [sp, #8]
	ldr	r3, [fp, #-8]
	str	r3, [sp]
	mov	r3, r0
	mov	r2, r1
	ldr	r1, [fp, #-8]
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L16:
	.align	2
.L15:
	.word	1191182336
	.size	print, .-print
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #44
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L21:
	movw	r3, #4296
	strh	r3, [fp, #-34]	@ movhi
	movw	r3, #8592
	strh	r3, [fp, #-36]	@ movhi
	movw	r3, #4296
	strh	r3, [fp, #-38]	@ movhi
	movw	r3, #24503
	strh	r3, [fp, #-40]	@ movhi
	movw	r3, #56616
	movt	r3, 65535
	strh	r3, [fp, #-42]	@ movhi
	movw	r1, #:lower16:Y
	movt	r1, #:upper16:Y
	movw	r0, #:lower16:X
	movt	r0, #:upper16:X
	bl	filter_init_better
	mov	r4, #2
	b	.L19
.L20:
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r2, r4, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r8, r3
	sub	r2, r4, #1
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r2, r2, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r7, r3
	ldrsh	r2, [fp, #-38]
	sub	r1, r4, #2
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-48]
	sub	r2, r4, #1
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r2, r2, #1
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r6, r3
	ldrsh	r2, [fp, #-42]
	sub	r1, r4, #2
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-52]
	ldrsh	r3, [fp, #-34]
	mul	r3, r3, r8
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-56]
	ldrsh	r3, [fp, #-36]
	mul	r3, r3, r7
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-60]
	ldrsh	r3, [fp, #-40]
	mul	r3, r3, r6
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-64]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	movw	r2, #32767
	cmp	r3, r2
	movlt	r3, r3
	movge	r3, r2
	sxth	r2, r3
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r4, #1
	add	r3, r3, r1
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-34]
	add	r1, r4, #1
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-56]
	ldrsh	r3, [fp, #-36]
	mul	r3, r3, r8
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-60]
	ldrsh	r3, [fp, #-38]
	mul	r3, r3, r7
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-48]
	ldrsh	r2, [fp, #-40]
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r4, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-64]
	ldrsh	r3, [fp, #-42]
	mul	r3, r3, r6
	add	r5, r3, #16384
	mov	r0, r5
	bl	round_shift
	str	r0, [fp, #-52]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	movw	r2, #32767
	cmp	r3, r2
	movlt	r3, r3
	movge	r3, r2
	add	r1, r4, #1
	sxth	r2, r3
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r1, #1
	add	r3, r3, r1
	strh	r2, [r3]	@ movhi
	add	r4, r4, #2
.L19:
	and	r3, r4, #128
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	movw	r2, #9999
	cmp	r3, r2
	ble	.L21
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

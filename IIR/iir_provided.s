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
	.file	"iir_provided.c"
	.text
	.comm	X,256,4
	.comm	Y,256,4
	.align	2
	.global	filter_init
	.arch armv7-a
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
	b	.L2
.L3:
	mov	r3, r4
	lsl	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	add	r4, r4, #1
.L2:
	cmp	r4, #99
	ble	.L3
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
	vldr.32	s13, .L5
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
.L6:
	.align	2
.L5:
	.word	1191182336
	.size	print, .-print
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	movw	r3, #4296
	strh	r3, [fp, #-14]	@ movhi
	movw	r3, #8592
	strh	r3, [fp, #-16]	@ movhi
	movw	r3, #4296
	strh	r3, [fp, #-18]	@ movhi
	movw	r3, #24503
	strh	r3, [fp, #-20]	@ movhi
	movw	r3, #56616
	movt	r3, 65535
	strh	r3, [fp, #-22]	@ movhi
	movw	r1, #:lower16:Y
	movt	r1, #:upper16:Y
	movw	r0, #:lower16:X
	movt	r0, #:upper16:X
	bl	filter_init
	mov	r4, #2
	b	.L8
.L9:
	ldrsh	r2, [fp, #-14]
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r1, r4, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r3, r3, #16384
	asr	r3, r3, #15
	str	r3, [fp, #-28]
	ldrsh	r2, [fp, #-16]
	sub	r1, r4, #1
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r3, r3, #16384
	asr	r3, r3, #15
	str	r3, [fp, #-32]
	ldrsh	r2, [fp, #-18]
	sub	r1, r4, #2
	movw	r3, #:lower16:X
	movt	r3, #:upper16:X
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r3, r3, #16384
	asr	r3, r3, #15
	str	r3, [fp, #-36]
	ldrsh	r2, [fp, #-20]
	sub	r1, r4, #1
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r3, r3, #16384
	asr	r3, r3, #15
	str	r3, [fp, #-40]
	ldrsh	r2, [fp, #-14]
	sub	r1, r4, #2
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r1, #1
	add	r3, r3, r1
	ldrsh	r3, [r3]
	mul	r3, r3, r2
	add	r3, r3, #16384
	asr	r3, r3, #15
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-28]
	uxth	r2, r3
	ldr	r3, [fp, #-32]
	uxth	r3, r3
	add	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-36]
	uxth	r3, r3
	add	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-40]
	uxth	r3, r3
	add	r3, r2, r3
	uxth	r2, r3
	ldr	r3, [fp, #-44]
	uxth	r3, r3
	add	r3, r2, r3
	uxth	r3, r3
	sxth	r2, r3
	movw	r3, #:lower16:Y
	movt	r3, #:upper16:Y
	lsl	r1, r4, #1
	add	r3, r3, r1
	strh	r2, [r3]	@ movhi
	add	r4, r4, #1
.L8:
	cmp	r4, #99
	ble	.L9
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

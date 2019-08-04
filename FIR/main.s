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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #44
	mov	r4, r0
	lsl	r5, r0, #1
	str	r5, [sp, #36]
	mov	r2, r5
	movw	r1, #:lower16:dat
	movt	r1, #:upper16:dat
	ldr	r0, .L10
	bl	memcpy
	cmp	r4, #0
	ble	.L4
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrsh	fp, [r3]
	ldrsh	r2, [r3, #2]
	str	r2, [sp, #4]
	ldrsh	r2, [r3, #4]
	str	r2, [sp, #8]
	ldrsh	r2, [r3, #6]
	str	r2, [sp, #12]
	ldrsh	r2, [r3, #8]
	str	r2, [sp, #16]
	ldrsh	r2, [r3, #10]
	str	r2, [sp, #20]
	ldrsh	r2, [r3, #12]
	str	r2, [sp, #24]
	ldrsh	r3, [r3, #14]
	str	r3, [sp, #28]
	ldr	r2, .L10+4
	movw	r9, #:lower16:dat
	movt	r9, #:upper16:dat
	add	r3, r5, r9
	str	r3, [sp, #32]
	movw	r10, #:lower16:.LANCHOR0
	movt	r10, #:upper16:.LANCHOR0
	add	r7, r10, #1008
.L6:
	ldrsh	r1, [r2, #14]
	ldrsh	ip, [r2, #12]
	ldrsh	r3, [r2, #10]
	ldr	r0, [sp, #8]
	mul	r3, r0, r3
	mla	r1, fp, r1, r3
	ldrsh	r3, [r2, #8]
	ldr	r0, [sp, #12]
	mul	r3, r0, r3
	ldr	r0, [sp, #4]
	mla	r3, r0, ip, r3
	ldrsh	r4, [r2, #6]
	ldr	r0, [sp, #16]
	mla	r1, r0, r4, r1
	ldrsh	ip, [r2, #4]
	ldr	r0, [sp, #20]
	mla	r3, r0, ip, r3
	mov	r8, r2
	ldrsh	r4, [r8, #2]!
	ldr	r0, [sp, #24]
	mla	r4, r0, r4, r1
	ldrsh	ip, [r2], #-18
	ldr	r1, [sp, #28]
	mla	ip, r1, ip, r3
	add	r3, r10, #32
	mov	r0, #1024
.L5:
	add	r4, r0, r4
	add	r0, r4, ip
	ldrsh	lr, [r3, #-16]
	ldrsh	r5, [r2, #16]
	ldrsh	ip, [r3, #-14]
	ldrsh	r4, [r2, #14]
	ldrsh	r1, [r3, #-12]
	ldrsh	r6, [r2, #12]
	mul	r6, r6, r1
	mla	r5, r5, lr, r6
	ldrsh	lr, [r3, #-10]
	ldrsh	r1, [r2, #10]
	mul	r1, r1, lr
	mla	r1, r4, ip, r1
	ldrsh	r4, [r3, #-8]
	ldrsh	lr, [r2, #8]
	mla	lr, lr, r4, r5
	ldrsh	ip, [r3, #-6]
	ldrsh	r4, [r2, #6]
	mla	r1, r4, ip, r1
	ldrsh	r4, [r3, #-4]
	ldrsh	ip, [r2, #4]
	mla	r4, ip, r4, lr
	ldrsh	ip, [r3, #-2]
	ldrsh	lr, [r2, #2]
	mla	ip, lr, ip, r1
	add	r4, r4, #128
	asr	r4, r4, #6
	add	ip, ip, #128
	asr	ip, ip, #6
	add	r3, r3, #16
	sub	r2, r2, #16
	cmp	r3, r7
	bne	.L5
	add	r0, r0, r4
	add	r0, ip, r0
	asr	r0, r0, #9
	strh	r0, [r9], #2	@ movhi
	mov	r2, r8
	ldr	r3, [sp, #32]
	cmp	r9, r3
	bne	.L6
.L4:
	movw	r0, #:lower16:insamp
	movt	r0, #:upper16:insamp
	movw	r2, #998
	ldr	r3, [sp, #36]
	add	r1, r0, r3
	bl	memmove
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
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
	movw	r5, #:lower16:dat
	movt	r5, #:upper16:dat
	mov	r9, #800
	mov	r6, #2
.L15:
	mov	r3, r8
	mov	r2, r9
	mov	r1, r6
	mov	r0, r5
	bl	fread
	mov	r4, r0
	bl	FIR
	mov	r3, r7
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
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
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
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
	.comm	dat,1600,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	coeffs, %object
	.size	coeffs, 1000
coeffs:
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-2
	.short	6
	.short	-2
	.short	6
	.short	-2
	.short	6
	.short	-3
	.short	6
	.short	-3
	.short	6
	.short	-4
	.short	6
	.short	-4
	.short	5
	.short	-5
	.short	5
	.short	-6
	.short	5
	.short	-6
	.short	5
	.short	-7
	.short	4
	.short	-8
	.short	4
	.short	-10
	.short	3
	.short	-11
	.short	2
	.short	-12
	.short	2
	.short	-14
	.short	1
	.short	-15
	.short	0
	.short	-17
	.short	-1
	.short	-19
	.short	-2
	.short	-21
	.short	-3
	.short	-23
	.short	-4
	.short	-25
	.short	-5
	.short	-27
	.short	-6
	.short	-29
	.short	-7
	.short	-32
	.short	-9
	.short	-34
	.short	-10
	.short	-36
	.short	-11
	.short	-39
	.short	-12
	.short	-41
	.short	-13
	.short	-44
	.short	-14
	.short	-46
	.short	-15
	.short	-48
	.short	-15
	.short	-50
	.short	-16
	.short	-52
	.short	-16
	.short	-54
	.short	-16
	.short	-56
	.short	-16
	.short	-57
	.short	-16
	.short	-58
	.short	-15
	.short	-59
	.short	-14
	.short	-60
	.short	-12
	.short	-61
	.short	-10
	.short	-61
	.short	-8
	.short	-60
	.short	-6
	.short	-60
	.short	-3
	.short	-59
	.short	1
	.short	-58
	.short	5
	.short	-56
	.short	9
	.short	-54
	.short	14
	.short	-51
	.short	20
	.short	-48
	.short	25
	.short	-45
	.short	32
	.short	-41
	.short	38
	.short	-38
	.short	46
	.short	-33
	.short	53
	.short	-29
	.short	61
	.short	-24
	.short	70
	.short	-19
	.short	78
	.short	-13
	.short	87
	.short	-8
	.short	96
	.short	-2
	.short	106
	.short	3
	.short	115
	.short	9
	.short	125
	.short	15
	.short	135
	.short	20
	.short	145
	.short	25
	.short	154
	.short	30
	.short	164
	.short	35
	.short	173
	.short	40
	.short	182
	.short	44
	.short	191
	.short	47
	.short	200
	.short	50
	.short	208
	.short	52
	.short	216
	.short	54
	.short	223
	.short	54
	.short	229
	.short	54
	.short	236
	.short	53
	.short	241
	.short	51
	.short	246
	.short	48
	.short	250
	.short	45
	.short	253
	.short	39
	.short	255
	.short	33
	.short	257
	.short	26
	.short	258
	.short	18
	.short	259
	.short	8
	.short	258
	.short	-3
	.short	257
	.short	-15
	.short	256
	.short	-28
	.short	253
	.short	-43
	.short	250
	.short	-59
	.short	247
	.short	-75
	.short	244
	.short	-94
	.short	240
	.short	-113
	.short	236
	.short	-134
	.short	232
	.short	-155
	.short	228
	.short	-178
	.short	224
	.short	-203
	.short	221
	.short	-228
	.short	218
	.short	-255
	.short	216
	.short	-283
	.short	216
	.short	-312
	.short	217
	.short	-343
	.short	219
	.short	-376
	.short	224
	.short	-411
	.short	232
	.short	-448
	.short	243
	.short	-488
	.short	258
	.short	-532
	.short	278
	.short	-580
	.short	304
	.short	-634
	.short	339
	.short	-695
	.short	384
	.short	-767
	.short	443
	.short	-854
	.short	522
	.short	-963
	.short	630
	.short	-1106
	.short	783
	.short	-1304
	.short	1012
	.short	-1602
	.short	1386
	.short	-2113
	.short	2096
	.short	-3200
	.short	3949
	.short	-7176
	.short	20638
	.short	20638
	.short	-7176
	.short	3949
	.short	-3200
	.short	2096
	.short	-2113
	.short	1386
	.short	-1602
	.short	1012
	.short	-1304
	.short	783
	.short	-1106
	.short	630
	.short	-963
	.short	522
	.short	-854
	.short	443
	.short	-767
	.short	384
	.short	-695
	.short	339
	.short	-634
	.short	304
	.short	-580
	.short	278
	.short	-532
	.short	258
	.short	-488
	.short	243
	.short	-448
	.short	232
	.short	-411
	.short	224
	.short	-376
	.short	219
	.short	-343
	.short	217
	.short	-312
	.short	216
	.short	-283
	.short	216
	.short	-255
	.short	218
	.short	-228
	.short	221
	.short	-203
	.short	224
	.short	-178
	.short	228
	.short	-155
	.short	232
	.short	-134
	.short	236
	.short	-113
	.short	240
	.short	-94
	.short	244
	.short	-75
	.short	247
	.short	-59
	.short	250
	.short	-43
	.short	253
	.short	-28
	.short	256
	.short	-15
	.short	257
	.short	-3
	.short	258
	.short	8
	.short	259
	.short	18
	.short	258
	.short	26
	.short	257
	.short	33
	.short	255
	.short	39
	.short	253
	.short	45
	.short	250
	.short	48
	.short	246
	.short	51
	.short	241
	.short	53
	.short	236
	.short	54
	.short	229
	.short	54
	.short	223
	.short	54
	.short	216
	.short	52
	.short	208
	.short	50
	.short	200
	.short	47
	.short	191
	.short	44
	.short	182
	.short	40
	.short	173
	.short	35
	.short	164
	.short	30
	.short	154
	.short	25
	.short	145
	.short	20
	.short	135
	.short	15
	.short	125
	.short	9
	.short	115
	.short	3
	.short	106
	.short	-2
	.short	96
	.short	-8
	.short	87
	.short	-13
	.short	78
	.short	-19
	.short	70
	.short	-24
	.short	61
	.short	-29
	.short	53
	.short	-33
	.short	46
	.short	-38
	.short	38
	.short	-41
	.short	32
	.short	-45
	.short	25
	.short	-48
	.short	20
	.short	-51
	.short	14
	.short	-54
	.short	9
	.short	-56
	.short	5
	.short	-58
	.short	1
	.short	-59
	.short	-3
	.short	-60
	.short	-6
	.short	-60
	.short	-8
	.short	-61
	.short	-10
	.short	-61
	.short	-12
	.short	-60
	.short	-14
	.short	-59
	.short	-15
	.short	-58
	.short	-16
	.short	-57
	.short	-16
	.short	-56
	.short	-16
	.short	-54
	.short	-16
	.short	-52
	.short	-16
	.short	-50
	.short	-15
	.short	-48
	.short	-15
	.short	-46
	.short	-14
	.short	-44
	.short	-13
	.short	-41
	.short	-12
	.short	-39
	.short	-11
	.short	-36
	.short	-10
	.short	-34
	.short	-9
	.short	-32
	.short	-7
	.short	-29
	.short	-6
	.short	-27
	.short	-5
	.short	-25
	.short	-4
	.short	-23
	.short	-3
	.short	-21
	.short	-2
	.short	-19
	.short	-1
	.short	-17
	.short	0
	.short	-15
	.short	1
	.short	-14
	.short	2
	.short	-12
	.short	2
	.short	-11
	.short	3
	.short	-10
	.short	4
	.short	-8
	.short	4
	.short	-7
	.short	5
	.short	-6
	.short	5
	.short	-6
	.short	5
	.short	-5
	.short	5
	.short	-4
	.short	6
	.short	-4
	.short	6
	.short	-3
	.short	6
	.short	-3
	.short	6
	.short	-2
	.short	6
	.short	-2
	.short	6
	.short	-2
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
	.short	6
	.short	-1
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

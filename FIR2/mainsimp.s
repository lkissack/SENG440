	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"mainsimp.c"
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
	@ link register save eliminated.
	movw	r0, #:lower16:insamp
	movw	r2, #2598
	movt	r0, #:upper16:insamp
	mov	r1, #0
	b	memset
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r10, r3, #0
	ldr	r9, [sp, #36]
	lslle	r10, r10, #1
	ble	.L4
	mov	r6, #64
	lsl	r5, r9, #1
	sub	r7, r2, #2
	lsl	r10, r10, #1
	add	r8, r1, r5
	add	fp, r7, r10
	add	r5, r0, r5
.L7:
	cmp	r9, #0
	blt	.L5
	mov	lr, r8
	sub	r2, r0, #2
.L6:
	ldrh	r3, [r2, #2]!
	ldrh	r4, [lr, #-2]!
	cmp	r5, r2
	smlabb	r3, r3, r4, r6
	add	ip, ip, r3, asr #7
	bne	.L6
.L5:
	add	ip, ip, #16384
	asr	r3, ip, #15
	strh	r3, [r7, #2]!	@ movhi
	cmp	fp, r7
	add	r8, r8, #2
	bne	.L7
.L4:
	movw	r0, #:lower16:insamp
	sub	r2, r9, #1
	movt	r0, #:upper16:insamp
	add	r1, r0, r10
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	lsl	r2, r2, #1
	b	memmove
	.size	FIR, .-FIR
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1600
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #1600
	sub	sp, sp, #8
	movt	r1, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	bl	fopen
	subs	r7, r0, #0
	beq	.L20
	movw	r1, #:lower16:.LC3
	movw	r0, #:lower16:.LC4
	movt	r1, #:upper16:.LC3
	movt	r0, #:upper16:.LC4
	bl	fopen
	subs	r6, r0, #0
	beq	.L18
	movw	r5, #:lower16:insamp
	ldr	r8, .L21
	movt	r5, #:upper16:insamp
.L15:
	mov	r3, r7
	mov	r2, #800
	mov	r1, #2
	mov	r0, r8
	bl	fread
	mov	r2, #500
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	mov	r3, r4
	str	r2, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r2, sp, #8
	mov	r1, r5
	bl	FIR
	mov	r3, r6
	mov	r2, r4
	mov	r1, #2
	add	r0, sp, #8
	bl	fwrite
	cmp	r4, #0
	bne	.L15
	mov	r0, r7
	bl	fclose
	mov	r0, r6
	bl	fclose
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	puts
	movw	r0, #:lower16:.LC7
	mov	r1, #1000
	movt	r0, #:upper16:.LC7
	bl	printf
	mov	r0, r4
	add	sp, sp, #1600
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L20:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printf
	mov	r0, #1
	bl	exit
.L18:
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	printf
	mov	r0, #1
	bl	exit
.L22:
	.align	2
.L21:
	.word	insamp+998
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
.LC7:
	.ascii	"%d \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
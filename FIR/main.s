	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 6	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  main.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -O0 -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
@ -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
@ -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
@ -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
@ -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
@ -fplt -fprefetch-loop-arrays -freg-struct-return
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
@ -fsched-stalled-insns-dep -fsemantic-interposition -fshow-column
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fssa-backprop -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls
@ -ftrapping-math -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
@ -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm -mbe32
@ -mglibc -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

	.text
	.global	coeffs
	.data
	.align	2
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
	.comm	insamp,2598,4
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
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
@ main.c:25:     memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
	movw	r2, #2598	@,
	mov	r1, #0	@,
	movw	r0, #:lower16:insamp	@,
	movt	r0, #:upper16:insamp	@,
	bl	memset		@
@ main.c:26: }
	nop	
	pop	{fp, pc}	@
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #40	@,,
	str	r0, [fp, #-32]	@ filter_coeffs, filter_coeffs
	str	r1, [fp, #-36]	@ input, input
	str	r2, [fp, #-40]	@ output, output
	str	r3, [fp, #-44]	@ length, length
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t)); //copy the samples out of memory into the buffer
	ldr	r3, [fp, #4]	@ tmp131, filt_length
	sub	r3, r3, #1	@ _1, tmp131,
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t)); //copy the samples out of memory into the buffer
	lsl	r2, r3, #1	@ tmp132, _1,
	movw	r3, #:lower16:insamp	@ tmp133,
	movt	r3, #:upper16:insamp	@ tmp133,
	add	r0, r2, r3	@ _2, tmp132, tmp133
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t)); //copy the samples out of memory into the buffer
	ldr	r3, [fp, #-44]	@ length.0_3, length
	lsl	r3, r3, #1	@ _4, length.0_3,
	mov	r2, r3	@, _4
	ldr	r1, [fp, #-36]	@, input
	bl	memcpy		@
@ main.c:43:     for (int n = 0; n<length; n++)
	mov	r3, #0	@ tmp134,
	str	r3, [fp, #-20]	@ tmp134, n
@ main.c:43:     for (int n = 0; n<length; n++)
	b	.L3		@
.L6:
@ main.c:45:     h=filter_coeffs;
	ldr	r3, [fp, #-32]	@ tmp135, filter_coeffs
	str	r3, [fp, #-12]	@ tmp135, h
@ main.c:46:     x=&insamp[filt_length - 1 + n]; //assign address of sample
	ldr	r3, [fp, #4]	@ tmp136, filt_length
	sub	r2, r3, #1	@ _5, tmp136,
@ main.c:46:     x=&insamp[filt_length - 1 + n]; //assign address of sample
	ldr	r3, [fp, #-20]	@ tmp137, n
	add	r3, r2, r3	@ _6, _5, tmp137
@ main.c:46:     x=&insamp[filt_length - 1 + n]; //assign address of sample
	lsl	r2, r3, #1	@ tmp138, _6,
	movw	r3, #:lower16:insamp	@ tmp140,
	movt	r3, #:upper16:insamp	@ tmp140,
	add	r3, r2, r3	@ tmp139, tmp138, tmp140
	str	r3, [fp, #-16]	@ tmp139, x
@ main.c:48:         for (int k = 0; k<filt_length; k++)
	mov	r3, #0	@ tmp141,
	str	r3, [fp, #-24]	@ tmp141, k
@ main.c:48:         for (int k = 0; k<filt_length; k++)
	b	.L4		@
.L5:
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldr	r3, [fp, #-12]	@ h.1_7, h
	add	r2, r3, #2	@ tmp142, h.1_7,
	str	r2, [fp, #-12]	@ tmp142, h
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r3]	@ _8, *h.1_7
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mov	r1, r3	@ _9, _8
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldr	r3, [fp, #-16]	@ x.2_10, x
	sub	r2, r3, #2	@ tmp143, x.2_10,
	str	r2, [fp, #-16]	@ tmp143, x
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r3]	@ _11, *x.2_10
@ main.c:50:             temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mul	r3, r3, r1	@ tmp144, _12, _9
	str	r3, [fp, #-28]	@ tmp144, temp
@ main.c:53:             acc = acc + temp;
	ldr	r2, [fp, #-8]	@ tmp146, acc
	ldr	r3, [fp, #-28]	@ tmp147, temp
	add	r3, r2, r3	@ tmp145, tmp146, tmp147
	str	r3, [fp, #-8]	@ tmp145, acc
@ main.c:48:         for (int k = 0; k<filt_length; k++)
	ldr	r3, [fp, #-24]	@ tmp149, k
	add	r3, r3, #1	@ tmp148, tmp149,
	str	r3, [fp, #-24]	@ tmp148, k
.L4:
@ main.c:48:         for (int k = 0; k<filt_length; k++)
	ldr	r2, [fp, #-24]	@ tmp150, k
	ldr	r3, [fp, #4]	@ tmp151, filt_length
	cmp	r2, r3	@ tmp150, tmp151
	blt	.L5		@,
@ main.c:62:         acc = acc + (1 << 14);
	ldr	r3, [fp, #-8]	@ tmp153, acc
	add	r3, r3, #16384	@ tmp152, tmp153,
	str	r3, [fp, #-8]	@ tmp152, acc
@ main.c:63:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	ldr	r3, [fp, #-8]	@ tmp154, acc
	asr	r1, r3, #15	@ _13, tmp154,
@ main.c:63:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	ldr	r3, [fp, #-20]	@ n.3_14, n
	lsl	r3, r3, #1	@ _15, n.3_14,
	ldr	r2, [fp, #-40]	@ tmp155, output
	add	r3, r2, r3	@ _16, tmp155, _15
@ main.c:63:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	sxth	r2, r1	@ _17, _13
@ main.c:63:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	strh	r2, [r3]	@ movhi	@ _17, *_16
@ main.c:43:     for (int n = 0; n<length; n++)
	ldr	r3, [fp, #-20]	@ tmp157, n
	add	r3, r3, #1	@ tmp156, tmp157,
	str	r3, [fp, #-20]	@ tmp156, n
.L3:
@ main.c:43:     for (int n = 0; n<length; n++)
	ldr	r2, [fp, #-20]	@ tmp158, n
	ldr	r3, [fp, #-44]	@ tmp159, length
	cmp	r2, r3	@ tmp158, tmp159
	blt	.L6		@,
@ main.c:67:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	ldr	r3, [fp, #-44]	@ tmp161, length
	lsl	r2, r3, #1	@ tmp160, tmp161,
	movw	r3, #:lower16:insamp	@ tmp162,
	movt	r3, #:upper16:insamp	@ tmp162,
	add	r1, r2, r3	@ _18, tmp160, tmp162
@ main.c:67:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	ldr	r3, [fp, #4]	@ tmp163, filt_length
	sub	r3, r3, #1	@ _19, tmp163,
@ main.c:67:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	lsl	r3, r3, #1	@ _21, _20,
	mov	r2, r3	@, _21
	movw	r0, #:lower16:insamp	@,
	movt	r0, #:upper16:insamp	@,
	bl	memmove		@
@ main.c:68: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
	.size	FIR, .-FIR
	.section	.rodata
	.align	2
.LC0:
	.ascii	"rb\000"
	.align	2
.LC1:
	.ascii	"noisy.wav\000"
	.align	2
.LC2:
	.ascii	"couldn't open input file\000"
	.align	2
.LC3:
	.ascii	"wb\000"
	.align	2
.LC4:
	.ascii	"outputFIR.wav\000"
	.align	2
.LC5:
	.ascii	"couldn't open output file\000"
	.align	2
.LC6:
	.ascii	"Filtering Complete \000"
	.align	2
.LC7:
	.ascii	"%d \012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 3216
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #3216	@,,
	sub	sp, sp, #8	@,,
@ main.c:79:     in_fid = fopen( "noisy.wav", "rb" );
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
	str	r0, [fp, #-8]	@, in_fid
@ main.c:80:     if ( in_fid == 0 ) {
	ldr	r3, [fp, #-8]	@ tmp114, in_fid
	cmp	r3, #0	@ tmp114,
	bne	.L8		@,
@ main.c:81:         printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:82:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L8:
@ main.c:86:     out_fid = fopen( "outputFIR.wav", "wb" );
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
	str	r0, [fp, #-12]	@, out_fid
@ main.c:87:     if ( out_fid == 0 ) {
	ldr	r3, [fp, #-12]	@ tmp115, out_fid
	cmp	r3, #0	@ tmp115,
	bne	.L9		@,
@ main.c:88:         printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:89:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L9:
@ main.c:93:     FIR_Init();
	bl	FIR_Init		@
.L10:
@ main.c:98:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	sub	r0, fp, #1600	@ tmp116,,
	sub	r0, r0, #4	@ tmp116, tmp116,
	sub	r0, r0, #12	@ tmp116, tmp116,
	ldr	r3, [fp, #-8]	@, in_fid
	mov	r2, #800	@,
	mov	r1, #2	@,
	bl	fread		@
	mov	r3, r0	@ _1,
@ main.c:98:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	str	r3, [fp, #-16]	@ _1, size
@ main.c:100:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	sub	r2, fp, #3200	@ tmp117,,
	sub	r2, r2, #4	@ tmp117, tmp117,
	sub	r2, r2, #12	@ tmp117, tmp117,
	sub	r1, fp, #1600	@ tmp118,,
	sub	r1, r1, #4	@ tmp118, tmp118,
	sub	r1, r1, #12	@ tmp118, tmp118,
	mov	r3, #500	@ tmp119,
	str	r3, [sp]	@ tmp119,
	ldr	r3, [fp, #-16]	@, size
	movw	r0, #:lower16:coeffs	@,
	movt	r0, #:upper16:coeffs	@,
	bl	FIR		@
@ main.c:102:         fwrite( output, sizeof(int16_t), size, out_fid );
	ldr	r2, [fp, #-16]	@ size.4_2, size
	sub	r0, fp, #3200	@ tmp120,,
	sub	r0, r0, #4	@ tmp120, tmp120,
	sub	r0, r0, #12	@ tmp120, tmp120,
	ldr	r3, [fp, #-12]	@, out_fid
	mov	r1, #2	@,
	bl	fwrite		@
@ main.c:103:     } while ( size != 0 );
	ldr	r3, [fp, #-16]	@ tmp121, size
	cmp	r3, #0	@ tmp121,
	bne	.L10		@,
@ main.c:105:     fclose( in_fid );
	ldr	r0, [fp, #-8]	@, in_fid
	bl	fclose		@
@ main.c:106:     fclose( out_fid );
	ldr	r0, [fp, #-12]	@, out_fid
	bl	fclose		@
@ main.c:108:     printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:109:     printf("%d \n",(int)sizeof(coeffs));
	mov	r1, #1000	@,
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
	bl	printf		@
@ main.c:112:     return 0;
	mov	r3, #0	@ _22,
@ main.c:113: }
	mov	r0, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

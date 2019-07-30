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
	.file	"mainsimp.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  mainsimp.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -fverbose-asm
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
	.comm	buffer,2598,4
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
@ mainsimp.c:24:     memset( buffer, 0, sizeof( buffer ) );//initiate space in memory
	movw	r2, #2598	@,
	mov	r1, #0	@,
	movw	r0, #:lower16:buffer	@,
	movt	r0, #:upper16:buffer	@,
	bl	memset		@
@ mainsimp.c:25: } 
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #24	@,,
	str	r0, [fp, #-24]	@ output, output
	str	r1, [fp, #-28]	@ length, length
@ mainsimp.c:35:     register int j = 0;
	mov	r4, #0	@ j,
@ mainsimp.c:39:     for (int n = 0; n<length; n++)
	mov	r3, #0	@ tmp121,
	str	r3, [fp, #-12]	@ tmp121, n
@ mainsimp.c:39:     for (int n = 0; n<length; n++)
	b	.L3		@
.L8:
@ mainsimp.c:42:     j = (MAX_FILT_LENGTH + n - 1);
	ldr	r3, [fp, #-12]	@ tmp122, n
	add	r4, r3, #496	@ j, tmp122,
	add	r4, r4, #3	@ j, j,
@ mainsimp.c:44:         for (int k = 0; k<=(MAX_FILT_LENGTH); k++)
	mov	r3, #0	@ tmp123,
	str	r3, [fp, #-16]	@ tmp123, k
@ mainsimp.c:44:         for (int k = 0; k<=(MAX_FILT_LENGTH); k++)
	b	.L4		@
.L5:
@ mainsimp.c:46:             temp = (int32_t)(coeffs[k])*(int32_t)(buffer[j-k]); //perform multiplication and add to accumulator
	movw	r3, #:lower16:coeffs	@ tmp124,
	movt	r3, #:upper16:coeffs	@ tmp124,
	ldr	r2, [fp, #-16]	@ tmp125, k
	lsl	r2, r2, #1	@ tmp126, tmp125,
	add	r3, r3, r2	@ tmp127, tmp124, tmp126
	ldrsh	r3, [r3]	@ _1, coeffs
@ mainsimp.c:46:             temp = (int32_t)(coeffs[k])*(int32_t)(buffer[j-k]); //perform multiplication and add to accumulator
	mov	r1, r3	@ _2, _1
@ mainsimp.c:46:             temp = (int32_t)(coeffs[k])*(int32_t)(buffer[j-k]); //perform multiplication and add to accumulator
	ldr	r3, [fp, #-16]	@ tmp128, k
	sub	r2, r4, r3	@ _3, j, tmp128
@ mainsimp.c:46:             temp = (int32_t)(coeffs[k])*(int32_t)(buffer[j-k]); //perform multiplication and add to accumulator
	movw	r3, #:lower16:buffer	@ tmp129,
	movt	r3, #:upper16:buffer	@ tmp129,
	lsl	r2, r2, #1	@ tmp130, _3,
	add	r3, r3, r2	@ tmp131, tmp129, tmp130
	ldrsh	r3, [r3]	@ _4, buffer
@ mainsimp.c:46:             temp = (int32_t)(coeffs[k])*(int32_t)(buffer[j-k]); //perform multiplication and add to accumulator
	mul	r3, r3, r1	@ tmp132, _5, _2
	str	r3, [fp, #-20]	@ tmp132, temp
@ mainsimp.c:47:             temp = temp + (1<<6); //rounding 
	ldr	r3, [fp, #-20]	@ tmp134, temp
	add	r3, r3, #64	@ tmp133, tmp134,
	str	r3, [fp, #-20]	@ tmp133, temp
@ mainsimp.c:48:             temp >>= 7;           //shift
	ldr	r3, [fp, #-20]	@ tmp136, temp
	asr	r3, r3, #7	@ tmp135, tmp136,
	str	r3, [fp, #-20]	@ tmp135, temp
@ mainsimp.c:49:             acc = acc + temp;
	ldr	r2, [fp, #-8]	@ tmp138, acc
	ldr	r3, [fp, #-20]	@ tmp139, temp
	add	r3, r2, r3	@ tmp137, tmp138, tmp139
	str	r3, [fp, #-8]	@ tmp137, acc
@ mainsimp.c:44:         for (int k = 0; k<=(MAX_FILT_LENGTH); k++)
	ldr	r3, [fp, #-16]	@ tmp141, k
	add	r3, r3, #1	@ tmp140, tmp141,
	str	r3, [fp, #-16]	@ tmp140, k
.L4:
@ mainsimp.c:44:         for (int k = 0; k<=(MAX_FILT_LENGTH); k++)
	ldr	r3, [fp, #-16]	@ tmp142, k
	cmp	r3, #500	@ tmp142,
	ble	.L5		@,
@ mainsimp.c:53:         if( acc > upper_limit){ //check if accumulator has saturated
	ldr	r3, [fp, #-8]	@ tmp143, acc
	cmn	r3, #-1073741823	@ tmp143,
	ble	.L6		@,
@ mainsimp.c:54:             acc=upper_limit;
	mvn	r3, #-1073741824	@ tmp144,
	str	r3, [fp, #-8]	@ tmp144, acc
	b	.L7		@
.L6:
@ mainsimp.c:55:         } else if (acc < lower_limit) {
	ldr	r3, [fp, #-8]	@ tmp145, acc
	cmp	r3, #-1073741824	@ tmp145,
	bge	.L7		@,
@ mainsimp.c:56:             acc=lower_limit;
	mov	r3, #-1073741824	@ tmp146,
	str	r3, [fp, #-8]	@ tmp146, acc
.L7:
@ mainsimp.c:58:         acc = acc + (1 << 14);
	ldr	r3, [fp, #-8]	@ tmp148, acc
	add	r3, r3, #16384	@ tmp147, tmp148,
	str	r3, [fp, #-8]	@ tmp147, acc
@ mainsimp.c:59:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	ldr	r3, [fp, #-8]	@ tmp149, acc
	asr	r1, r3, #15	@ _6, tmp149,
@ mainsimp.c:59:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	ldr	r3, [fp, #-12]	@ n.0_7, n
	lsl	r3, r3, #1	@ _8, n.0_7,
	ldr	r2, [fp, #-24]	@ tmp150, output
	add	r3, r2, r3	@ _9, tmp150, _8
@ mainsimp.c:59:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	sxth	r2, r1	@ _10, _6
@ mainsimp.c:59:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	strh	r2, [r3]	@ movhi	@ _10, *_9
@ mainsimp.c:39:     for (int n = 0; n<length; n++)
	ldr	r3, [fp, #-12]	@ tmp152, n
	add	r3, r3, #1	@ tmp151, tmp152,
	str	r3, [fp, #-12]	@ tmp151, n
.L3:
@ mainsimp.c:39:     for (int n = 0; n<length; n++)
	ldr	r2, [fp, #-12]	@ tmp153, n
	ldr	r3, [fp, #-28]	@ tmp154, length
	cmp	r2, r3	@ tmp153, tmp154
	blt	.L8		@,
@ mainsimp.c:64: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{r4, fp}	@
	bx	lr	@
	.size	FIR, .-FIR
	.align	2
	.global	copy_to_buffer
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	copy_to_buffer, %function
copy_to_buffer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-8]	@ input, input
	str	r1, [fp, #-12]	@ length, length
@ mainsimp.c:69:  memcpy( &buffer[MAX_FILT_LENGTH - 1], input, length * sizeof(int16_t));
	ldr	r3, [fp, #-12]	@ length.1_1, length
	lsl	r3, r3, #1	@ _2, length.1_1,
	mov	r2, r3	@, _2
	ldr	r1, [fp, #-8]	@, input
	ldr	r0, .L10	@,
	bl	memcpy		@
@ mainsimp.c:71: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
.L11:
	.align	2
.L10:
	.word	buffer+998
	.size	copy_to_buffer, .-copy_to_buffer
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
@ mainsimp.c:75:     FIR_Init();
	bl	FIR_Init		@
@ mainsimp.c:83:     in_fid = fopen( "noisy.wav", "rb" );
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
	str	r0, [fp, #-8]	@, in_fid
@ mainsimp.c:84:     if ( in_fid == 0 ) {
	ldr	r3, [fp, #-8]	@ tmp115, in_fid
	cmp	r3, #0	@ tmp115,
	bne	.L13		@,
@ mainsimp.c:85:         printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ mainsimp.c:86:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L13:
@ mainsimp.c:90:     out_fid = fopen( "outputFIR.wav", "wb" );
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
	str	r0, [fp, #-12]	@, out_fid
@ mainsimp.c:91:     if ( out_fid == 0 ) {
	ldr	r3, [fp, #-12]	@ tmp116, out_fid
	cmp	r3, #0	@ tmp116,
	bne	.L14		@,
@ mainsimp.c:92:         printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ mainsimp.c:93:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L14:
@ mainsimp.c:103:         size = fread(input, sizeof(int16_t), SAMPLES, in_fid );
	sub	r0, fp, #1600	@ tmp117,,
	sub	r0, r0, #4	@ tmp117, tmp117,
	sub	r0, r0, #12	@ tmp117, tmp117,
	ldr	r3, [fp, #-8]	@, in_fid
	mov	r2, #800	@,
	mov	r1, #2	@,
	bl	fread		@
	mov	r3, r0	@ _1,
@ mainsimp.c:103:         size = fread(input, sizeof(int16_t), SAMPLES, in_fid );
	str	r3, [fp, #-16]	@ _1, size
@ mainsimp.c:104:         copy_to_buffer(input,size);
	sub	r3, fp, #1600	@ tmp118,,
	sub	r3, r3, #4	@ tmp118, tmp118,
	sub	r3, r3, #12	@ tmp118, tmp118,
	ldr	r1, [fp, #-16]	@, size
	mov	r0, r3	@, tmp118
	bl	copy_to_buffer		@
@ mainsimp.c:106:         FIR( output, size);
	sub	r3, fp, #3200	@ tmp119,,
	sub	r3, r3, #4	@ tmp119, tmp119,
	sub	r3, r3, #12	@ tmp119, tmp119,
	ldr	r1, [fp, #-16]	@, size
	mov	r0, r3	@, tmp119
	bl	FIR		@
@ mainsimp.c:108:         memmove(&buffer[0], &buffer[size], (MAX_FILT_LENGTH-1) * sizeof(int16_t) );
	ldr	r3, [fp, #-16]	@ tmp121, size
	lsl	r2, r3, #1	@ tmp120, tmp121,
	movw	r3, #:lower16:buffer	@ tmp122,
	movt	r3, #:upper16:buffer	@ tmp122,
	add	r3, r2, r3	@ _2, tmp120, tmp122
@ mainsimp.c:108:         memmove(&buffer[0], &buffer[size], (MAX_FILT_LENGTH-1) * sizeof(int16_t) );
	movw	r2, #998	@,
	mov	r1, r3	@, _2
	movw	r0, #:lower16:buffer	@,
	movt	r0, #:upper16:buffer	@,
	bl	memmove		@
@ mainsimp.c:110:         fwrite( output, sizeof(int16_t), size, out_fid );
	ldr	r2, [fp, #-16]	@ size.2_3, size
	sub	r0, fp, #3200	@ tmp123,,
	sub	r0, r0, #4	@ tmp123, tmp123,
	sub	r0, r0, #12	@ tmp123, tmp123,
	ldr	r3, [fp, #-12]	@, out_fid
	mov	r1, #2	@,
	bl	fwrite		@
@ mainsimp.c:114:     } while ( size != 0 );
	ldr	r3, [fp, #-16]	@ tmp124, size
	cmp	r3, #0	@ tmp124,
	bne	.L14		@,
@ mainsimp.c:116:     fclose( in_fid );
	ldr	r0, [fp, #-8]	@, in_fid
	bl	fclose		@
@ mainsimp.c:117:     fclose( out_fid );
	ldr	r0, [fp, #-12]	@, out_fid
	bl	fclose		@
@ mainsimp.c:119:     printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ mainsimp.c:120:     printf("%d \n",(int)sizeof(coeffs));
	mov	r1, #1000	@,
	movw	r0, #:lower16:.LC7	@,
	movt	r0, #:upper16:.LC7	@,
	bl	printf		@
@ mainsimp.c:123:     return 0;
	mov	r3, #0	@ _25,
@ mainsimp.c:124: }
	mov	r0, r3	@, <retval>
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  main.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -O2 -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -falign-jumps
@ -falign-labels -falign-loops -fauto-inc-dec -fbranch-count-reg
@ -fcaller-saves -fchkp-check-incomplete-type -fchkp-check-read
@ -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
@ -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
@ -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
@ -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
@ -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
@ -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
@ -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
@ -fif-conversion2 -findirect-inlining -finline -finline-atomics
@ -finline-functions-called-once -finline-small-functions -fipa-bit-cp
@ -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
@ -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fipa-vrp
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fsemantic-interposition
@ -fshow-column -fshrink-wrap -fshrink-wrap-separate -fsigned-zeros
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-backprop -fssa-phiopt
@ -fstdarg-opt -fstore-merging -fstrict-aliasing
@ -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
@ -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm
@ -mbe32 -mglibc -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

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
@ main.c:25:     memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
	movw	r0, #:lower16:insamp	@,
	movw	r2, #2598	@,
	movt	r0, #:upper16:insamp	@,
	mov	r1, #0	@,
	b	memset		@
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	movw	r6, #:lower16:insamp	@ tmp160,
@ main.c:31: {
	mov	r8, r3	@ length, length
	sub	sp, sp, #12	@,,
@ main.c:31: {
	ldr	r4, [sp, #48]	@ filt_length, filt_length
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	movt	r6, #:upper16:insamp	@ tmp160,
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	sub	r7, r4, #1	@ tmp141, filt_length,
	lsl	r7, r7, #1	@ _22, tmp141,
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	lsl	ip, r8, #1	@ _4, length,
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	add	r3, r6, r7	@ _2, tmp160, _22
@ main.c:31: {
	mov	r5, r0	@ filter_coeffs, filter_coeffs
	mov	r10, r2	@ output, output
@ main.c:40:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	mov	r0, r3	@, _2
	mov	r2, ip	@, _4
	str	ip, [sp, #4]	@ _4, %sfp
	bl	memcpy		@
@ main.c:43:     for (int n = 0; n<length; n++)
	cmp	r8, #0	@ length,
	ble	.L8		@,
@ main.c:52:             temp = temp + (1<<6); //rounding 
	mov	r9, #64	@ tmp162,
	ldr	r3, [sp, #4]	@ _4, %sfp
	sub	r10, r10, #2	@ ivtmp.21, output,
	add	r8, r7, #2	@ tmp151, _22,
	add	fp, r10, r3	@ _59, ivtmp.21, _4
	add	r8, r5, r8	@ _76, filter_coeffs, tmp151
.L7:
@ main.c:49:         for (int k = 0; k<filt_length; k++)
	cmp	r4, #0	@ filt_length,
@ main.c:46:     x=&insamp[filt_length - 1 + n]; //assign address of sample
	mov	ip, r0	@ x, ivtmp.23
@ main.c:49:         for (int k = 0; k<filt_length; k++)
	ble	.L9		@,
@ main.c:45:     h=filter_coeffs;
	mov	r2, r5	@ h, filter_coeffs
@ main.c:47:     acc = 1 << 14; //load rounding constant, what does this mean and how does it relate to input size? Perhaps it sets to 0 or half for a 32bit 
	mov	r1, #16384	@ acc,
.L6:
@ main.c:52:             temp = temp + (1<<6); //rounding 
	ldrh	r3, [r2], #2	@ MEM[base: h_32, offset: 4294967294B], MEM[base: h_32, offset: 4294967294B]
	ldrh	lr, [ip], #-2	@ MEM[base: x_33, offset: 2B], MEM[base: x_33, offset: 2B]
@ main.c:49:         for (int k = 0; k<filt_length; k++)
	cmp	r2, r8	@ h, _76
@ main.c:52:             temp = temp + (1<<6); //rounding 
	smlabb	r3, r3, lr, r9	@ temp, MEM[base: h_32, offset: 4294967294B], MEM[base: x_33, offset: 2B], tmp162
@ main.c:54:             acc = acc + temp;
	add	r1, r1, r3, asr #7	@ acc, acc, temp,
@ main.c:49:         for (int k = 0; k<filt_length; k++)
	bne	.L6		@,
	add	r1, r1, #16384	@ tmp158, acc,
	sbfx	r1, r1, #15, #16	@ _90, tmp158,,
.L5:
@ main.c:64:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	strh	r1, [r10, #2]!	@ movhi	@ _90, MEM[base: _64, offset: 0B]
@ main.c:43:     for (int n = 0; n<length; n++)
	cmp	fp, r10	@ _59, ivtmp.21
	add	r0, r0, #2	@ ivtmp.23, ivtmp.23,
	bne	.L7		@,
.L8:
@ main.c:68:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	movw	r0, #:lower16:insamp	@,
	mov	r2, r7	@, _22
	ldr	r3, [sp, #4]	@ _4, %sfp
	movt	r0, #:upper16:insamp	@,
	add	r1, r6, r3	@, tmp160, _4
@ main.c:69: }
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ main.c:68:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	b	memmove		@
.L9:
@ main.c:49:         for (int k = 0; k<filt_length; k++)
	mov	r1, #1	@ _90,
	b	.L5		@
	.size	FIR, .-FIR
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 3200
	@ frame_needed = 0, uses_anonymous_args = 0
@ main.c:80:     in_fid = fopen( "noisy.wav", "rb" );
	movw	r1, #:lower16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
@ main.c:72: {
	push	{r4, r5, r6, r7, lr}	@
	sub	sp, sp, #3200	@,,
	sub	sp, sp, #12	@,,
@ main.c:80:     in_fid = fopen( "noisy.wav", "rb" );
	movt	r1, #:upper16:.LC0	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
@ main.c:81:     if ( in_fid == 0 ) {
	subs	r7, r0, #0	@ in_fid,
	beq	.L19		@,
@ main.c:87:     out_fid = fopen( "outputFIR.wav", "wb" );
	movw	r1, #:lower16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r1, #:upper16:.LC3	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
@ main.c:88:     if ( out_fid == 0 ) {
	subs	r6, r0, #0	@ out_fid,
	beq	.L20		@,
@ main.c:25:     memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
	movw	r0, #:lower16:insamp	@,
	movw	r2, #2598	@,
	movt	r0, #:upper16:insamp	@,
	mov	r1, #0	@,
@ main.c:101:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	movw	r5, #:lower16:.LANCHOR0	@ tmp138,
@ main.c:25:     memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
	bl	memset		@
@ main.c:101:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	movt	r5, #:upper16:.LANCHOR0	@ tmp138,
.L16:
@ main.c:99:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r3, r7	@, in_fid
	mov	r2, #800	@,
	mov	r1, #2	@,
	add	r0, sp, #8	@ tmp139,,
	bl	fread		@
@ main.c:101:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	mov	r2, #500	@ tmp129,
@ main.c:99:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r4, r0	@ _1,
@ main.c:101:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	str	r2, [sp]	@ tmp129,
	add	r2, sp, #1600	@ tmp140,,
	mov	r3, r0	@, _1
	add	r2, r2, #8	@ tmp140, tmp140,
	add	r1, sp, #8	@ tmp141,,
	mov	r0, r5	@, tmp138
	bl	FIR		@
@ main.c:103:         fwrite( output, sizeof(int16_t), size, out_fid );
	add	r0, sp, #1600	@ tmp142,,
	mov	r3, r6	@, out_fid
	mov	r2, r4	@, _1
	mov	r1, #2	@,
	add	r0, r0, #8	@ tmp142, tmp142,
	bl	fwrite		@
@ main.c:104:     } while ( size != 0 );
	cmp	r4, #0	@ _1,
	bne	.L16		@,
@ main.c:106:     fclose( in_fid );
	mov	r0, r7	@, in_fid
	bl	fclose		@
@ main.c:107:     fclose( out_fid );
	mov	r0, r6	@, out_fid
	bl	fclose		@
@ main.c:109:     printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:110:     printf("%d \n",(int)sizeof(coeffs));
	movw	r0, #:lower16:.LC7	@,
	mov	r1, #1000	@,
	movt	r0, #:upper16:.LC7	@,
	bl	printf		@
@ main.c:114: }
	mov	r0, r4	@, _1
	add	sp, sp, #3200	@,,
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, pc}	@
.L19:
@ main.c:82:         printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:83:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L20:
@ main.c:89:         printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:90:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
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

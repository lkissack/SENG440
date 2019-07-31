	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 1	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  main.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -O1 -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fbranch-count-reg -fchkp-check-incomplete-type -fchkp-check-read
@ -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
@ -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers
@ -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
@ -fdefer-pop -fdelete-null-pointer-checks -fdwarf2-cfi-asm
@ -fearly-inlining -feliminate-unused-debug-types -fforward-propagate
@ -ffp-int-builtin-inexact -ffunction-cse -fgcse-lm -fgnu-runtime
@ -fgnu-unique -fguess-branch-probability -fident -fif-conversion
@ -fif-conversion2 -finline -finline-atomics -finline-functions-called-once
@ -fipa-profile -fipa-pure-const -fipa-reference -fira-hoist-pressure
@ -fira-share-save-slots -fira-share-spill-slots -fivopts
@ -fkeep-static-consts -fleading-underscore -flifetime-dse
@ -flto-odr-type-merging -fmath-errno -fmerge-constants
@ -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
@ -fpeephole -fplt -fprefetch-loop-arrays -freg-struct-return
@ -freorder-blocks -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
@ -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
@ -fsection-anchors -fsemantic-interposition -fshow-column -fshrink-wrap
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstdarg-opt
@ -fstrict-volatile-bitfields -fsync-libcalls -ftoplevel-reorder
@ -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp
@ -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pta
@ -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra
@ -ftree-ter -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm
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
	push	{r4, lr}	@
@ main.c:25:     memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
	movw	r2, #2598	@,
	mov	r1, #0	@,
	movw	r0, #:lower16:insamp	@,
	movt	r0, #:upper16:insamp	@,
	bl	memset		@
@ main.c:26: }
	pop	{r4, pc}	@
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	sub	sp, sp, #12	@,,
	mov	r5, r0	@ filter_coeffs, filter_coeffs
	mov	r10, r2	@ output, output
	mov	r4, r3	@ length, length
@ main.c:42:  memcpy( &insamp[FILT_LENGTH - 1], input, length * sizeof(int16_t));
	lsl	r6, r3, #1	@ _2, length,
	str	r6, [sp, #4]	@ _2, %sfp
	mov	r2, r6	@, _2
	ldr	r0, .L10	@,
	bl	memcpy		@
@ main.c:45:     for (n = 0; n<length; n++)
	cmp	r4, #0	@ length,
	ble	.L4		@,
	ldr	r2, .L10+4	@ ivtmp.43,
	sub	r10, r10, #2	@ ivtmp.45, output,
	add	fp, r10, r6	@ _143, ivtmp.45, _2
	add	r8, r5, #1012	@ _128, filter_coeffs,
.L6:
@ main.c:52: 	temp1 = (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r3, [r5]	@ *filter_coeffs_62(D), *filter_coeffs_62(D)
@ main.c:52: 	temp1 = (int32_t)(*h++)*(int32_t)(*x--);
	mov	ip, r2	@ ivtmp.43, ivtmp.43
	ldrsh	r1, [ip, #2]!	@ MEM[base: _145, offset: 2B], MEM[base: _145, offset: 2B]
@ main.c:52: 	temp1 = (int32_t)(*h++)*(int32_t)(*x--);
	mul	r1, r1, r3	@ temp1, MEM[base: _145, offset: 2B], *filter_coeffs_62(D)
@ main.c:53: 	temp2 = (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r3, [r5, #2]	@ MEM[(int16_t *)filter_coeffs_62(D) + 2B], MEM[(int16_t *)filter_coeffs_62(D) + 2B]
@ main.c:53: 	temp2 = (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r0, [r2], #-18	@ MEM[base: _145, offset: 0B], MEM[base: _145, offset: 0B]
@ main.c:53: 	temp2 = (int32_t)(*h++)*(int32_t)(*x--);
	mul	r0, r0, r3	@ temp2, MEM[base: _145, offset: 0B], MEM[(int16_t *)filter_coeffs_62(D) + 2B]
	add	r3, r5, #20	@ ivtmp.27, filter_coeffs,
@ main.c:50:     acc = (1 << 14);// preload rounding constant
	mov	lr, #16384	@ acc,
.L5:
@ main.c:60:             acc += temp1;
	add	r1, lr, r1	@ acc, acc, temp1
@ main.c:61:             acc += temp2;
	add	lr, r1, r0	@ acc, acc, temp2
@ main.c:63:             temp1 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r6, [r3, #-16]	@ MEM[base: _94, offset: 4294967280B], MEM[base: _94, offset: 4294967280B]
@ main.c:63:             temp1 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r4, [r2, #16]	@ MEM[base: _126, offset: 16B], MEM[base: _126, offset: 16B]
@ main.c:68:             temp2 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r9, [r3, #-14]	@ MEM[base: _94, offset: 4294967282B], MEM[base: _94, offset: 4294967282B]
@ main.c:68:             temp2 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r2, #14]	@ MEM[base: _126, offset: 14B], MEM[base: _126, offset: 14B]
@ main.c:74:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r0, [r3, #-12]	@ MEM[base: _94, offset: 4294967284B], MEM[base: _94, offset: 4294967284B]
@ main.c:74:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r7, [r2, #12]	@ MEM[base: _126, offset: 12B], MEM[base: _126, offset: 12B]
@ main.c:74:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mul	r7, r7, r0	@ tmp209, MEM[base: _126, offset: 12B], MEM[base: _94, offset: 4294967284B]
@ main.c:74:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r4, r4, r6, r7	@ temp1, MEM[base: _126, offset: 16B], MEM[base: _94, offset: 4294967280B], tmp209
@ main.c:79:            temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r6, [r3, #-10]	@ MEM[base: _94, offset: 4294967286B], MEM[base: _94, offset: 4294967286B]
@ main.c:79:            temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r0, [r2, #10]	@ MEM[base: _126, offset: 10B], MEM[base: _126, offset: 10B]
@ main.c:79:            temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mul	r0, r0, r6	@ tmp212, MEM[base: _126, offset: 10B], MEM[base: _94, offset: 4294967286B]
@ main.c:79:            temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mla	r0, r1, r9, r0	@ temp2, MEM[base: _126, offset: 14B], MEM[base: _94, offset: 4294967282B], tmp212
@ main.c:83:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r1, [r3, #-8]	@ MEM[base: _94, offset: 4294967288B], MEM[base: _94, offset: 4294967288B]
@ main.c:83:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r6, [r2, #8]	@ MEM[base: _126, offset: 8B], MEM[base: _126, offset: 8B]
@ main.c:83:            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r6, r6, r1, r4	@ temp1, MEM[base: _126, offset: 8B], MEM[base: _94, offset: 4294967288B], temp1
@ main.c:88:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r4, [r3, #-6]	@ MEM[base: _94, offset: 4294967290B], MEM[base: _94, offset: 4294967290B]
@ main.c:88:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r1, [r2, #6]	@ MEM[base: _126, offset: 6B], MEM[base: _126, offset: 6B]
@ main.c:88:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r4, r1, r4, r0	@ temp2, MEM[base: _126, offset: 6B], MEM[base: _94, offset: 4294967290B], temp2
@ main.c:89:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r1, [r3, #-4]	@ MEM[base: _94, offset: 4294967292B], MEM[base: _94, offset: 4294967292B]
@ main.c:89:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r0, [r2, #4]	@ MEM[base: _126, offset: 4B], MEM[base: _126, offset: 4B]
@ main.c:89:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r1, r0, r1, r6	@ temp1, MEM[base: _126, offset: 4B], MEM[base: _94, offset: 4294967292B], temp1
@ main.c:94:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r0, [r3, #-2]	@ MEM[base: _94, offset: 4294967294B], MEM[base: _94, offset: 4294967294B]
@ main.c:94:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r6, [r2, #2]	@ MEM[base: _126, offset: 2B], MEM[base: _126, offset: 2B]
@ main.c:94:            temp2 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r0, r6, r0, r4	@ temp2, MEM[base: _126, offset: 2B], MEM[base: _94, offset: 4294967294B], temp2
	add	r3, r3, #16	@ ivtmp.27, ivtmp.27,
	sub	r2, r2, #16	@ ivtmp.29, ivtmp.29,
@ main.c:58:         for (k = 0; k < ((FILT_LENGTH)>>3); k++)
	cmp	r3, r8	@ ivtmp.27, _128
	bne	.L5		@,
@ main.c:98:         acc += temp1;
	add	r3, lr, r1	@ acc, acc, temp1
@ main.c:99:         acc += temp2;
	add	r3, r0, r3	@ acc, temp2, acc
@ main.c:108:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	asr	r3, r3, #15	@ tmp226, acc,
@ main.c:108:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	strh	r3, [r10, #2]!	@ movhi	@ tmp226, MEM[base: _138, offset: 0B]
	mov	r2, ip	@ ivtmp.43, ivtmp.43
@ main.c:45:     for (n = 0; n<length; n++)
	cmp	r10, fp	@ ivtmp.45, _143
	bne	.L6		@,
.L4:
@ main.c:112:  memmove(&insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t) );
	movw	r0, #:lower16:insamp	@ tmp228,
	movt	r0, #:upper16:insamp	@ tmp228,
@ main.c:112:  memmove(&insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t) );
	movw	r2, #998	@,
	ldr	r3, [sp, #4]	@ _2, %sfp
	add	r1, r0, r3	@, tmp228, _2
	bl	memmove		@
@ main.c:113: }
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L11:
	.align	2
.L10:
	.word	insamp+998
	.word	insamp+996
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
	push	{r4, r5, r6, r7, r8, lr}	@
	sub	sp, sp, #3200	@,,
@ main.c:124:     in_fid = fopen( "noisy.wav", "rb" );
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
@ main.c:125:     if ( in_fid == 0 ) {
	subs	r8, r0, #0	@ in_fid,
	beq	.L18		@,
@ main.c:131:     out_fid = fopen( "outputFIR.wav", "wb" );
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
@ main.c:132:     if ( out_fid == 0 ) {
	subs	r7, r0, #0	@ out_fid,
	beq	.L19		@,
@ main.c:138:     FIR_Init();
	bl	FIR_Init		@
@ main.c:143:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r5, #2	@ tmp128,
@ main.c:145:         FIR( coeffs, input, output, size);
	movw	r6, #:lower16:.LANCHOR0	@ tmp124,
	movt	r6, #:upper16:.LANCHOR0	@ tmp124,
.L15:
@ main.c:143:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r3, r8	@, in_fid
	mov	r2, #800	@,
	mov	r1, r5	@, tmp128
	add	r0, sp, #1600	@ tmp129,,
	bl	fread		@
	mov	r4, r0	@ _1,
@ main.c:145:         FIR( coeffs, input, output, size);
	mov	r3, r0	@, _1
	mov	r2, sp	@,
	add	r1, sp, #1600	@ tmp130,,
	mov	r0, r6	@, tmp124
	bl	FIR		@
@ main.c:147:         fwrite( output, sizeof(int16_t), size, out_fid );
	mov	r3, r7	@, out_fid
	mov	r2, r4	@, _1
	mov	r1, r5	@, tmp128
	mov	r0, sp	@,
	bl	fwrite		@
@ main.c:148:     } while ( size != 0 );
	cmp	r4, #0	@ _1,
	bne	.L15		@,
@ main.c:150:     fclose( in_fid );
	mov	r0, r8	@, in_fid
	bl	fclose		@
@ main.c:151:     fclose( out_fid );
	mov	r0, r7	@, out_fid
	bl	fclose		@
@ main.c:153:     printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:158: }
	mov	r0, #0	@,
	add	sp, sp, #3200	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, pc}	@
.L18:
@ main.c:126:         printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:127:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L19:
@ main.c:133:         printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:134:         exit(EXIT_FAILURE);
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
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

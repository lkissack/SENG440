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
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	sub	sp, sp, #20	@,,
	mov	r7, r0	@ filter_coeffs, filter_coeffs
	str	r0, [sp, #4]	@ filter_coeffs, %sfp
	mov	r8, r2	@ output, output
	mov	r4, r3	@ length, length
	ldr	r10, [sp, #56]	@ filt_length, filt_length
@ main.c:43:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	sub	r3, r10, #1	@ tmp175, filt_length,
	lsl	r5, r3, #1	@ _40, tmp175,
	str	r5, [sp, #12]	@ _40, %sfp
@ main.c:43:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	lsl	r6, r4, #1	@ _4, length,
	str	r6, [sp, #8]	@ _4, %sfp
@ main.c:43:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	movw	r0, #:lower16:insamp	@ tmp177,
	movt	r0, #:upper16:insamp	@ tmp177,
@ main.c:43:  memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t));
	mov	r2, r6	@, _4
	add	r0, r0, r5	@, tmp177, _40
	bl	memcpy		@
@ main.c:46:     for (n = 0; n<length; n++)
	cmp	r4, #0	@ length,
	ble	.L4		@,
@ main.c:59:         for (k = 0; k < ((filt_length)>>2); k++)
	asr	r10, r10, #2	@ _81, filt_length,
	sub	r8, r8, #2	@ ivtmp.23, output,
	ldr	r9, .L12	@ tmp183,
	add	r9, r5, r9	@ ivtmp.25, _40, tmp183
	add	fp, r8, r6	@ _121, ivtmp.23, _4
	add	r7, r7, #8	@ tmp185, filter_coeffs,
	add	r7, r7, r10, lsl #3	@ _104, tmp185, _81,
@ main.c:39:     register int32_t temp2 = 0;
	mov	ip, #0	@ temp2,
@ main.c:38:     register int32_t temp1 = 0;
	mov	r4, ip	@ temp1, temp2
	b	.L7		@
.L8:
@ main.c:51:     acc = (1 << 14);// preload rounding constant
	mov	r0, #16384	@ acc,
.L5:
@ main.c:88:         acc=acc+temp1;
	add	r0, r0, r4	@ acc, acc, temp1
@ main.c:89:         temp2 += (1<<4); //rounding 
	add	ip, ip, #16	@ temp2, temp2,
@ main.c:90:         temp2 >>= 5;     //shift
	asr	ip, ip, #5	@ temp2, temp2,
@ main.c:91:         acc=acc+temp2;
	add	r0, r0, ip	@ acc, acc, temp2
@ main.c:100:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	asr	r0, r0, #15	@ tmp199, acc,
@ main.c:100:         output[n] = (int16_t)(acc>>15);//convert to 16 bit
	strh	r0, [r8, #2]!	@ movhi	@ tmp199, MEM[base: _116, offset: 0B]
	add	r9, r9, #2	@ ivtmp.25, ivtmp.25,
@ main.c:46:     for (n = 0; n<length; n++)
	cmp	r8, fp	@ ivtmp.23, _121
	beq	.L4		@,
.L7:
@ main.c:59:         for (k = 0; k < ((filt_length)>>2); k++)
	cmp	r10, #0	@ _81,
	ble	.L8		@,
	ldr	r3, [sp, #4]	@ filter_coeffs, %sfp
	add	r2, r3, #8	@ ivtmp.12, filter_coeffs,
	mov	r1, r9	@ ivtmp.14, ivtmp.25
@ main.c:51:     acc = (1 << 14);// preload rounding constant
	mov	r0, #16384	@ acc,
.L6:
@ main.c:61:             acc = acc + temp1;
	add	r0, r0, r4	@ acc, acc, temp1
@ main.c:63:             temp1 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r5, [r2, #-8]	@ MEM[base: _74, offset: 4294967288B], MEM[base: _74, offset: 4294967288B]
@ main.c:63:             temp1 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r6, [r1, #8]	@ MEM[base: _96, offset: 8B], MEM[base: _96, offset: 8B]
@ main.c:65:             temp2 += (1<<4); //rounding 
	add	ip, ip, #16	@ temp2, temp2,
@ main.c:68:             acc = acc + temp2;
	add	r0, r0, ip, asr #5	@ acc, acc, temp2,
@ main.c:70:             temp2 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r2, #-6]	@ MEM[base: _74, offset: 4294967290B], MEM[base: _74, offset: 4294967290B]
@ main.c:70:             temp2 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	lr, [r1, #6]	@ MEM[base: _96, offset: 6B], MEM[base: _96, offset: 6B]
@ main.c:76:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	ip, [r2, #-4]	@ MEM[base: _74, offset: 4294967292B], MEM[base: _74, offset: 4294967292B]
@ main.c:76:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	ldrsh	r4, [r1, #4]	@ MEM[base: _96, offset: 4B], MEM[base: _96, offset: 4B]
@ main.c:76:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mul	r4, r4, ip	@ tmp194, MEM[base: _96, offset: 4B], MEM[base: _74, offset: 4294967292B]
@ main.c:76:             temp1 += (int32_t)(*h++)*(int32_t)(*x--);
	mla	r4, r6, r5, r4	@ temp1, MEM[base: _96, offset: 8B], MEM[base: _74, offset: 4294967288B], tmp194
@ main.c:81:             temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	r5, [r2, #-2]	@ MEM[base: _74, offset: 4294967294B], MEM[base: _74, offset: 4294967294B]
@ main.c:81:             temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	ldrsh	ip, [r1, #2]	@ MEM[base: _96, offset: 2B], MEM[base: _96, offset: 2B]
@ main.c:81:             temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mul	ip, ip, r5	@ tmp197, MEM[base: _96, offset: 2B], MEM[base: _74, offset: 4294967294B]
@ main.c:81:             temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
	mla	ip, lr, r3, ip	@ temp2, MEM[base: _96, offset: 6B], MEM[base: _74, offset: 4294967290B], tmp197
@ main.c:83:             temp1 += (1<<4); //rounding 
	add	r4, r4, #16	@ temp1, temp1,
@ main.c:84:             temp1 >>= 5;     //shift
	asr	r4, r4, #5	@ temp1, temp1,
	add	r2, r2, #8	@ ivtmp.12, ivtmp.12,
	sub	r1, r1, #8	@ ivtmp.14, ivtmp.14,
@ main.c:59:         for (k = 0; k < ((filt_length)>>2); k++)
	cmp	r2, r7	@ ivtmp.12, _104
	bne	.L6		@,
	b	.L5		@
.L4:
@ main.c:104:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	movw	r0, #:lower16:insamp	@ tmp201,
	movt	r0, #:upper16:insamp	@ tmp201,
@ main.c:104:  memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
	ldr	r2, [sp, #12]	@, %sfp
	ldr	r3, [sp, #8]	@ _4, %sfp
	add	r1, r0, r3	@, tmp201, _4
	bl	memmove		@
@ main.c:105: }
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
.L13:
	.align	2
.L12:
	.word	insamp-8
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
	sub	sp, sp, #8	@,,
@ main.c:116:     in_fid = fopen( "noisy.wav", "rb" );
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
@ main.c:117:     if ( in_fid == 0 ) {
	subs	r8, r0, #0	@ in_fid,
	beq	.L20		@,
@ main.c:123:     out_fid = fopen( "outputFIR.wav", "wb" );
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
@ main.c:124:     if ( out_fid == 0 ) {
	subs	r7, r0, #0	@ out_fid,
	beq	.L21		@,
@ main.c:130:     FIR_Init();
	bl	FIR_Init		@
@ main.c:135:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r5, #2	@ tmp129,
@ main.c:137:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	movw	r6, #:lower16:.LANCHOR0	@ tmp124,
	movt	r6, #:upper16:.LANCHOR0	@ tmp124,
.L17:
@ main.c:135:         size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
	mov	r3, r8	@, in_fid
	mov	r2, #800	@,
	mov	r1, r5	@, tmp129
	add	r0, sp, #1600	@ tmp130,,
	add	r0, r0, #8	@ tmp130, tmp130,
	bl	fread		@
	mov	r4, r0	@ _1,
@ main.c:137:         FIR( coeffs, input, output, size, MAX_FILT_LENGTH );
	mov	r3, #500	@ tmp125,
	str	r3, [sp]	@ tmp125,
	mov	r3, r0	@, _1
	add	r2, sp, #8	@ tmp131,,
	add	r1, sp, #1600	@ tmp132,,
	add	r1, r1, #8	@ tmp132, tmp132,
	mov	r0, r6	@, tmp124
	bl	FIR		@
@ main.c:139:         fwrite( output, sizeof(int16_t), size, out_fid );
	mov	r3, r7	@, out_fid
	mov	r2, r4	@, _1
	mov	r1, r5	@, tmp129
	add	r0, sp, #8	@ tmp133,,
	bl	fwrite		@
@ main.c:140:     } while ( size != 0 );
	cmp	r4, #0	@ _1,
	bne	.L17		@,
@ main.c:142:     fclose( in_fid );
	mov	r0, r8	@, in_fid
	bl	fclose		@
@ main.c:143:     fclose( out_fid );
	mov	r0, r7	@, out_fid
	bl	fclose		@
@ main.c:145:     printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:150: }
	mov	r0, #0	@,
	add	sp, sp, #3200	@,,
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, pc}	@
.L20:
@ main.c:118:         printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:119:         exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L21:
@ main.c:125:         printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:126:         exit(EXIT_FAILURE);
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

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
@ -march=armv7-a+fp -auxbase-strip main-annotated.s -O1 -fverbose-asm
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
@ main.c:274:   memset(insamp, 0, sizeof(insamp)); //initiate space in memory
	movw	r2, #2598	@,
	mov	r1, #0	@,
	movw	r0, #:lower16:insamp	@,
	movt	r0, #:upper16:insamp	@,
	bl	memset		@
@ main.c:275: }
	pop	{r4, pc}	@
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	sub	sp, sp, #44	@,,
	mov	r4, r0	@ length, length
@ main.c:288:   memcpy( &insamp[FILT_LENGTH - 1], dat.input, length * sizeof(int16_t));
	lsl	r5, r0, #1	@ _2, length,
	str	r5, [sp, #36]	@ _2, %sfp
	mov	r2, r5	@, _2
	movw	r1, #:lower16:dat	@,
	movt	r1, #:upper16:dat	@,
	ldr	r0, .L10	@,
	bl	memcpy		@
@ main.c:290:   for (n = 0; n < length; n++) {
	cmp	r4, #0	@ length,
	ble	.L4		@,
@ main.c:296:     temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	movw	r3, #:lower16:.LANCHOR0	@ tmp232,
	movt	r3, #:upper16:.LANCHOR0	@ tmp232,
@ main.c:296:     temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	fp, [r3]	@ _5, MEM[(int16_t *)&coeffs]
@ main.c:297:     temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r2, [r3, #2]	@ _9, MEM[(int16_t *)&coeffs + 2B]
	str	r2, [sp, #4]	@ _9, %sfp
@ main.c:299:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r2, [r3, #4]	@ _13, MEM[(int16_t *)&coeffs + 4B]
	str	r2, [sp, #8]	@ _13, %sfp
@ main.c:300:     temp2 += (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r2, [r3, #6]	@ _17, MEM[(int16_t *)&coeffs + 6B]
	str	r2, [sp, #12]	@ _17, %sfp
@ main.c:302:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r2, [r3, #8]	@ _21, MEM[(int16_t *)&coeffs + 8B]
	str	r2, [sp, #16]	@ _21, %sfp
@ main.c:303:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r2, [r3, #10]	@ _25, MEM[(int16_t *)&coeffs + 10B]
	str	r2, [sp, #20]	@ _25, %sfp
@ main.c:305:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r2, [r3, #12]	@ _29, MEM[(int16_t *)&coeffs + 12B]
	str	r2, [sp, #24]	@ _29, %sfp
@ main.c:306:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r3, [r3, #14]	@ _33, MEM[(int16_t *)&coeffs + 14B]
	str	r3, [sp, #28]	@ _33, %sfp
	ldr	r2, .L10+4	@ ivtmp.53,
	movw	r9, #:lower16:dat	@ ivtmp.56,
	movt	r9, #:upper16:dat	@ ivtmp.56,
	add	r3, r5, r9	@ _181, _2, ivtmp.56
	str	r3, [sp, #32]	@ _181, %sfp
	movw	r10, #:lower16:.LANCHOR0	@ tmp254,
	movt	r10, #:upper16:.LANCHOR0	@ tmp254,
	add	r7, r10, #1008	@ _161, tmp254,
.L6:
@ main.c:296:     temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r2, #14]	@ MEM[base: _176, offset: 14B], MEM[base: _176, offset: 14B]
@ main.c:297:     temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	ip, [r2, #12]	@ MEM[base: _176, offset: 12B], MEM[base: _176, offset: 12B]
@ main.c:299:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r3, [r2, #10]	@ MEM[base: _176, offset: 10B], MEM[base: _176, offset: 10B]
@ main.c:299:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldr	r0, [sp, #8]	@ _13, %sfp
	mul	r3, r0, r3	@ tmp243, _13, MEM[base: _176, offset: 10B]
@ main.c:299:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mla	r1, fp, r1, r3	@ temp1, _5, MEM[base: _176, offset: 14B], tmp243
@ main.c:300:     temp2 += (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r2, #8]	@ MEM[base: _176, offset: 8B], MEM[base: _176, offset: 8B]
@ main.c:300:     temp2 += (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldr	r0, [sp, #12]	@ _17, %sfp
	mul	r3, r0, r3	@ tmp245, _17, MEM[base: _176, offset: 8B]
@ main.c:300:     temp2 += (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldr	r0, [sp, #4]	@ _9, %sfp
	mla	r3, r0, ip, r3	@ temp2, _9, MEM[base: _176, offset: 12B], tmp245
@ main.c:302:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r4, [r2, #6]	@ MEM[base: _176, offset: 6B], MEM[base: _176, offset: 6B]
@ main.c:302:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldr	r0, [sp, #16]	@ _21, %sfp
	mla	r1, r0, r4, r1	@ temp1, _21, MEM[base: _176, offset: 6B], temp1
@ main.c:303:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	ip, [r2, #4]	@ MEM[base: _176, offset: 4B], MEM[base: _176, offset: 4B]
@ main.c:303:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldr	r0, [sp, #20]	@ _25, %sfp
	mla	r3, r0, ip, r3	@ temp2, _25, MEM[base: _176, offset: 4B], temp2
@ main.c:305:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mov	r8, r2	@ ivtmp.53, ivtmp.53
	ldrsh	r4, [r8, #2]!	@ MEM[base: _176, offset: 2B], MEM[base: _176, offset: 2B]
@ main.c:305:     temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldr	r0, [sp, #24]	@ _29, %sfp
	mla	r4, r0, r4, r1	@ temp1, _29, MEM[base: _176, offset: 2B], temp1
@ main.c:306:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	ip, [r2], #-18	@ MEM[base: _176, offset: 0B], MEM[base: _176, offset: 0B]
@ main.c:306:     temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldr	r1, [sp, #28]	@ _33, %sfp
	mla	ip, r1, ip, r3	@ temp2, _33, MEM[base: _176, offset: 0B], temp2
	add	r3, r10, #32	@ ivtmp.38, tmp254,
@ main.c:294:     acc = (1 << 10); // preload rounding constant
	mov	r0, #1024	@ acc,
.L5:
@ main.c:312:       acc += temp1;
	add	r4, r0, r4	@ acc, acc, temp1
@ main.c:313:       acc += temp2;
	add	r0, r4, ip	@ acc, acc, temp2
@ main.c:315:       temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	lr, [r3, #-16]	@ MEM[base: _127, offset: 4294967280B], MEM[base: _127, offset: 4294967280B]
@ main.c:315:       temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r5, [r2, #16]	@ MEM[base: _159, offset: 16B], MEM[base: _159, offset: 16B]
@ main.c:316:       temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	ip, [r3, #-14]	@ MEM[base: _127, offset: 4294967282B], MEM[base: _127, offset: 4294967282B]
@ main.c:316:       temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
	ldrsh	r4, [r2, #14]	@ MEM[base: _159, offset: 14B], MEM[base: _159, offset: 14B]
@ main.c:318:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r1, [r3, #-12]	@ MEM[base: _127, offset: 4294967284B], MEM[base: _127, offset: 4294967284B]
@ main.c:318:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r6, [r2, #12]	@ MEM[base: _159, offset: 12B], MEM[base: _159, offset: 12B]
@ main.c:318:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mul	r6, r6, r1	@ tmp262, MEM[base: _159, offset: 12B], MEM[base: _127, offset: 4294967284B]
@ main.c:318:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mla	r5, r5, lr, r6	@ temp1, MEM[base: _159, offset: 16B], MEM[base: _127, offset: 4294967280B], tmp262
@ main.c:319:       temp2 += (int32_t)( *h++) * (int32_t)( *x--); 
	ldrsh	lr, [r3, #-10]	@ MEM[base: _127, offset: 4294967286B], MEM[base: _127, offset: 4294967286B]
@ main.c:319:       temp2 += (int32_t)( *h++) * (int32_t)( *x--); 
	ldrsh	r1, [r2, #10]	@ MEM[base: _159, offset: 10B], MEM[base: _159, offset: 10B]
@ main.c:319:       temp2 += (int32_t)( *h++) * (int32_t)( *x--); 
	mul	r1, r1, lr	@ tmp265, MEM[base: _159, offset: 10B], MEM[base: _127, offset: 4294967286B]
@ main.c:319:       temp2 += (int32_t)( *h++) * (int32_t)( *x--); 
	mla	r1, r4, ip, r1	@ temp2, MEM[base: _159, offset: 14B], MEM[base: _127, offset: 4294967282B], tmp265
@ main.c:321:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r4, [r3, #-8]	@ MEM[base: _127, offset: 4294967288B], MEM[base: _127, offset: 4294967288B]
@ main.c:321:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	lr, [r2, #8]	@ MEM[base: _159, offset: 8B], MEM[base: _159, offset: 8B]
@ main.c:321:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mla	lr, lr, r4, r5	@ temp1, MEM[base: _159, offset: 8B], MEM[base: _127, offset: 4294967288B], temp1
@ main.c:322:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);  
	ldrsh	ip, [r3, #-6]	@ MEM[base: _127, offset: 4294967290B], MEM[base: _127, offset: 4294967290B]
@ main.c:322:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);  
	ldrsh	r4, [r2, #6]	@ MEM[base: _159, offset: 6B], MEM[base: _159, offset: 6B]
@ main.c:322:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);  
	mla	r1, r4, ip, r1	@ temp2, MEM[base: _159, offset: 6B], MEM[base: _127, offset: 4294967290B], temp2
@ main.c:324:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	r4, [r3, #-4]	@ MEM[base: _127, offset: 4294967292B], MEM[base: _127, offset: 4294967292B]
@ main.c:324:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	ip, [r2, #4]	@ MEM[base: _159, offset: 4B], MEM[base: _159, offset: 4B]
@ main.c:324:       temp1 += (int32_t)( *h++) * (int32_t)( *x--);
	mla	r4, ip, r4, lr	@ temp1, MEM[base: _159, offset: 4B], MEM[base: _127, offset: 4294967292B], temp1
@ main.c:325:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	ip, [r3, #-2]	@ MEM[base: _127, offset: 4294967294B], MEM[base: _127, offset: 4294967294B]
@ main.c:325:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	ldrsh	lr, [r2, #2]	@ MEM[base: _159, offset: 2B], MEM[base: _159, offset: 2B]
@ main.c:325:       temp2 += (int32_t)( *h++) * (int32_t)( *x--);
	mla	ip, lr, ip, r1	@ temp2, MEM[base: _159, offset: 2B], MEM[base: _127, offset: 4294967294B], temp2
@ main.c:327:       temp1 += (1 << 7); //rounding 
	add	r4, r4, #128	@ temp1, temp1,
@ main.c:328:       temp1 >>= 6; //shift
	asr	r4, r4, #6	@ temp1, temp1,
@ main.c:329:       temp2 += (1 << 7); //rounding 
	add	ip, ip, #128	@ temp2, temp2,
@ main.c:330:       temp2 >>= 6; //shift
	asr	ip, ip, #6	@ temp2, temp2,
	add	r3, r3, #16	@ ivtmp.38, ivtmp.38,
	sub	r2, r2, #16	@ ivtmp.40, ivtmp.40,
@ main.c:310:     for (k = ((FILT_LENGTH >> 3) - 1); k > 0; k--) {
	cmp	r3, r7	@ ivtmp.38, _161
	bne	.L5		@,
@ main.c:334:     acc += temp1;
	add	r0, r0, r4	@ acc, acc, temp1
@ main.c:335:     acc += temp2;
	add	r0, ip, r0	@ acc, temp2, acc
@ main.c:337:     dat.output[n] = (int16_t)(acc >> 9); //convert to 16 bit
	asr	r0, r0, #9	@ tmp279, acc,
@ main.c:337:     dat.output[n] = (int16_t)(acc >> 9); //convert to 16 bit
	strh	r0, [r9], #2	@ movhi	@ tmp279, MEM[base: _177, offset: 0B]
	mov	r2, r8	@ ivtmp.53, ivtmp.53
@ main.c:290:   for (n = 0; n < length; n++) {
	ldr	r3, [sp, #32]	@ _181, %sfp
	cmp	r9, r3	@ ivtmp.56, _181
	bne	.L6		@,
.L4:
@ main.c:341:   memmove( &insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t));
	movw	r0, #:lower16:insamp	@ tmp281,
	movt	r0, #:upper16:insamp	@ tmp281,
@ main.c:341:   memmove( &insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t));
	movw	r2, #998	@,
	ldr	r3, [sp, #36]	@ _2, %sfp
	add	r1, r0, r3	@, tmp281, _2
	bl	memmove		@
@ main.c:342: }
	add	sp, sp, #44	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
@ main.c:352:   in_fid = fopen("noisy.wav", "rb");
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
@ main.c:353:   if (in_fid == 0) {
	subs	r8, r0, #0	@ in_fid,
	beq	.L18		@,
@ main.c:359:   out_fid = fopen("outputFIR.wav", "wb");
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
@ main.c:360:   if (out_fid == 0) {
	subs	r7, r0, #0	@ out_fid,
	beq	.L19		@,
@ main.c:366:   FIR_Init();
	bl	FIR_Init		@
@ main.c:371:     size = fread(dat.input, sizeof(int16_t), SAMPLES, in_fid);
	movw	r5, #:lower16:dat	@ tmp121,
	movt	r5, #:upper16:dat	@ tmp121,
	mov	r9, #800	@ tmp125,
	mov	r6, #2	@ tmp126,
.L15:
@ main.c:371:     size = fread(dat.input, sizeof(int16_t), SAMPLES, in_fid);
	mov	r3, r8	@, in_fid
	mov	r2, r9	@, tmp125
	mov	r1, r6	@, tmp126
	mov	r0, r5	@, tmp121
	bl	fread		@
	mov	r4, r0	@ _1,
@ main.c:373:     FIR(size);
	bl	FIR		@
@ main.c:375:     fwrite(dat.output, sizeof(int16_t), size, out_fid);
	mov	r3, r7	@, out_fid
	mov	r2, r4	@, _1
	mov	r1, r6	@, tmp126
	mov	r0, r5	@, tmp121
	bl	fwrite		@
@ main.c:376:   } while (size != 0);
	cmp	r4, #0	@ _1,
	bne	.L15		@,
@ main.c:378:   fclose(in_fid);
	mov	r0, r8	@, in_fid
	bl	fclose		@
@ main.c:379:   fclose(out_fid);
	mov	r0, r7	@, out_fid
	bl	fclose		@
@ main.c:381:   printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:385: }
	mov	r0, #0	@,
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}	@
.L18:
@ main.c:354:     printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:355:     exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L19:
@ main.c:361:     printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:362:     exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
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

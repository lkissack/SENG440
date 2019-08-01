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
@ main.c:273:   memset(insamp, 0, sizeof(insamp)); //initiate space in memory
	movw	r2, #2598	@,
	mov	r1, #0	@,
	movw	r0, #:lower16:insamp	@,
	movt	r0, #:upper16:insamp	@,
	bl	memset		@
@ main.c:274: }
	pop	{r4, pc}	@
	.size	FIR_Init, .-FIR_Init
	.align	2
	.global	FIR
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	FIR, %function
FIR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	mov	r4, r0	@ filter_coeffs, filter_coeffs
	mov	r7, r2	@ output, output
	mov	r6, r3	@ length, length
@ main.c:287:   memcpy( & insamp[FILT_LENGTH - 1], input, length * sizeof(int16_t));
	lsl	r5, r3, #1	@ _2, length,
	mov	r2, r5	@, _2
	ldr	r0, .L10	@,
	bl	memcpy		@
@ main.c:289:   for (n = 0; n < length; n++) {
	cmp	r6, #0	@ length,
	ble	.L4		@,
	ldr	r0, .L10+4	@ ivtmp.54,
	sub	r7, r7, #2	@ ivtmp.56, output,
	add	r9, r7, r5	@ _218, ivtmp.56, _2
	add	lr, r4, #1008	@ _196, filter_coeffs,
@ main.c:293:     acc = (1 << 10); // preload rounding constant
	mov	r8, #1024	@ acc,
.L6:
@ main.c:295:     temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r4]	@ *filter_coeffs_86(D), *filter_coeffs_86(D)
@ main.c:295:     temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r0, #14]	@ MEM[base: _212, offset: 14B], MEM[base: _212, offset: 14B]
@ main.c:295:     temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	r1, r1, r3	@ temp1, MEM[base: _212, offset: 14B], *filter_coeffs_86(D)
@ main.c:296:     temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	ip, [r4, #2]	@ MEM[(int16_t *)filter_coeffs_86(D) + 2B], MEM[(int16_t *)filter_coeffs_86(D) + 2B]
@ main.c:296:     temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r2, [r0, #12]	@ MEM[base: _212, offset: 12B], MEM[base: _212, offset: 12B]
@ main.c:296:     temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	r2, r2, ip	@ temp2, MEM[base: _212, offset: 12B], MEM[(int16_t *)filter_coeffs_86(D) + 2B]
@ main.c:298:     temp1 += (1 << 7); //rounding 
	add	r1, r1, #128	@ temp1, temp1,
@ main.c:300:     temp2 += (1 << 7); //rounding 
	add	ip, r2, #128	@ temp2, temp2,
@ main.c:304:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r2, [r4, #4]	@ MEM[(int16_t *)filter_coeffs_86(D) + 4B], MEM[(int16_t *)filter_coeffs_86(D) + 4B]
@ main.c:304:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r3, [r0, #10]	@ MEM[base: _212, offset: 10B], MEM[base: _212, offset: 10B]
@ main.c:304:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r3, r3, r2	@ tmp273, MEM[base: _212, offset: 10B], MEM[(int16_t *)filter_coeffs_86(D) + 4B]
@ main.c:304:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r3, r1, asr #6	@ temp1, tmp273, temp1,
@ main.c:305:     temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r4, #6]	@ MEM[(int16_t *)filter_coeffs_86(D) + 6B], MEM[(int16_t *)filter_coeffs_86(D) + 6B]
@ main.c:305:     temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r2, [r0, #8]	@ MEM[base: _212, offset: 8B], MEM[base: _212, offset: 8B]
@ main.c:305:     temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	r2, r2, r1	@ tmp276, MEM[base: _212, offset: 8B], MEM[(int16_t *)filter_coeffs_86(D) + 6B]
@ main.c:305:     temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	add	r2, r2, ip, asr #6	@ temp2, tmp276, temp2,
@ main.c:307:     temp1 += (1 << 7); //rounding 
	add	r1, r3, #128	@ temp1, temp1,
@ main.c:309:     temp2 += (1 << 7); //rounding 
	add	r2, r2, #128	@ temp2, temp2,
@ main.c:313:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	ip, [r4, #8]	@ MEM[(int16_t *)filter_coeffs_86(D) + 8B], MEM[(int16_t *)filter_coeffs_86(D) + 8B]
@ main.c:313:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r3, [r0, #6]	@ MEM[base: _212, offset: 6B], MEM[base: _212, offset: 6B]
@ main.c:313:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r3, r3, ip	@ tmp279, MEM[base: _212, offset: 6B], MEM[(int16_t *)filter_coeffs_86(D) + 8B]
@ main.c:313:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r3, r1, asr #6	@ temp1, tmp279, temp1,
@ main.c:314:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	ip, [r4, #10]	@ MEM[(int16_t *)filter_coeffs_86(D) + 10B], MEM[(int16_t *)filter_coeffs_86(D) + 10B]
@ main.c:314:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0, #4]	@ MEM[base: _212, offset: 4B], MEM[base: _212, offset: 4B]
@ main.c:314:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, ip	@ tmp282, MEM[base: _212, offset: 4B], MEM[(int16_t *)filter_coeffs_86(D) + 10B]
@ main.c:314:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r2, r1, r2, asr #6	@ temp2, tmp282, temp2,
@ main.c:316:     temp1 += (1 << 7); //rounding 
	add	r3, r3, #128	@ temp1, temp1,
@ main.c:318:     temp2 += (1 << 7); //rounding 
	add	r2, r2, #128	@ temp2, temp2,
@ main.c:321:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	ip, [r4, #12]	@ MEM[(int16_t *)filter_coeffs_86(D) + 12B], MEM[(int16_t *)filter_coeffs_86(D) + 12B]
@ main.c:321:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mov	r6, r0	@ ivtmp.54, ivtmp.54
	ldrsh	r1, [r6, #2]!	@ MEM[base: _212, offset: 2B], MEM[base: _212, offset: 2B]
@ main.c:321:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, ip	@ tmp285, MEM[base: _212, offset: 2B], MEM[(int16_t *)filter_coeffs_86(D) + 12B]
@ main.c:321:     temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r1, r3, asr #6	@ temp1, tmp285, temp1,
@ main.c:322:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	ip, [r4, #14]	@ MEM[(int16_t *)filter_coeffs_86(D) + 14B], MEM[(int16_t *)filter_coeffs_86(D) + 14B]
@ main.c:322:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0], #-18	@ MEM[base: _212, offset: 0B], MEM[base: _212, offset: 0B]
@ main.c:322:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, ip	@ tmp288, MEM[base: _212, offset: 0B], MEM[(int16_t *)filter_coeffs_86(D) + 14B]
@ main.c:322:     temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r1, r1, r2, asr #6	@ temp2, tmp288, temp2,
@ main.c:324:     temp1 += (1 << 7); //rounding 
	add	r3, r3, #128	@ temp1, temp1,
@ main.c:325:     temp1 >>= 6; //shift
	asr	r3, r3, #6	@ temp1, temp1,
@ main.c:326:     temp2 += (1 << 7); //rounding 
	add	r1, r1, #128	@ temp2, temp2,
@ main.c:327:     temp2 >>= 6; //shift
	asr	r1, r1, #6	@ temp2, temp2,
	add	r2, r4, #32	@ ivtmp.39, filter_coeffs,
@ main.c:293:     acc = (1 << 10); // preload rounding constant
	mov	ip, r8	@ acc, acc
.L5:
@ main.c:331:       acc += temp1;
	add	r3, ip, r3	@ acc, acc, temp1
@ main.c:332:       acc += temp2;
	add	ip, r3, r1	@ acc, acc, temp2
@ main.c:334:       temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r2, #-16]	@ MEM[base: _162, offset: 4294967280B], MEM[base: _162, offset: 4294967280B]
@ main.c:334:       temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r3, [r0, #16]	@ MEM[base: _194, offset: 16B], MEM[base: _194, offset: 16B]
@ main.c:334:       temp1 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	r3, r3, r1	@ temp1, MEM[base: _194, offset: 16B], MEM[base: _162, offset: 4294967280B]
@ main.c:335:       temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r10, [r2, #-14]	@ MEM[base: _162, offset: 4294967282B], MEM[base: _162, offset: 4294967282B]
@ main.c:335:       temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	fp, [r0, #14]	@ MEM[base: _194, offset: 14B], MEM[base: _194, offset: 14B]
@ main.c:335:       temp2 = (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	fp, fp, r10	@ temp2, MEM[base: _194, offset: 14B], MEM[base: _162, offset: 4294967282B]
@ main.c:337:       temp1 += (1 << 7); //rounding 
	add	r1, r3, #128	@ temp1, temp1,
@ main.c:339:       temp2 += (1 << 7); //rounding 
	add	r10, fp, #128	@ temp2, temp2,
@ main.c:343:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	fp, [r2, #-12]	@ MEM[base: _162, offset: 4294967284B], MEM[base: _162, offset: 4294967284B]
@ main.c:343:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r3, [r0, #12]	@ MEM[base: _194, offset: 12B], MEM[base: _194, offset: 12B]
@ main.c:343:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r3, r3, fp	@ tmp295, MEM[base: _194, offset: 12B], MEM[base: _162, offset: 4294967284B]
@ main.c:343:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r3, r1, asr #6	@ temp1, tmp295, temp1,
@ main.c:344:       temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	r1, [r2, #-10]	@ MEM[base: _162, offset: 4294967286B], MEM[base: _162, offset: 4294967286B]
@ main.c:344:       temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	ldrsh	fp, [r0, #10]	@ MEM[base: _194, offset: 10B], MEM[base: _194, offset: 10B]
@ main.c:344:       temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	mul	fp, fp, r1	@ tmp298, MEM[base: _194, offset: 10B], MEM[base: _162, offset: 4294967286B]
@ main.c:344:       temp2 += (int32_t)( * h++) * (int32_t)( * x--); //perform multiplication and add to accumulator
	add	fp, fp, r10, asr #6	@ temp2, tmp298, temp2,
@ main.c:346:       temp1 += (1 << 7); //rounding 
	add	r3, r3, #128	@ temp1, temp1,
@ main.c:348:       temp2 += (1 << 7); //rounding 
	add	fp, fp, #128	@ temp2, temp2,
@ main.c:351:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r10, [r2, #-8]	@ MEM[base: _162, offset: 4294967288B], MEM[base: _162, offset: 4294967288B]
@ main.c:351:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0, #8]	@ MEM[base: _194, offset: 8B], MEM[base: _194, offset: 8B]
@ main.c:351:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, r10	@ tmp301, MEM[base: _194, offset: 8B], MEM[base: _162, offset: 4294967288B]
@ main.c:351:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r1, r3, asr #6	@ temp1, tmp301, temp1,
@ main.c:352:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r10, [r2, #-6]	@ MEM[base: _162, offset: 4294967290B], MEM[base: _162, offset: 4294967290B]
@ main.c:352:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0, #6]	@ MEM[base: _194, offset: 6B], MEM[base: _194, offset: 6B]
@ main.c:352:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, r10	@ tmp304, MEM[base: _194, offset: 6B], MEM[base: _162, offset: 4294967290B]
@ main.c:352:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r1, r1, fp, asr #6	@ temp2, tmp304, temp2,
@ main.c:354:       temp1 += (1 << 7); //rounding 
	add	r3, r3, #128	@ temp1, temp1,
@ main.c:356:       temp2 += (1 << 7); //rounding 
	add	r10, r1, #128	@ temp2, temp2,
@ main.c:359:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	fp, [r2, #-4]	@ MEM[base: _162, offset: 4294967292B], MEM[base: _162, offset: 4294967292B]
@ main.c:359:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0, #4]	@ MEM[base: _194, offset: 4B], MEM[base: _194, offset: 4B]
@ main.c:359:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, fp	@ tmp307, MEM[base: _194, offset: 4B], MEM[base: _162, offset: 4294967292B]
@ main.c:359:       temp1 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r3, r1, r3, asr #6	@ temp1, tmp307, temp1,
@ main.c:360:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	fp, [r2, #-2]	@ MEM[base: _162, offset: 4294967294B], MEM[base: _162, offset: 4294967294B]
@ main.c:360:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	ldrsh	r1, [r0, #2]	@ MEM[base: _194, offset: 2B], MEM[base: _194, offset: 2B]
@ main.c:360:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	mul	r1, r1, fp	@ tmp310, MEM[base: _194, offset: 2B], MEM[base: _162, offset: 4294967294B]
@ main.c:360:       temp2 += (int32_t)( * h++) * (int32_t)( * x--);
	add	r1, r1, r10, asr #6	@ temp2, tmp310, temp2,
@ main.c:362:       temp1 += (1 << 7); //rounding 
	add	r3, r3, #128	@ temp1, temp1,
@ main.c:363:       temp1 >>= 6; //shift
	asr	r3, r3, #6	@ temp1, temp1,
@ main.c:364:       temp2 += (1 << 7); //rounding 
	add	r1, r1, #128	@ temp2, temp2,
@ main.c:365:       temp2 >>= 6; //shift
	asr	r1, r1, #6	@ temp2, temp2,
	add	r2, r2, #16	@ ivtmp.39, ivtmp.39,
	sub	r0, r0, #16	@ ivtmp.41, ivtmp.41,
@ main.c:329:     for (k = ((FILT_LENGTH) >> 3) - 1; k > 0; k--) {
	cmp	r2, lr	@ ivtmp.39, _196
	bne	.L5		@,
@ main.c:369:     acc += temp1;
	add	r3, ip, r3	@ acc, acc, temp1
@ main.c:370:     acc += temp2;
	add	r1, r1, r3	@ acc, temp2, acc
@ main.c:378:     output[n] = (int16_t)(acc >> 9); //convert to 16 bit
	asr	r1, r1, #9	@ tmp312, acc,
@ main.c:378:     output[n] = (int16_t)(acc >> 9); //convert to 16 bit
	strh	r1, [r7, #2]!	@ movhi	@ tmp312, MEM[base: _213, offset: 0B]
	mov	r0, r6	@ ivtmp.54, ivtmp.54
@ main.c:289:   for (n = 0; n < length; n++) {
	cmp	r7, r9	@ ivtmp.56, _218
	bne	.L6		@,
.L4:
@ main.c:382:   memmove( & insamp[0], & insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t));
	movw	r0, #:lower16:insamp	@ tmp314,
	movt	r0, #:upper16:insamp	@ tmp314,
@ main.c:382:   memmove( & insamp[0], & insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t));
	movw	r2, #998	@,
	add	r1, r0, r5	@, tmp314, _2
	bl	memmove		@
@ main.c:383: }
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
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
	@ args = 0, pretend = 0, frame = 3200
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}	@
	sub	sp, sp, #3200	@,,
@ main.c:393:   in_fid = fopen("noisy.wav", "rb");
	movw	r1, #:lower16:.LC0	@,
	movt	r1, #:upper16:.LC0	@,
	movw	r0, #:lower16:.LC1	@,
	movt	r0, #:upper16:.LC1	@,
	bl	fopen		@
@ main.c:394:   if (in_fid == 0) {
	subs	r8, r0, #0	@ in_fid,
	beq	.L18		@,
@ main.c:400:   out_fid = fopen("outputFIR.wav", "wb");
	movw	r1, #:lower16:.LC3	@,
	movt	r1, #:upper16:.LC3	@,
	movw	r0, #:lower16:.LC4	@,
	movt	r0, #:upper16:.LC4	@,
	bl	fopen		@
@ main.c:401:   if (out_fid == 0) {
	subs	r7, r0, #0	@ out_fid,
	beq	.L19		@,
@ main.c:407:   FIR_Init();
	bl	FIR_Init		@
@ main.c:412:     size = fread(input, sizeof(int16_t), SAMPLES, in_fid);
	mov	r5, #2	@ tmp128,
@ main.c:414:     FIR(coeffs, input, output, size);
	movw	r6, #:lower16:.LANCHOR0	@ tmp124,
	movt	r6, #:upper16:.LANCHOR0	@ tmp124,
.L15:
@ main.c:412:     size = fread(input, sizeof(int16_t), SAMPLES, in_fid);
	mov	r3, r8	@, in_fid
	mov	r2, #800	@,
	mov	r1, r5	@, tmp128
	add	r0, sp, #1600	@ tmp129,,
	bl	fread		@
	mov	r4, r0	@ _1,
@ main.c:414:     FIR(coeffs, input, output, size);
	mov	r3, r0	@, _1
	mov	r2, sp	@,
	add	r1, sp, #1600	@ tmp130,,
	mov	r0, r6	@, tmp124
	bl	FIR		@
@ main.c:416:     fwrite(output, sizeof(int16_t), size, out_fid);
	mov	r3, r7	@, out_fid
	mov	r2, r4	@, _1
	mov	r1, r5	@, tmp128
	mov	r0, sp	@,
	bl	fwrite		@
@ main.c:417:   } while (size != 0);
	cmp	r4, #0	@ _1,
	bne	.L15		@,
@ main.c:419:   fclose(in_fid);
	mov	r0, r8	@, in_fid
	bl	fclose		@
@ main.c:420:   fclose(out_fid);
	mov	r0, r7	@, out_fid
	bl	fclose		@
@ main.c:422:   printf("Filtering Complete \n");
	movw	r0, #:lower16:.LC6	@,
	movt	r0, #:upper16:.LC6	@,
	bl	puts		@
@ main.c:426: }
	mov	r0, #0	@,
	add	sp, sp, #3200	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, pc}	@
.L18:
@ main.c:395:     printf("couldn't open input file");
	movw	r0, #:lower16:.LC2	@,
	movt	r0, #:upper16:.LC2	@,
	bl	printf		@
@ main.c:396:     exit(EXIT_FAILURE);
	mov	r0, #1	@,
	bl	exit		@
.L19:
@ main.c:402:     printf("couldn't open output file");
	movw	r0, #:lower16:.LC5	@,
	movt	r0, #:upper16:.LC5	@,
	bl	printf		@
@ main.c:403:     exit(EXIT_FAILURE);
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

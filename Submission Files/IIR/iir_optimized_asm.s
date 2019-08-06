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
	.file	"iir_optimized.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  iir_optimized.c -mtune=generic-armv7-a -mfloat-abi=hard
@ -mfpu=vfpv3-d16 -mabi=aapcs-linux -mtls-dialect=gnu -marm
@ -march=armv7-a+fp -auxbase-strip iir_optimized_asm.s -fverbose-asm
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
	.comm	Y,256,4
	.comm	X,256,4
	.align	2
	.global	filter_init_better
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	filter_init_better, %function
filter_init_better:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-8]	@ X, X
	str	r1, [fp, #-12]	@ Y, Y
@ iir_optimized.c:17: 	X[0] = 0x80018001;
	ldr	r2, [fp, #-8]	@ tmp116, X
	movw	r3, #32769	@ tmp117,
	movt	r3, 32769	@ tmp117,
	str	r3, [r2]	@ tmp117, *X_9(D)
@ iir_optimized.c:20: 	for(i = 63; i; i--){
	mov	r4, #63	@ i,
@ iir_optimized.c:20: 	for(i = 63; i; i--){
	b	.L2		@
.L3:
@ iir_optimized.c:21: 		X[i] = 0x7FFF7FFF;
	mov	r3, r4	@ i.0_1, i
	lsl	r3, r3, #2	@ _2, i.0_1,
	ldr	r2, [fp, #-8]	@ tmp118, X
	add	r2, r2, r3	@ _3, tmp118, _2
@ iir_optimized.c:21: 		X[i] = 0x7FFF7FFF;
	movw	r3, #32767	@ tmp119,
	movt	r3, 32767	@ tmp119,
	str	r3, [r2]	@ tmp119, *_3
@ iir_optimized.c:20: 	for(i = 63; i; i--){
	sub	r4, r4, #1	@ i, i,
.L2:
@ iir_optimized.c:20: 	for(i = 63; i; i--){
	cmp	r4, #0	@ i,
	bne	.L3		@,
@ iir_optimized.c:24: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp120, Y
	add	r2, r3, #2	@ _4, tmp120,
@ iir_optimized.c:24: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp122,
	movt	r3, 65535	@ tmp122,
	strh	r3, [r2]	@ movhi	@ tmp121, *_4
@ iir_optimized.c:24: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _5, *_4
@ iir_optimized.c:24: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp123, Y
	strh	r2, [r3]	@ movhi	@ _5, *Y_14(D)
@ iir_optimized.c:25: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{r4, fp}	@
	bx	lr	@
	.size	filter_init_better, .-filter_init_better
	.align	2
	.global	short_int_clipping
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	short_int_clipping, %function
short_int_clipping:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #20	@,,
	str	r0, [fp, #-16]	@ a, a
@ iir_optimized.c:28: 	int tmp = a;
	ldr	r3, [fp, #-16]	@ tmp112, a
	str	r3, [fp, #-8]	@ tmp112, tmp
@ iir_optimized.c:29: 	if(tmp >= 32767)
	ldr	r3, [fp, #-8]	@ tmp113, tmp
	movw	r2, #32766	@ tmp114,
	cmp	r3, r2	@ tmp113, tmp114
	ble	.L5		@,
@ iir_optimized.c:30: 		tmp = 32767;
	movw	r3, #32767	@ tmp115,
	str	r3, [fp, #-8]	@ tmp115, tmp
.L5:
@ iir_optimized.c:31: 	if(tmp <= -32767)
	ldr	r2, [fp, #-8]	@ tmp116, tmp
	movw	r3, #32770	@ tmp117,
	movt	r3, 65535	@ tmp117,
	cmp	r2, r3	@ tmp116, tmp117
	bge	.L6		@,
@ iir_optimized.c:32: 		tmp = -32767;
	movw	r3, #32769	@ tmp118,
	movt	r3, 65535	@ tmp118,
	str	r3, [fp, #-8]	@ tmp118, tmp
.L6:
@ iir_optimized.c:34: 	return (short int) tmp;
	ldr	r3, [fp, #-8]	@ tmp119, tmp
	sxth	r3, r3	@ _7, tmp119
@ iir_optimized.c:35: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	short_int_clipping, .-short_int_clipping
	.align	2
	.global	round_shift
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	round_shift, %function
round_shift:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@,
	add	fp, sp, #0	@,,
	sub	sp, sp, #12	@,,
	str	r0, [fp, #-8]	@ a, a
@ iir_optimized.c:38: 	if(a&0xFFFF){
	ldr	r3, [fp, #-8]	@ tmp113, a
	uxth	r3, r3	@ _1, tmp113
@ iir_optimized.c:38: 	if(a&0xFFFF){
	cmp	r3, #0	@ _1,
	beq	.L9		@,
@ iir_optimized.c:39: 		a|=0x8000;
	ldr	r3, [fp, #-8]	@ tmp115, a
	orr	r3, r3, #32768	@ tmp114, tmp115,
	str	r3, [fp, #-8]	@ tmp114, a
.L9:
@ iir_optimized.c:41: 	return a>>15;
	ldr	r3, [fp, #-8]	@ tmp116, a
	asr	r3, r3, #15	@ _5, tmp116,
@ iir_optimized.c:42: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	round_shift, .-round_shift
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
	push	{fp, lr}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #24	@,,
	str	r0, [fp, #-8]	@ i, i
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp118,
	movt	r3, #:upper16:Y	@ tmp118,
	ldr	r2, [fp, #-8]	@ tmp119, i
	lsl	r2, r2, #1	@ tmp120, tmp119,
	add	r3, r3, r2	@ tmp121, tmp118, tmp120
	ldrsh	r3, [r3]	@ _1, Y
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r1, r3	@ _2, _1
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp122,
	movt	r3, #:upper16:Y	@ tmp122,
	ldr	r2, [fp, #-8]	@ tmp123, i
	lsl	r2, r2, #1	@ tmp124, tmp123,
	add	r3, r3, r2	@ tmp125, tmp122, tmp124
	ldrsh	r3, [r3]	@ _3, Y
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r0, r3	@ _4, _3
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp126,
	movt	r3, #:upper16:Y	@ tmp126,
	ldr	r2, [fp, #-8]	@ tmp127, i
	lsl	r2, r2, #1	@ tmp128, tmp127,
	add	r3, r3, r2	@ tmp129, tmp126, tmp128
	ldrsh	r3, [r3]	@ _5, Y
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f32.s32	s14, s15	@ _6, _5
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vldr.32	s13, .L12	@ tmp130,
	vdiv.f32	s15, s14, s13	@ _7, _6, tmp130
@ iir_optimized.c:45: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vcvt.f64.f32	d7, s15	@ _8, _7
	vstr.64	d7, [sp, #8]	@ _8,
	ldr	r3, [fp, #-8]	@ tmp131, i
	str	r3, [sp]	@ tmp131,
	mov	r3, r0	@, _4
	mov	r2, r1	@, _2
	ldr	r1, [fp, #-8]	@, i
	movw	r0, #:lower16:.LC0	@,
	movt	r0, #:upper16:.LC0	@,
	bl	printf		@
@ iir_optimized.c:46: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
.L13:
	.align	2
.L12:
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
	push	{r4, r5, r6, r7, r8, fp, lr}	@
	add	fp, sp, #24	@,,
	sub	sp, sp, #36	@,,
@ iir_optimized.c:50: 	const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp179,
	strh	r3, [fp, #-30]	@ movhi	@ tmp178, C0
@ iir_optimized.c:51: 	const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp181,
	strh	r3, [fp, #-32]	@ movhi	@ tmp180, C1
@ iir_optimized.c:52: 	const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp183,
	strh	r3, [fp, #-34]	@ movhi	@ tmp182, C2
@ iir_optimized.c:53: 	const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp185,
	strh	r3, [fp, #-36]	@ movhi	@ tmp184, C3
@ iir_optimized.c:54: 	const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp187,
	movt	r3, 65535	@ tmp187,
	strh	r3, [fp, #-38]	@ movhi	@ tmp186, C4
@ iir_optimized.c:60: 	filter_init_better(X.Init, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init_better		@
@ iir_optimized.c:62: 	for (i =2; !(i&0x80); i+=2){
	mov	r4, #2	@ i,
@ iir_optimized.c:62: 	for (i =2; !(i&0x80); i+=2){
	b	.L15		@
.L16:
@ iir_optimized.c:64: 		register int Xi = X.input[i];
	movw	r3, #:lower16:X	@ tmp188,
	movt	r3, #:upper16:X	@ tmp188,
	lsl	r2, r4, #1	@ tmp189, i,
	add	r3, r3, r2	@ tmp190, tmp188, tmp189
	ldrsh	r3, [r3]	@ _1, X.input
@ iir_optimized.c:64: 		register int Xi = X.input[i];
	mov	r8, r3	@ Xi, _1
@ iir_optimized.c:65: 		register int Xi_minus_1 = X.input[i-1];	
	sub	r2, r4, #1	@ _2, i,
@ iir_optimized.c:65: 		register int Xi_minus_1 = X.input[i-1];	
	movw	r3, #:lower16:X	@ tmp191,
	movt	r3, #:upper16:X	@ tmp191,
	lsl	r2, r2, #1	@ tmp192, _2,
	add	r3, r3, r2	@ tmp193, tmp191, tmp192
	ldrsh	r3, [r3]	@ _3, X.input
@ iir_optimized.c:65: 		register int Xi_minus_1 = X.input[i-1];	
	mov	r7, r3	@ Xi_minus_1, _3
@ iir_optimized.c:66: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	ldrsh	r2, [fp, #-34]	@ _4, C2
@ iir_optimized.c:66: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	sub	r1, r4, #2	@ _5, i,
@ iir_optimized.c:66: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	movw	r3, #:lower16:X	@ tmp194,
	movt	r3, #:upper16:X	@ tmp194,
	lsl	r1, r1, #1	@ tmp195, _5,
	add	r3, r3, r1	@ tmp196, tmp194, tmp195
	ldrsh	r3, [r3]	@ _6, X.input
@ iir_optimized.c:66: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	mul	r3, r3, r2	@ _8, _7, _4
@ iir_optimized.c:66: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	add	r5, r3, #16384	@ t2, _8,
@ iir_optimized.c:67: 		tmp_2 = round_shift(t2);
	mov	r0, r5	@, t2
	bl	round_shift		@
	str	r0, [fp, #-44]	@, tmp_2
@ iir_optimized.c:68: 		register int Yi_minus_1 = Y[i-1];
	sub	r2, r4, #1	@ _9, i,
@ iir_optimized.c:68: 		register int Yi_minus_1 = Y[i-1];
	movw	r3, #:lower16:Y	@ tmp197,
	movt	r3, #:upper16:Y	@ tmp197,
	lsl	r2, r2, #1	@ tmp198, _9,
	add	r3, r3, r2	@ tmp199, tmp197, tmp198
	ldrsh	r3, [r3]	@ _10, Y
@ iir_optimized.c:68: 		register int Yi_minus_1 = Y[i-1];
	mov	r6, r3	@ Yi_minus_1, _10
@ iir_optimized.c:69: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	ldrsh	r2, [fp, #-38]	@ _11, C4
@ iir_optimized.c:69: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	sub	r1, r4, #2	@ _12, i,
@ iir_optimized.c:69: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	movw	r3, #:lower16:Y	@ tmp200,
	movt	r3, #:upper16:Y	@ tmp200,
	lsl	r1, r1, #1	@ tmp201, _12,
	add	r3, r3, r1	@ tmp202, tmp200, tmp201
	ldrsh	r3, [r3]	@ _13, Y
@ iir_optimized.c:69: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	mul	r3, r3, r2	@ _15, _14, _11
@ iir_optimized.c:69: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	add	r5, r3, #16384	@ t4, _15,
@ iir_optimized.c:70: 		tmp_4 = round_shift(t4);
	mov	r0, r5	@, t4
	bl	round_shift		@
	str	r0, [fp, #-48]	@, tmp_4
@ iir_optimized.c:73: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	ldrsh	r3, [fp, #-30]	@ _16, C0
@ iir_optimized.c:73: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	mul	r3, r3, r8	@ _17, _16, Xi
@ iir_optimized.c:73: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	add	r5, r3, #16384	@ t0, _17,
@ iir_optimized.c:74: 		tmp_0 = round_shift(t0);
	mov	r0, r5	@, t0
	bl	round_shift		@
	str	r0, [fp, #-52]	@, tmp_0
@ iir_optimized.c:75: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-32]	@ _18, C1
@ iir_optimized.c:75: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	mul	r3, r3, r7	@ _19, _18, Xi_minus_1
@ iir_optimized.c:75: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t1, _19,
@ iir_optimized.c:76: 		tmp_1 = round_shift(t1);
	mov	r0, r5	@, t1
	bl	round_shift		@
	str	r0, [fp, #-56]	@, tmp_1
@ iir_optimized.c:77: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-36]	@ _20, C3
@ iir_optimized.c:77: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	mul	r3, r3, r6	@ _21, _20, Yi_minus_1
@ iir_optimized.c:77: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t3, _21,
@ iir_optimized.c:78: 		tmp_3 = round_shift(t3);
	mov	r0, r5	@, t3
	bl	round_shift		@
	str	r0, [fp, #-60]	@, tmp_3
@ iir_optimized.c:79: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-52]	@ tmp203, tmp_0
	ldr	r3, [fp, #-56]	@ tmp204, tmp_1
	add	r2, r2, r3	@ _22, tmp203, tmp204
	ldr	r3, [fp, #-44]	@ tmp205, tmp_2
	add	r2, r2, r3	@ _23, _22, tmp205
	ldr	r3, [fp, #-60]	@ tmp206, tmp_3
	add	r2, r2, r3	@ _24, _23, tmp206
	ldr	r3, [fp, #-48]	@ tmp207, tmp_4
	add	r3, r2, r3	@ _25, _24, tmp207
	movw	r2, #32767	@ tmp208,
	cmp	r3, r2	@ _25, tmp208
	movlt	r3, r3	@ _26, _25
	movge	r3, r2	@ _26, tmp208
@ iir_optimized.c:79: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _27, _26
	movw	r3, #:lower16:Y	@ tmp209,
	movt	r3, #:upper16:Y	@ tmp209,
	lsl	r1, r4, #1	@ tmp210, i,
	add	r3, r3, r1	@ tmp211, tmp209, tmp210
	strh	r2, [r3]	@ movhi	@ _27, Y
@ iir_optimized.c:81: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	ldrsh	r2, [fp, #-30]	@ _32, C0
@ iir_optimized.c:81: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	add	r1, r4, #1	@ _33, i,
@ iir_optimized.c:81: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	movw	r3, #:lower16:X	@ tmp217,
	movt	r3, #:upper16:X	@ tmp217,
	lsl	r1, r1, #1	@ tmp218, _33,
	add	r3, r3, r1	@ tmp219, tmp217, tmp218
	ldrsh	r3, [r3]	@ _34, X.input
@ iir_optimized.c:81: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	mul	r3, r3, r2	@ _36, _35, _32
@ iir_optimized.c:81: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	add	r5, r3, #16384	@ t0, _36,
@ iir_optimized.c:82: 		tmp_0 = round_shift(t0);
	mov	r0, r5	@, t0
	bl	round_shift		@
	str	r0, [fp, #-52]	@, tmp_0
@ iir_optimized.c:83: 		t1 = (int)C1 *(int)Xi + (1<<14);
	ldrsh	r3, [fp, #-32]	@ _37, C1
@ iir_optimized.c:83: 		t1 = (int)C1 *(int)Xi + (1<<14);
	mul	r3, r3, r8	@ _38, _37, Xi
@ iir_optimized.c:83: 		t1 = (int)C1 *(int)Xi + (1<<14);
	add	r5, r3, #16384	@ t1, _38,
@ iir_optimized.c:84: 		tmp_1 = round_shift(t1);
	mov	r0, r5	@, t1
	bl	round_shift		@
	str	r0, [fp, #-56]	@, tmp_1
@ iir_optimized.c:85: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-34]	@ _39, C2
@ iir_optimized.c:85: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	mul	r3, r3, r7	@ _40, _39, Xi_minus_1
@ iir_optimized.c:85: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t2, _40,
@ iir_optimized.c:86: 		tmp_2 = round_shift(t2);
	mov	r0, r5	@, t2
	bl	round_shift		@
	str	r0, [fp, #-44]	@, tmp_2
@ iir_optimized.c:87: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	ldrsh	r2, [fp, #-36]	@ _41, C3
@ iir_optimized.c:87: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	movw	r3, #:lower16:Y	@ tmp220,
	movt	r3, #:upper16:Y	@ tmp220,
	lsl	r1, r4, #1	@ tmp221, i,
	add	r3, r3, r1	@ tmp222, tmp220, tmp221
	ldrsh	r3, [r3]	@ _42, Y
@ iir_optimized.c:87: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	mul	r3, r3, r2	@ _44, _43, _41
@ iir_optimized.c:87: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	add	r5, r3, #16384	@ t3, _44,
@ iir_optimized.c:88: 		tmp_3 = round_shift(t3);
	mov	r0, r5	@, t3
	bl	round_shift		@
	str	r0, [fp, #-60]	@, tmp_3
@ iir_optimized.c:89: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-38]	@ _45, C4
@ iir_optimized.c:89: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	mul	r3, r3, r6	@ _46, _45, Yi_minus_1
@ iir_optimized.c:89: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t4, _46,
@ iir_optimized.c:90: 		tmp_4 = round_shift(t4);
	mov	r0, r5	@, t4
	bl	round_shift		@
	str	r0, [fp, #-48]	@, tmp_4
@ iir_optimized.c:92: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-52]	@ tmp223, tmp_0
	ldr	r3, [fp, #-56]	@ tmp224, tmp_1
	add	r2, r2, r3	@ _47, tmp223, tmp224
	ldr	r3, [fp, #-44]	@ tmp225, tmp_2
	add	r2, r2, r3	@ _48, _47, tmp225
	ldr	r3, [fp, #-60]	@ tmp226, tmp_3
	add	r2, r2, r3	@ _49, _48, tmp226
	ldr	r3, [fp, #-48]	@ tmp227, tmp_4
	add	r3, r2, r3	@ _50, _49, tmp227
	movw	r2, #32767	@ tmp228,
	cmp	r3, r2	@ _50, tmp228
	movlt	r3, r3	@ _51, _50
	movge	r3, r2	@ _51, tmp228
@ iir_optimized.c:92: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	add	r1, r4, #1	@ _52, i,
@ iir_optimized.c:92: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _53, _51
	movw	r3, #:lower16:Y	@ tmp229,
	movt	r3, #:upper16:Y	@ tmp229,
	lsl	r1, r1, #1	@ tmp230, _52,
	add	r3, r3, r1	@ tmp231, tmp229, tmp230
	strh	r2, [r3]	@ movhi	@ _53, Y
@ iir_optimized.c:94: 		print(i);
	mov	r0, r4	@, i
	bl	print		@
@ iir_optimized.c:95: 		print(i+1);
	add	r3, r4, #1	@ _58, i,
	mov	r0, r3	@, _58
	bl	print		@
@ iir_optimized.c:62: 	for (i =2; !(i&0x80); i+=2){
	add	r4, r4, #2	@ i, i,
.L15:
@ iir_optimized.c:62: 	for (i =2; !(i&0x80); i+=2){
	and	r3, r4, #128	@ _59, i,
@ iir_optimized.c:62: 	for (i =2; !(i&0x80); i+=2){
	cmp	r3, #0	@ _59,
	beq	.L16		@,
@ iir_optimized.c:98: }
	nop	
	sub	sp, fp, #24	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

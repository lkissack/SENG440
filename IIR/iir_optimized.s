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
@ iir_optimized.c:16: 	X[0] = 0x80018001;
	ldr	r2, [fp, #-8]	@ tmp116, X
	movw	r3, #32769	@ tmp117,
	movt	r3, 32769	@ tmp117,
	str	r3, [r2]	@ tmp117, *X_9(D)
@ iir_optimized.c:19: 	for(i = 63; i; i--){
	mov	r4, #63	@ i,
@ iir_optimized.c:19: 	for(i = 63; i; i--){
	b	.L2		@
.L3:
@ iir_optimized.c:20: 		X[i] = 0x7FFF7FFF;
	mov	r3, r4	@ i.0_1, i
	lsl	r3, r3, #2	@ _2, i.0_1,
	ldr	r2, [fp, #-8]	@ tmp118, X
	add	r2, r2, r3	@ _3, tmp118, _2
@ iir_optimized.c:20: 		X[i] = 0x7FFF7FFF;
	movw	r3, #32767	@ tmp119,
	movt	r3, 32767	@ tmp119,
	str	r3, [r2]	@ tmp119, *_3
@ iir_optimized.c:19: 	for(i = 63; i; i--){
	subs	r4, r4, #1	@ i, i,
.L2:
@ iir_optimized.c:19: 	for(i = 63; i; i--){
@	cmp	r4, #0	@ i,
	bne	.L3		@,
@ iir_optimized.c:23: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp120, Y
	add	r2, r3, #2	@ _4, tmp120,
@ iir_optimized.c:23: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp122,
	movt	r3, 65535	@ tmp122,
	strh	r3, [r2]	@ movhi	@ tmp121, *_4
@ iir_optimized.c:23: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _5, *_4
@ iir_optimized.c:23: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp123, Y
	strh	r2, [r3]	@ movhi	@ _5, *Y_14(D)
@ iir_optimized.c:24: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{r4, fp}	@
	bx	lr	@
	.size	filter_init_better, .-filter_init_better
	.align	2
	.global	filter_init
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	filter_init, %function
filter_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}	@
	add	fp, sp, #4	@,,
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-8]	@ X, X
	str	r1, [fp, #-12]	@ Y, Y
@ iir_optimized.c:30: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp118, X
	add	r2, r3, #2	@ _1, tmp118,
@ iir_optimized.c:30: 	X[0] = X[1] = (short int) 0x8001;
	movw	r3, #32769	@ tmp120,
	movt	r3, 65535	@ tmp120,
	strh	r3, [r2]	@ movhi	@ tmp119, *_1
@ iir_optimized.c:30: 	X[0] = X[1] = (short int) 0x8001;
	ldrsh	r2, [r2]	@ _2, *_1
@ iir_optimized.c:30: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp121, X
	strh	r2, [r3]	@ movhi	@ _2, *X_10(D)
@ iir_optimized.c:32: 	for(i =2; i<128; i++){
	mov	r4, #2	@ i,
@ iir_optimized.c:32: 	for(i =2; i<128; i++){
	b	.L5		@
.L6:
@ iir_optimized.c:34: 		X[i] = (short int)0x7FFF;
	mov	r3, r4	@ i.1_3, i
	lsl	r3, r3, #1	@ _4, i.1_3,
	ldr	r2, [fp, #-8]	@ tmp122, X
	add	r3, r2, r3	@ _5, tmp122, _4
@ iir_optimized.c:34: 		X[i] = (short int)0x7FFF;
	mvn	r2, #32768	@ tmp124,
	strh	r2, [r3]	@ movhi	@ tmp123, *_5
@ iir_optimized.c:32: 	for(i =2; i<128; i++){
	add	r4, r4, #1	@ i, i,
.L5:
@ iir_optimized.c:32: 	for(i =2; i<128; i++){
	cmp	r4, #127	@ i,
	ble	.L6		@,
@ iir_optimized.c:36: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp125, Y
	add	r2, r3, #2	@ _6, tmp125,
@ iir_optimized.c:36: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp127,
	movt	r3, 65535	@ tmp127,
	strh	r3, [r2]	@ movhi	@ tmp126, *_6
@ iir_optimized.c:36: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _7, *_6
@ iir_optimized.c:36: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp128, Y
	strh	r2, [r3]	@ movhi	@ _7, *Y_17(D)
@ iir_optimized.c:38: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{r4, fp}	@
	bx	lr	@
	.size	filter_init, .-filter_init
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
@ iir_optimized.c:41: 	int tmp = a;
	ldr	r3, [fp, #-16]	@ tmp112, a
	str	r3, [fp, #-8]	@ tmp112, tmp
@ iir_optimized.c:42: 	if(tmp >= 32767)
	ldr	r3, [fp, #-8]	@ tmp113, tmp
	movw	r2, #32766	@ tmp114,
	cmp	r3, r2	@ tmp113, tmp114
	ble	.L8		@,
@ iir_optimized.c:43: 		tmp = 32767;
	movw	r3, #32767	@ tmp115,
	str	r3, [fp, #-8]	@ tmp115, tmp
.L8:
@ iir_optimized.c:44: 	if(tmp <= -32767)
	ldr	r2, [fp, #-8]	@ tmp116, tmp
	movw	r3, #32770	@ tmp117,
	movt	r3, 65535	@ tmp117,
	cmp	r2, r3	@ tmp116, tmp117
	bge	.L9		@,
@ iir_optimized.c:45: 		tmp = -32767;
	movw	r3, #32769	@ tmp118,
	movt	r3, 65535	@ tmp118,
	str	r3, [fp, #-8]	@ tmp118, tmp
.L9:
@ iir_optimized.c:47: 	return (short int) tmp;
	ldr	r3, [fp, #-8]	@ tmp119, tmp
	sxth	r3, r3	@ _7, tmp119
@ iir_optimized.c:48: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	short_int_clipping, .-short_int_clipping
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
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp118,
	movt	r3, #:upper16:Y	@ tmp118,
	ldr	r2, [fp, #-8]	@ tmp119, i
	lsl	r2, r2, #1	@ tmp120, tmp119,
	add	r3, r3, r2	@ tmp121, tmp118, tmp120
	ldrsh	r3, [r3]	@ _1, Y
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r1, r3	@ _2, _1
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp122,
	movt	r3, #:upper16:Y	@ tmp122,
	ldr	r2, [fp, #-8]	@ tmp123, i
	lsl	r2, r2, #1	@ tmp124, tmp123,
	add	r3, r3, r2	@ tmp125, tmp122, tmp124
	ldrsh	r3, [r3]	@ _3, Y
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r0, r3	@ _4, _3
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp126,
	movt	r3, #:upper16:Y	@ tmp126,
	ldr	r2, [fp, #-8]	@ tmp127, i
	lsl	r2, r2, #1	@ tmp128, tmp127,
	add	r3, r3, r2	@ tmp129, tmp126, tmp128
	ldrsh	r3, [r3]	@ _5, Y
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f32.s32	s14, s15	@ _6, _5
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vldr.32	s13, .L12	@ tmp130,
	vdiv.f32	s15, s14, s13	@ _7, _6, tmp130
@ iir_optimized.c:51: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
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
@ iir_optimized.c:52: }
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
@ iir_optimized.c:59: 	const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp209,
	strh	r3, [fp, #-30]	@ movhi	@ tmp208, C0
@ iir_optimized.c:60: 	const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp211,
	strh	r3, [fp, #-32]	@ movhi	@ tmp210, C1
@ iir_optimized.c:61: 	const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp213,
	strh	r3, [fp, #-34]	@ movhi	@ tmp212, C2
@ iir_optimized.c:62: 	const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp215,
	strh	r3, [fp, #-36]	@ movhi	@ tmp214, C3
@ iir_optimized.c:63: 	const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp217,
	movt	r3, 65535	@ tmp217,
	strh	r3, [fp, #-38]	@ movhi	@ tmp216, C4
@ iir_optimized.c:69: 	filter_init_better(X.Init, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init_better		@
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	mov	r4, #2	@ i,
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	b	.L15		@
.L36:
@ iir_optimized.c:74: 		register int Xi = X.input[i];
	movw	r3, #:lower16:X	@ tmp218,
	movt	r3, #:upper16:X	@ tmp218,
	lsl	r2, r4, #1	@ tmp219, i,
	add	r3, r3, r2	@ tmp220, tmp218, tmp219
	ldrsh	r3, [r3]	@ _1, X.input
@ iir_optimized.c:74: 		register int Xi = X.input[i];
	mov	r8, r3	@ Xi, _1
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	sub	r2, r4, #1	@ _2, i,
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	movw	r3, #:lower16:X	@ tmp221,
	movt	r3, #:upper16:X	@ tmp221,
	lsl	r2, r2, #1	@ tmp222, _2,
	add	r3, r3, r2	@ tmp223, tmp221, tmp222
	ldrsh	r3, [r3]	@ _3, X.input
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	mov	r7, r3	@ Xi_minus_1, _3
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	ldrsh	r2, [fp, #-34]	@ _4, C2
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	sub	r1, r4, #2	@ _5, i,
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	movw	r3, #:lower16:X	@ tmp224,
	movt	r3, #:upper16:X	@ tmp224,
	lsl	r1, r1, #1	@ tmp225, _5,
	add	r3, r3, r1	@ tmp226, tmp224, tmp225
	ldrsh	r3, [r3]	@ _6, X.input
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	mul	r3, r3, r2	@ _8, _7, _4
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	add	r5, r3, #16384	@ t2, _8,
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	uxth	r3, r5	@ _9, t2
	cmp	r3, #0	@ _9,
	beq	.L16		@,
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ _10, t2,
	orr	r3, r3, #1	@ iftmp.2_81, _10,
	b	.L17		@
.L16:
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ iftmp.2_81, t2,
.L17:
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	str	r3, [fp, #-44]	@ iftmp.2_81, tmp_2
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	sub	r2, r4, #1	@ _11, i,
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	movw	r3, #:lower16:Y	@ tmp227,
	movt	r3, #:upper16:Y	@ tmp227,
	lsl	r2, r2, #1	@ tmp228, _11,
	add	r3, r3, r2	@ tmp229, tmp227, tmp228
	ldrsh	r3, [r3]	@ _12, Y
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	mov	r6, r3	@ Yi_minus_1, _12
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	ldrsh	r2, [fp, #-38]	@ _13, C4
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	sub	r1, r4, #2	@ _14, i,
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	movw	r3, #:lower16:Y	@ tmp230,
	movt	r3, #:upper16:Y	@ tmp230,
	lsl	r1, r1, #1	@ tmp231, _14,
	add	r3, r3, r1	@ tmp232, tmp230, tmp231
	ldrsh	r3, [r3]	@ _15, Y
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	mul	r3, r3, r2	@ _17, _16, _13
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	add	r5, r3, #16384	@ t4, _17,
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	uxth	r3, r5	@ _18, t4
	cmp	r3, #0	@ _18,
	beq	.L18		@,
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r5, #15	@ _19, t4,
	orr	r3, r3, #1	@ iftmp.3_82, _19,
	b	.L19		@
.L18:
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r5, #15	@ iftmp.3_82, t4,
.L19:
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	str	r3, [fp, #-48]	@ iftmp.3_82, tmp_4
@ iir_optimized.c:85: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	ldrsh	r3, [fp, #-30]	@ _20, C0
@ iir_optimized.c:85: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	mul	r3, r3, r8	@ _21, _20, Xi
@ iir_optimized.c:85: 		register int t0 = (int)C0 *(int)Xi + (1<<14);
	add	r5, r3, #16384	@ t0, _21,
@ iir_optimized.c:86: 		tmp_0 = ROUND_SHIFT(t0);
	uxth	r3, r5	@ _22, t0
	cmp	r3, #0	@ _22,
	beq	.L20		@,
@ iir_optimized.c:86: 		tmp_0 = ROUND_SHIFT(t0);
	asr	r3, r5, #15	@ _23, t0,
	orr	r3, r3, #1	@ iftmp.4_83, _23,
	b	.L21		@
.L20:
@ iir_optimized.c:86: 		tmp_0 = ROUND_SHIFT(t0);
	asr	r3, r5, #15	@ iftmp.4_83, t0,
.L21:
@ iir_optimized.c:86: 		tmp_0 = ROUND_SHIFT(t0);
	str	r3, [fp, #-52]	@ iftmp.4_83, tmp_0
@ iir_optimized.c:87: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-32]	@ _24, C1
@ iir_optimized.c:87: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	mul	r3, r3, r7	@ _25, _24, Xi_minus_1
@ iir_optimized.c:87: 		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t1, _25,
@ iir_optimized.c:88: 		tmp_1 = ROUND_SHIFT(t1);
	uxth	r3, r5	@ _26, t1
	cmp	r3, #0	@ _26,
	beq	.L22		@,
@ iir_optimized.c:88: 		tmp_1 = ROUND_SHIFT(t1);
	asr	r3, r5, #15	@ _27, t1,
	orr	r3, r3, #1	@ iftmp.5_84, _27,
	b	.L23		@
.L22:
@ iir_optimized.c:88: 		tmp_1 = ROUND_SHIFT(t1);
	asr	r3, r5, #15	@ iftmp.5_84, t1,
.L23:
@ iir_optimized.c:88: 		tmp_1 = ROUND_SHIFT(t1);
	str	r3, [fp, #-56]	@ iftmp.5_84, tmp_1
@ iir_optimized.c:89: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-36]	@ _28, C3
@ iir_optimized.c:89: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	mul	r3, r3, r6	@ _29, _28, Yi_minus_1
@ iir_optimized.c:89: 		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t3, _29,
@ iir_optimized.c:90: 		tmp_3 = ROUND_SHIFT(t3);
	uxth	r3, r5	@ _30, t3
	cmp	r3, #0	@ _30,
	beq	.L24		@,
@ iir_optimized.c:90: 		tmp_3 = ROUND_SHIFT(t3);
	asr	r3, r5, #15	@ _31, t3,
	orr	r3, r3, #1	@ iftmp.6_85, _31,
	b	.L25		@
.L24:
@ iir_optimized.c:90: 		tmp_3 = ROUND_SHIFT(t3);
	asr	r3, r5, #15	@ iftmp.6_85, t3,
.L25:
@ iir_optimized.c:90: 		tmp_3 = ROUND_SHIFT(t3);
	str	r3, [fp, #-60]	@ iftmp.6_85, tmp_3
@ iir_optimized.c:93: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-52]	@ tmp233, tmp_0
	ldr	r3, [fp, #-56]	@ tmp234, tmp_1
	add	r2, r2, r3	@ _32, tmp233, tmp234
	ldr	r3, [fp, #-44]	@ tmp235, tmp_2
	add	r2, r2, r3	@ _33, _32, tmp235
	ldr	r3, [fp, #-60]	@ tmp236, tmp_3
	add	r2, r2, r3	@ _34, _33, tmp236
	ldr	r3, [fp, #-48]	@ tmp237, tmp_4
	add	r3, r2, r3	@ _35, _34, tmp237
	movw	r2, #32767	@ tmp238,
	cmp	r3, r2	@ _35, tmp238
	movlt	r3, r3	@ _36, _35
	movge	r3, r2	@ _36, tmp238
@ iir_optimized.c:93: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _37, _36
	movw	r3, #:lower16:Y	@ tmp239,
	movt	r3, #:upper16:Y	@ tmp239,
	lsl	r1, r4, #1	@ tmp240, i,
	add	r3, r3, r1	@ tmp241, tmp239, tmp240
	strh	r2, [r3]	@ movhi	@ _37, Y
@ iir_optimized.c:95: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	ldrsh	r2, [fp, #-30]	@ _42, C0
@ iir_optimized.c:95: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	add	r1, r4, #1	@ _43, i,
@ iir_optimized.c:95: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	movw	r3, #:lower16:X	@ tmp247,
	movt	r3, #:upper16:X	@ tmp247,
	lsl	r1, r1, #1	@ tmp248, _43,
	add	r3, r3, r1	@ tmp249, tmp247, tmp248
	ldrsh	r3, [r3]	@ _44, X.input
@ iir_optimized.c:95: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	mul	r3, r3, r2	@ _46, _45, _42
@ iir_optimized.c:95: 		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
	add	r5, r3, #16384	@ t0, _46,
@ iir_optimized.c:96: 		tmp_0 = ROUND_SHIFT(t0);
	uxth	r3, r5	@ _47, t0
	cmp	r3, #0	@ _47,
	beq	.L26		@,
@ iir_optimized.c:96: 		tmp_0 = ROUND_SHIFT(t0);
	asr	r3, r5, #15	@ _48, t0,
	orr	r3, r3, #1	@ iftmp.7_86, _48,
	b	.L27		@
.L26:
@ iir_optimized.c:96: 		tmp_0 = ROUND_SHIFT(t0);
	asr	r3, r5, #15	@ iftmp.7_86, t0,
.L27:
@ iir_optimized.c:96: 		tmp_0 = ROUND_SHIFT(t0);
	str	r3, [fp, #-52]	@ iftmp.7_86, tmp_0
@ iir_optimized.c:97: 		t1 = (int)C1 *(int)Xi + (1<<14);
	ldrsh	r3, [fp, #-32]	@ _49, C1
@ iir_optimized.c:97: 		t1 = (int)C1 *(int)Xi + (1<<14);
	mul	r3, r3, r8	@ _50, _49, Xi
@ iir_optimized.c:97: 		t1 = (int)C1 *(int)Xi + (1<<14);
	add	r5, r3, #16384	@ t1, _50,
@ iir_optimized.c:98: 		tmp_1 = ROUND_SHIFT(t1);
	uxth	r3, r5	@ _51, t1
	cmp	r3, #0	@ _51,
	beq	.L28		@,
@ iir_optimized.c:98: 		tmp_1 = ROUND_SHIFT(t1);
	asr	r3, r5, #15	@ _52, t1,
	orr	r3, r3, #1	@ iftmp.8_87, _52,
	b	.L29		@
.L28:
@ iir_optimized.c:98: 		tmp_1 = ROUND_SHIFT(t1);
	asr	r3, r5, #15	@ iftmp.8_87, t1,
.L29:
@ iir_optimized.c:98: 		tmp_1 = ROUND_SHIFT(t1);
	str	r3, [fp, #-56]	@ iftmp.8_87, tmp_1
@ iir_optimized.c:99: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-34]	@ _53, C2
@ iir_optimized.c:99: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	mul	r3, r3, r7	@ _54, _53, Xi_minus_1
@ iir_optimized.c:99: 		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t2, _54,
@ iir_optimized.c:100: 		tmp_2 = ROUND_SHIFT(t2);
	uxth	r3, r5	@ _55, t2
	cmp	r3, #0	@ _55,
	beq	.L30		@,
@ iir_optimized.c:100: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ _56, t2,
	orr	r3, r3, #1	@ iftmp.9_88, _56,
	b	.L31		@
.L30:
@ iir_optimized.c:100: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ iftmp.9_88, t2,
.L31:
@ iir_optimized.c:100: 		tmp_2 = ROUND_SHIFT(t2);
	str	r3, [fp, #-44]	@ iftmp.9_88, tmp_2
@ iir_optimized.c:101: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	ldrsh	r2, [fp, #-36]	@ _57, C3
@ iir_optimized.c:101: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	movw	r3, #:lower16:Y	@ tmp250,
	movt	r3, #:upper16:Y	@ tmp250,
	lsl	r1, r4, #1	@ tmp251, i,
	add	r3, r3, r1	@ tmp252, tmp250, tmp251
	ldrsh	r3, [r3]	@ _58, Y
@ iir_optimized.c:101: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	mul	r3, r3, r2	@ _60, _59, _57
@ iir_optimized.c:101: 		t3 = (int)C3 *(int)Y[i] + (1<<14);
	add	r5, r3, #16384	@ t3, _60,
@ iir_optimized.c:102: 		tmp_3 = ROUND_SHIFT(t3);
	uxth	r3, r5	@ _61, t3
	cmp	r3, #0	@ _61,
	beq	.L32		@,
@ iir_optimized.c:102: 		tmp_3 = ROUND_SHIFT(t3);
	asr	r3, r5, #15	@ _62, t3,
	orr	r3, r3, #1	@ iftmp.10_89, _62,
	b	.L33		@
.L32:
@ iir_optimized.c:102: 		tmp_3 = ROUND_SHIFT(t3);
	asr	r3, r5, #15	@ iftmp.10_89, t3,
.L33:
@ iir_optimized.c:102: 		tmp_3 = ROUND_SHIFT(t3);
	str	r3, [fp, #-60]	@ iftmp.10_89, tmp_3
@ iir_optimized.c:103: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	ldrsh	r3, [fp, #-38]	@ _63, C4
@ iir_optimized.c:103: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	mul	r3, r3, r6	@ _64, _63, Yi_minus_1
@ iir_optimized.c:103: 		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
	add	r5, r3, #16384	@ t4, _64,
@ iir_optimized.c:104: 		tmp_4 = ROUND_SHIFT(t4);
	uxth	r3, r5	@ _65, t4
	cmp	r3, #0	@ _65,
	beq	.L34		@,
@ iir_optimized.c:104: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r5, #15	@ _66, t4,
	orr	r3, r3, #1	@ iftmp.11_90, _66,
	b	.L35		@
.L34:
@ iir_optimized.c:104: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r5, #15	@ iftmp.11_90, t4,
.L35:
@ iir_optimized.c:104: 		tmp_4 = ROUND_SHIFT(t4);
	str	r3, [fp, #-48]	@ iftmp.11_90, tmp_4
@ iir_optimized.c:110: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-52]	@ tmp253, tmp_0
	ldr	r3, [fp, #-56]	@ tmp254, tmp_1
	add	r2, r2, r3	@ _67, tmp253, tmp254
	ldr	r3, [fp, #-44]	@ tmp255, tmp_2
	add	r2, r2, r3	@ _68, _67, tmp255
	ldr	r3, [fp, #-60]	@ tmp256, tmp_3
	add	r2, r2, r3	@ _69, _68, tmp256
	ldr	r3, [fp, #-48]	@ tmp257, tmp_4
	add	r3, r2, r3	@ _70, _69, tmp257
	movw	r2, #32767	@ tmp258,
	cmp	r3, r2	@ _70, tmp258
	movlt	r3, r3	@ _71, _70
	movge	r3, r2	@ _71, tmp258
@ iir_optimized.c:110: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	add	r1, r4, #1	@ _72, i,
@ iir_optimized.c:110: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _73, _71
	movw	r3, #:lower16:Y	@ tmp259,
	movt	r3, #:upper16:Y	@ tmp259,
	lsl	r1, r1, #1	@ tmp260, _72,
	add	r3, r3, r1	@ tmp261, tmp259, tmp260
	strh	r2, [r3]	@ movhi	@ _73, Y
@ iir_optimized.c:116: 		print(i);
	mov	r0, r4	@, i
	bl	print		@
@ iir_optimized.c:117: 		print(i+1);
	add	r3, r4, #1	@ _78, i,
	mov	r0, r3	@, _78
	bl	print		@
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	add	r4, r4, #2	@ i, i,
.L15:
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	ands	r3, r4, #128	@ _79, i,
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
@	cmp	r3, #0	@ _79,
	beq	.L36		@,
@ iir_optimized.c:121: }
	nop	
	sub	sp, fp, #24	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

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
	sub	r4, r4, #1	@ i, i,
.L2:
@ iir_optimized.c:19: 	for(i = 63; i; i--){
	cmp	r4, #0	@ i,
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}	@
	add	fp, sp, #24	@,,
	sub	sp, sp, #44	@,,
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	mov	r3, #0	@ tmp270,
	str	r3, [fp, #-32]	@ tmp270, run
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	b	.L15		@
.L38:
@ iir_optimized.c:59: 	const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp272,
	strh	r3, [fp, #-34]	@ movhi	@ tmp271, C0
@ iir_optimized.c:60: 	const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp274,
	strh	r3, [fp, #-36]	@ movhi	@ tmp273, C1
@ iir_optimized.c:61: 	const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp276,
	strh	r3, [fp, #-38]	@ movhi	@ tmp275, C2
@ iir_optimized.c:62: 	const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp278,
	strh	r3, [fp, #-40]	@ movhi	@ tmp277, C3
@ iir_optimized.c:63: 	const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp280,
	movt	r3, 65535	@ tmp280,
	strh	r3, [fp, #-42]	@ movhi	@ tmp279, C4
@ iir_optimized.c:69: 	filter_init_better(X.Init, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init_better		@
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	mov	r4, #2	@ i,
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	b	.L16		@
.L37:
@ iir_optimized.c:74: 		register int Xi = X.input[i];
	movw	r3, #:lower16:X	@ tmp281,
	movt	r3, #:upper16:X	@ tmp281,
	lsl	r2, r4, #1	@ tmp282, i,
	add	r3, r3, r2	@ tmp283, tmp281, tmp282
	ldrsh	r3, [r3]	@ _1, X.input
@ iir_optimized.c:74: 		register int Xi = X.input[i];
	mov	r7, r3	@ Xi, _1
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	sub	r2, r4, #1	@ _2, i,
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	movw	r3, #:lower16:X	@ tmp284,
	movt	r3, #:upper16:X	@ tmp284,
	lsl	r2, r2, #1	@ tmp285, _2,
	add	r3, r3, r2	@ tmp286, tmp284, tmp285
	ldrsh	r3, [r3]	@ _3, X.input
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];	
	mov	r6, r3	@ Xi_minus_1, _3
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	ldrsh	r2, [fp, #-38]	@ _4, C2
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	sub	r1, r4, #2	@ _5, i,
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	movw	r3, #:lower16:X	@ tmp287,
	movt	r3, #:upper16:X	@ tmp287,
	lsl	r1, r1, #1	@ tmp288, _5,
	add	r3, r3, r1	@ tmp289, tmp287, tmp288
	ldrsh	r3, [r3]	@ _6, X.input
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	mul	r3, r3, r2	@ _8, _7, _4
@ iir_optimized.c:76: 		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
	add	r5, r3, #16384	@ t2, _8,
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	uxth	r3, r5	@ _9, t2
	cmp	r3, #0	@ _9,
	beq	.L17		@,
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ _10, t2,
	orr	r3, r3, #1	@ iftmp.2_147, _10,
	b	.L18		@
.L17:
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	asr	r3, r5, #15	@ iftmp.2_147, t2,
.L18:
@ iir_optimized.c:77: 		tmp_2 = ROUND_SHIFT(t2);
	str	r3, [fp, #-48]	@ iftmp.2_147, tmp_2
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	sub	r2, r4, #1	@ _11, i,
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	movw	r3, #:lower16:Y	@ tmp290,
	movt	r3, #:upper16:Y	@ tmp290,
	lsl	r2, r2, #1	@ tmp291, _11,
	add	r3, r3, r2	@ tmp292, tmp290, tmp291
	ldrsh	r3, [r3]	@ _12, Y
@ iir_optimized.c:79: 		register int Yi_minus_1 = Y[i-1];
	mov	r5, r3	@ Yi_minus_1, _12
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	ldrsh	r2, [fp, #-42]	@ _13, C4
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	sub	r1, r4, #2	@ _14, i,
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	movw	r3, #:lower16:Y	@ tmp293,
	movt	r3, #:upper16:Y	@ tmp293,
	lsl	r1, r1, #1	@ tmp294, _14,
	add	r3, r3, r1	@ tmp295, tmp293, tmp294
	ldrsh	r3, [r3]	@ _15, Y
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	mul	r3, r3, r2	@ _17, _16, _13
@ iir_optimized.c:80: 		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
	add	r8, r3, #16384	@ t4, _17,
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	uxth	r3, r8	@ _18, t4
	cmp	r3, #0	@ _18,
	beq	.L19		@,
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r8, #15	@ _19, t4,
	orr	r3, r3, #1	@ iftmp.3_148, _19,
	b	.L20		@
.L19:
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	asr	r3, r8, #15	@ iftmp.3_148, t4,
.L20:
@ iir_optimized.c:81: 		tmp_4 = ROUND_SHIFT(t4);
	str	r3, [fp, #-52]	@ iftmp.3_148, tmp_4
@ iir_optimized.c:85: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _20, C0
	mul	r3, r3, r7	@ _21, _20, Xi
	add	r3, r3, #16384	@ _22, _21,
	uxth	r3, r3	@ _23, _22
	cmp	r3, #0	@ _23,
	beq	.L21		@,
@ iir_optimized.c:85: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _24, C0
	mul	r3, r3, r7	@ _25, _24, Xi
	add	r3, r3, #16384	@ _26, _25,
	asr	r3, r3, #15	@ _27, _26,
	orr	r3, r3, #1	@ iftmp.4_149, _27,
	b	.L22		@
.L21:
@ iir_optimized.c:85: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _28, C0
	mul	r3, r3, r7	@ _29, _28, Xi
	add	r3, r3, #16384	@ _30, _29,
	asr	r3, r3, #15	@ iftmp.4_149, _30,
.L22:
@ iir_optimized.c:85: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	str	r3, [fp, #-56]	@ iftmp.4_149, tmp_0
@ iir_optimized.c:86: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _31, C1
	mul	r3, r3, r6	@ _32, _31, Xi_minus_1
	add	r3, r3, #16384	@ _33, _32,
	uxth	r3, r3	@ _34, _33
	cmp	r3, #0	@ _34,
	beq	.L23		@,
@ iir_optimized.c:86: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _35, C1
	mul	r3, r3, r6	@ _36, _35, Xi_minus_1
	add	r3, r3, #16384	@ _37, _36,
	asr	r3, r3, #15	@ _38, _37,
	orr	r3, r3, #1	@ iftmp.5_150, _38,
	b	.L24		@
.L23:
@ iir_optimized.c:86: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _39, C1
	mul	r3, r3, r6	@ _40, _39, Xi_minus_1
	add	r3, r3, #16384	@ _41, _40,
	asr	r3, r3, #15	@ iftmp.5_150, _41,
.L24:
@ iir_optimized.c:86: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	str	r3, [fp, #-60]	@ iftmp.5_150, tmp_1
@ iir_optimized.c:87: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-40]	@ _42, C3
	mul	r3, r3, r5	@ _43, _42, Yi_minus_1
	add	r3, r3, #16384	@ _44, _43,
	uxth	r3, r3	@ _45, _44
	cmp	r3, #0	@ _45,
	beq	.L25		@,
@ iir_optimized.c:87: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-40]	@ _46, C3
	mul	r3, r3, r5	@ _47, _46, Yi_minus_1
	add	r3, r3, #16384	@ _48, _47,
	asr	r3, r3, #15	@ _49, _48,
	orr	r3, r3, #1	@ iftmp.6_151, _49,
	b	.L26		@
.L25:
@ iir_optimized.c:87: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-40]	@ _50, C3
	mul	r3, r3, r5	@ _51, _50, Yi_minus_1
	add	r3, r3, #16384	@ _52, _51,
	asr	r3, r3, #15	@ iftmp.6_151, _52,
.L26:
@ iir_optimized.c:87: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	str	r3, [fp, #-64]	@ iftmp.6_151, tmp_3
@ iir_optimized.c:90: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-56]	@ tmp296, tmp_0
	ldr	r3, [fp, #-60]	@ tmp297, tmp_1
	add	r2, r2, r3	@ _53, tmp296, tmp297
	ldr	r3, [fp, #-48]	@ tmp298, tmp_2
	add	r2, r2, r3	@ _54, _53, tmp298
	ldr	r3, [fp, #-64]	@ tmp299, tmp_3
	add	r2, r2, r3	@ _55, _54, tmp299
	ldr	r3, [fp, #-52]	@ tmp300, tmp_4
	add	r3, r2, r3	@ _56, _55, tmp300
	movw	r2, #32767	@ tmp301,
	cmp	r3, r2	@ _56, tmp301
	movlt	r3, r3	@ _57, _56
	movge	r3, r2	@ _57, tmp301
@ iir_optimized.c:90: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _58, _57
	movw	r3, #:lower16:Y	@ tmp302,
	movt	r3, #:upper16:Y	@ tmp302,
	lsl	r1, r4, #1	@ tmp303, i,
	add	r3, r3, r1	@ tmp304, tmp302, tmp303
	strh	r2, [r3]	@ movhi	@ _58, Y
@ iir_optimized.c:92: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _63, C0
	add	r1, r4, #1	@ _64, i,
	movw	r3, #:lower16:X	@ tmp310,
	movt	r3, #:upper16:X	@ tmp310,
	lsl	r1, r1, #1	@ tmp311, _64,
	add	r3, r3, r1	@ tmp312, tmp310, tmp311
	ldrsh	r3, [r3]	@ _65, X.input
	mul	r3, r3, r2	@ _67, _66, _63
	add	r3, r3, #16384	@ _68, _67,
	uxth	r3, r3	@ _69, _68
	cmp	r3, #0	@ _69,
	beq	.L27		@,
@ iir_optimized.c:92: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _70, C0
	add	r1, r4, #1	@ _71, i,
	movw	r3, #:lower16:X	@ tmp313,
	movt	r3, #:upper16:X	@ tmp313,
	lsl	r1, r1, #1	@ tmp314, _71,
	add	r3, r3, r1	@ tmp315, tmp313, tmp314
	ldrsh	r3, [r3]	@ _72, X.input
	mul	r3, r3, r2	@ _74, _73, _70
	add	r3, r3, #16384	@ _75, _74,
	asr	r3, r3, #15	@ _76, _75,
	orr	r3, r3, #1	@ iftmp.7_152, _76,
	b	.L28		@
.L27:
@ iir_optimized.c:92: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _77, C0
	add	r1, r4, #1	@ _78, i,
	movw	r3, #:lower16:X	@ tmp316,
	movt	r3, #:upper16:X	@ tmp316,
	lsl	r1, r1, #1	@ tmp317, _78,
	add	r3, r3, r1	@ tmp318, tmp316, tmp317
	ldrsh	r3, [r3]	@ _79, X.input
	mul	r3, r3, r2	@ _81, _80, _77
	add	r3, r3, #16384	@ _82, _81,
	asr	r3, r3, #15	@ iftmp.7_152, _82,
.L28:
@ iir_optimized.c:92: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	str	r3, [fp, #-56]	@ iftmp.7_152, tmp_0
@ iir_optimized.c:93: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _83, C1
	mul	r3, r3, r7	@ _84, _83, Xi
	add	r3, r3, #16384	@ _85, _84,
	uxth	r3, r3	@ _86, _85
	cmp	r3, #0	@ _86,
	beq	.L29		@,
@ iir_optimized.c:93: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _87, C1
	mul	r3, r3, r7	@ _88, _87, Xi
	add	r3, r3, #16384	@ _89, _88,
	asr	r3, r3, #15	@ _90, _89,
	orr	r3, r3, #1	@ iftmp.8_153, _90,
	b	.L30		@
.L29:
@ iir_optimized.c:93: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-36]	@ _91, C1
	mul	r3, r3, r7	@ _92, _91, Xi
	add	r3, r3, #16384	@ _93, _92,
	asr	r3, r3, #15	@ iftmp.8_153, _93,
.L30:
@ iir_optimized.c:93: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	str	r3, [fp, #-60]	@ iftmp.8_153, tmp_1
@ iir_optimized.c:94: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-38]	@ _94, C2
	mul	r3, r3, r6	@ _95, _94, Xi_minus_1
	add	r3, r3, #16384	@ _96, _95,
	uxth	r3, r3	@ _97, _96
	cmp	r3, #0	@ _97,
	beq	.L31		@,
@ iir_optimized.c:94: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-38]	@ _98, C2
	mul	r3, r3, r6	@ _99, _98, Xi_minus_1
	add	r3, r3, #16384	@ _100, _99,
	asr	r3, r3, #15	@ _101, _100,
	orr	r3, r3, #1	@ iftmp.9_154, _101,
	b	.L32		@
.L31:
@ iir_optimized.c:94: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-38]	@ _102, C2
	mul	r3, r3, r6	@ _103, _102, Xi_minus_1
	add	r3, r3, #16384	@ _104, _103,
	asr	r3, r3, #15	@ iftmp.9_154, _104,
.L32:
@ iir_optimized.c:94: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	str	r3, [fp, #-48]	@ iftmp.9_154, tmp_2
@ iir_optimized.c:95: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-40]	@ _105, C3
	movw	r3, #:lower16:Y	@ tmp319,
	movt	r3, #:upper16:Y	@ tmp319,
	lsl	r1, r4, #1	@ tmp320, i,
	add	r3, r3, r1	@ tmp321, tmp319, tmp320
	ldrsh	r3, [r3]	@ _106, Y
	mul	r3, r3, r2	@ _108, _107, _105
	add	r3, r3, #16384	@ _109, _108,
	uxth	r3, r3	@ _110, _109
	cmp	r3, #0	@ _110,
	beq	.L33		@,
@ iir_optimized.c:95: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-40]	@ _111, C3
	movw	r3, #:lower16:Y	@ tmp322,
	movt	r3, #:upper16:Y	@ tmp322,
	lsl	r1, r4, #1	@ tmp323, i,
	add	r3, r3, r1	@ tmp324, tmp322, tmp323
	ldrsh	r3, [r3]	@ _112, Y
	mul	r3, r3, r2	@ _114, _113, _111
	add	r3, r3, #16384	@ _115, _114,
	asr	r3, r3, #15	@ _116, _115,
	orr	r3, r3, #1	@ iftmp.10_155, _116,
	b	.L34		@
.L33:
@ iir_optimized.c:95: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-40]	@ _117, C3
	movw	r3, #:lower16:Y	@ tmp325,
	movt	r3, #:upper16:Y	@ tmp325,
	lsl	r1, r4, #1	@ tmp326, i,
	add	r3, r3, r1	@ tmp327, tmp325, tmp326
	ldrsh	r3, [r3]	@ _118, Y
	mul	r3, r3, r2	@ _120, _119, _117
	add	r3, r3, #16384	@ _121, _120,
	asr	r3, r3, #15	@ iftmp.10_155, _121,
.L34:
@ iir_optimized.c:95: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	str	r3, [fp, #-64]	@ iftmp.10_155, tmp_3
@ iir_optimized.c:96: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-42]	@ _122, C4
	mul	r3, r3, r5	@ _123, _122, Yi_minus_1
	add	r3, r3, #16384	@ _124, _123,
	uxth	r3, r3	@ _125, _124
	cmp	r3, #0	@ _125,
	beq	.L35		@,
@ iir_optimized.c:96: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-42]	@ _126, C4
	mul	r3, r3, r5	@ _127, _126, Yi_minus_1
	add	r3, r3, #16384	@ _128, _127,
	asr	r3, r3, #15	@ _129, _128,
	orr	r3, r3, #1	@ iftmp.11_156, _129,
	b	.L36		@
.L35:
@ iir_optimized.c:96: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-42]	@ _130, C4
	mul	r3, r3, r5	@ _131, _130, Yi_minus_1
	add	r3, r3, #16384	@ _132, _131,
	asr	r3, r3, #15	@ iftmp.11_156, _132,
.L36:
@ iir_optimized.c:96: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	str	r3, [fp, #-52]	@ iftmp.11_156, tmp_4
@ iir_optimized.c:102: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-56]	@ tmp328, tmp_0
	ldr	r3, [fp, #-60]	@ tmp329, tmp_1
	add	r2, r2, r3	@ _133, tmp328, tmp329
	ldr	r3, [fp, #-48]	@ tmp330, tmp_2
	add	r2, r2, r3	@ _134, _133, tmp330
	ldr	r3, [fp, #-64]	@ tmp331, tmp_3
	add	r2, r2, r3	@ _135, _134, tmp331
	ldr	r3, [fp, #-52]	@ tmp332, tmp_4
	add	r3, r2, r3	@ _136, _135, tmp332
	movw	r2, #32767	@ tmp333,
	cmp	r3, r2	@ _136, tmp333
	movlt	r3, r3	@ _137, _136
	movge	r3, r2	@ _137, tmp333
@ iir_optimized.c:102: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	add	r1, r4, #1	@ _138, i,
@ iir_optimized.c:102: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _139, _137
	movw	r3, #:lower16:Y	@ tmp334,
	movt	r3, #:upper16:Y	@ tmp334,
	lsl	r1, r1, #1	@ tmp335, _138,
	add	r3, r3, r1	@ tmp336, tmp334, tmp335
	strh	r2, [r3]	@ movhi	@ _139, Y
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	add	r4, r4, #2	@ i, i,
.L16:
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	and	r3, r4, #128	@ _144, i,
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	cmp	r3, #0	@ _144,
	beq	.L37		@,
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	ldr	r3, [fp, #-32]	@ tmp343, run
	add	r3, r3, #1	@ tmp342, tmp343,
	str	r3, [fp, #-32]	@ tmp342, run
.L15:
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	ldr	r3, [fp, #-32]	@ tmp344, run
	movw	r2, #9999	@ tmp345,
	cmp	r3, r2	@ tmp344, tmp345
	ble	.L38		@,
@ iir_optimized.c:113: }
	nop	
	sub	sp, fp, #24	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

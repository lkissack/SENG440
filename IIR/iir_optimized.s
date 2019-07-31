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
	push	{r4, r5, r6, r7, fp, lr}	@
	add	fp, sp, #20	@,,
	sub	sp, sp, #40	@,,
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	mov	r3, #0	@ tmp294,
	str	r3, [fp, #-24]	@ tmp294, run
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	b	.L15		@
.L38:
@ iir_optimized.c:59: 	const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp296,
	strh	r3, [fp, #-26]	@ movhi	@ tmp295, C0
@ iir_optimized.c:60: 	const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp298,
	strh	r3, [fp, #-28]	@ movhi	@ tmp297, C1
@ iir_optimized.c:61: 	const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp300,
	strh	r3, [fp, #-30]	@ movhi	@ tmp299, C2
@ iir_optimized.c:62: 	const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp302,
	strh	r3, [fp, #-32]	@ movhi	@ tmp301, C3
@ iir_optimized.c:63: 	const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp304,
	movt	r3, 65535	@ tmp304,
	strh	r3, [fp, #-34]	@ movhi	@ tmp303, C4
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
	movw	r3, #:lower16:X	@ tmp305,
	movt	r3, #:upper16:X	@ tmp305,
	lsl	r2, r4, #1	@ tmp306, i,
	add	r3, r3, r2	@ tmp307, tmp305, tmp306
	ldrsh	r3, [r3]	@ _1, X.input
@ iir_optimized.c:74: 		register int Xi = X.input[i];
	mov	r7, r3	@ Xi, _1
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];		
	sub	r2, r4, #1	@ _2, i,
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];		
	movw	r3, #:lower16:X	@ tmp308,
	movt	r3, #:upper16:X	@ tmp308,
	lsl	r2, r2, #1	@ tmp309, _2,
	add	r3, r3, r2	@ tmp310, tmp308, tmp309
	ldrsh	r3, [r3]	@ _3, X.input
@ iir_optimized.c:75: 		register int Xi_minus_1 = X.input[i-1];		
	mov	r6, r3	@ Xi_minus_1, _3
@ iir_optimized.c:76: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)X.input[i-2] + (1<<14));
	ldrsh	r2, [fp, #-30]	@ _4, C2
	sub	r1, r4, #2	@ _5, i,
	movw	r3, #:lower16:X	@ tmp311,
	movt	r3, #:upper16:X	@ tmp311,
	lsl	r1, r1, #1	@ tmp312, _5,
	add	r3, r3, r1	@ tmp313, tmp311, tmp312
	ldrsh	r3, [r3]	@ _6, X.input
	mul	r3, r3, r2	@ _8, _7, _4
	add	r3, r3, #16384	@ _9, _8,
	ubfx	r3, r3, #0, #15	@ _10, _9,,
	cmp	r3, #0	@ _10,
	beq	.L17		@,
@ iir_optimized.c:76: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)X.input[i-2] + (1<<14));
	ldrsh	r2, [fp, #-30]	@ _11, C2
	sub	r1, r4, #2	@ _12, i,
	movw	r3, #:lower16:X	@ tmp314,
	movt	r3, #:upper16:X	@ tmp314,
	lsl	r1, r1, #1	@ tmp315, _12,
	add	r3, r3, r1	@ tmp316, tmp314, tmp315
	ldrsh	r3, [r3]	@ _13, X.input
	mul	r3, r3, r2	@ _15, _14, _11
	add	r3, r3, #16384	@ _16, _15,
	asr	r3, r3, #15	@ _17, _16,
	orr	r3, r3, #1	@ iftmp.2_173, _17,
	b	.L18		@
.L17:
@ iir_optimized.c:76: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)X.input[i-2] + (1<<14));
	ldrsh	r2, [fp, #-30]	@ _18, C2
	sub	r1, r4, #2	@ _19, i,
	movw	r3, #:lower16:X	@ tmp317,
	movt	r3, #:upper16:X	@ tmp317,
	lsl	r1, r1, #1	@ tmp318, _19,
	add	r3, r3, r1	@ tmp319, tmp317, tmp318
	ldrsh	r3, [r3]	@ _20, X.input
	mul	r3, r3, r2	@ _22, _21, _18
	add	r3, r3, #16384	@ _23, _22,
	asr	r3, r3, #15	@ iftmp.2_173, _23,
.L18:
@ iir_optimized.c:76: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)X.input[i-2] + (1<<14));
	str	r3, [fp, #-40]	@ iftmp.2_173, tmp_2
@ iir_optimized.c:78: 		register int Yi_minus_1 = Y[i-1];
	sub	r2, r4, #1	@ _24, i,
@ iir_optimized.c:78: 		register int Yi_minus_1 = Y[i-1];
	movw	r3, #:lower16:Y	@ tmp320,
	movt	r3, #:upper16:Y	@ tmp320,
	lsl	r2, r2, #1	@ tmp321, _24,
	add	r3, r3, r2	@ tmp322, tmp320, tmp321
	ldrsh	r3, [r3]	@ _25, Y
@ iir_optimized.c:78: 		register int Yi_minus_1 = Y[i-1];
	mov	r5, r3	@ Yi_minus_1, _25
@ iir_optimized.c:79: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Y[i-2] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _26, C4
	sub	r1, r4, #2	@ _27, i,
	movw	r3, #:lower16:Y	@ tmp323,
	movt	r3, #:upper16:Y	@ tmp323,
	lsl	r1, r1, #1	@ tmp324, _27,
	add	r3, r3, r1	@ tmp325, tmp323, tmp324
	ldrsh	r3, [r3]	@ _28, Y
	mul	r3, r3, r2	@ _30, _29, _26
	add	r3, r3, #16384	@ _31, _30,
	ubfx	r3, r3, #0, #15	@ _32, _31,,
	cmp	r3, #0	@ _32,
	beq	.L19		@,
@ iir_optimized.c:79: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Y[i-2] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _33, C4
	sub	r1, r4, #2	@ _34, i,
	movw	r3, #:lower16:Y	@ tmp326,
	movt	r3, #:upper16:Y	@ tmp326,
	lsl	r1, r1, #1	@ tmp327, _34,
	add	r3, r3, r1	@ tmp328, tmp326, tmp327
	ldrsh	r3, [r3]	@ _35, Y
	mul	r3, r3, r2	@ _37, _36, _33
	add	r3, r3, #16384	@ _38, _37,
	asr	r3, r3, #15	@ _39, _38,
	orr	r3, r3, #1	@ iftmp.3_174, _39,
	b	.L20		@
.L19:
@ iir_optimized.c:79: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Y[i-2] + (1<<14));
	ldrsh	r2, [fp, #-34]	@ _40, C4
	sub	r1, r4, #2	@ _41, i,
	movw	r3, #:lower16:Y	@ tmp329,
	movt	r3, #:upper16:Y	@ tmp329,
	lsl	r1, r1, #1	@ tmp330, _41,
	add	r3, r3, r1	@ tmp331, tmp329, tmp330
	ldrsh	r3, [r3]	@ _42, Y
	mul	r3, r3, r2	@ _44, _43, _40
	add	r3, r3, #16384	@ _45, _44,
	asr	r3, r3, #15	@ iftmp.3_174, _45,
.L20:
@ iir_optimized.c:79: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Y[i-2] + (1<<14));
	str	r3, [fp, #-44]	@ iftmp.3_174, tmp_4
@ iir_optimized.c:83: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-26]	@ _46, C0
	mul	r3, r3, r7	@ _47, _46, Xi
	add	r3, r3, #16384	@ _48, _47,
	ubfx	r3, r3, #0, #15	@ _49, _48,,
	cmp	r3, #0	@ _49,
	beq	.L21		@,
@ iir_optimized.c:83: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-26]	@ _50, C0
	mul	r3, r3, r7	@ _51, _50, Xi
	add	r3, r3, #16384	@ _52, _51,
	asr	r3, r3, #15	@ _53, _52,
	orr	r3, r3, #1	@ iftmp.4_175, _53,
	b	.L22		@
.L21:
@ iir_optimized.c:83: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-26]	@ _54, C0
	mul	r3, r3, r7	@ _55, _54, Xi
	add	r3, r3, #16384	@ _56, _55,
	asr	r3, r3, #15	@ iftmp.4_175, _56,
.L22:
@ iir_optimized.c:83: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)Xi + (1<<14));
	str	r3, [fp, #-48]	@ iftmp.4_175, tmp_0
@ iir_optimized.c:84: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _57, C1
	mul	r3, r3, r6	@ _58, _57, Xi_minus_1
	add	r3, r3, #16384	@ _59, _58,
	ubfx	r3, r3, #0, #15	@ _60, _59,,
	cmp	r3, #0	@ _60,
	beq	.L23		@,
@ iir_optimized.c:84: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _61, C1
	mul	r3, r3, r6	@ _62, _61, Xi_minus_1
	add	r3, r3, #16384	@ _63, _62,
	asr	r3, r3, #15	@ _64, _63,
	orr	r3, r3, #1	@ iftmp.5_176, _64,
	b	.L24		@
.L23:
@ iir_optimized.c:84: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _65, C1
	mul	r3, r3, r6	@ _66, _65, Xi_minus_1
	add	r3, r3, #16384	@ _67, _66,
	asr	r3, r3, #15	@ iftmp.5_176, _67,
.L24:
@ iir_optimized.c:84: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi_minus_1 + (1<<14));
	str	r3, [fp, #-52]	@ iftmp.5_176, tmp_1
@ iir_optimized.c:85: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-32]	@ _68, C3
	mul	r3, r3, r5	@ _69, _68, Yi_minus_1
	add	r3, r3, #16384	@ _70, _69,
	ubfx	r3, r3, #0, #15	@ _71, _70,,
	cmp	r3, #0	@ _71,
	beq	.L25		@,
@ iir_optimized.c:85: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-32]	@ _72, C3
	mul	r3, r3, r5	@ _73, _72, Yi_minus_1
	add	r3, r3, #16384	@ _74, _73,
	asr	r3, r3, #15	@ _75, _74,
	orr	r3, r3, #1	@ iftmp.6_177, _75,
	b	.L26		@
.L25:
@ iir_optimized.c:85: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-32]	@ _76, C3
	mul	r3, r3, r5	@ _77, _76, Yi_minus_1
	add	r3, r3, #16384	@ _78, _77,
	asr	r3, r3, #15	@ iftmp.6_177, _78,
.L26:
@ iir_optimized.c:85: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Yi_minus_1 + (1<<14));
	str	r3, [fp, #-56]	@ iftmp.6_177, tmp_3
@ iir_optimized.c:88: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-48]	@ tmp332, tmp_0
	ldr	r3, [fp, #-52]	@ tmp333, tmp_1
	add	r2, r2, r3	@ _79, tmp332, tmp333
	ldr	r3, [fp, #-40]	@ tmp334, tmp_2
	add	r2, r2, r3	@ _80, _79, tmp334
	ldr	r3, [fp, #-56]	@ tmp335, tmp_3
	add	r2, r2, r3	@ _81, _80, tmp335
	ldr	r3, [fp, #-44]	@ tmp336, tmp_4
	add	r3, r2, r3	@ _82, _81, tmp336
	movw	r2, #32767	@ tmp337,
	cmp	r3, r2	@ _82, tmp337
	movlt	r3, r3	@ _83, _82
	movge	r3, r2	@ _83, tmp337
@ iir_optimized.c:88: 		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _84, _83
	movw	r3, #:lower16:Y	@ tmp338,
	movt	r3, #:upper16:Y	@ tmp338,
	lsl	r1, r4, #1	@ tmp339, i,
	add	r3, r3, r1	@ tmp340, tmp338, tmp339
	strh	r2, [r3]	@ movhi	@ _84, Y
@ iir_optimized.c:90: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-26]	@ _89, C0
	add	r1, r4, #1	@ _90, i,
	movw	r3, #:lower16:X	@ tmp346,
	movt	r3, #:upper16:X	@ tmp346,
	lsl	r1, r1, #1	@ tmp347, _90,
	add	r3, r3, r1	@ tmp348, tmp346, tmp347
	ldrsh	r3, [r3]	@ _91, X.input
	mul	r3, r3, r2	@ _93, _92, _89
	add	r3, r3, #16384	@ _94, _93,
	ubfx	r3, r3, #0, #15	@ _95, _94,,
	cmp	r3, #0	@ _95,
	beq	.L27		@,
@ iir_optimized.c:90: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-26]	@ _96, C0
	add	r1, r4, #1	@ _97, i,
	movw	r3, #:lower16:X	@ tmp349,
	movt	r3, #:upper16:X	@ tmp349,
	lsl	r1, r1, #1	@ tmp350, _97,
	add	r3, r3, r1	@ tmp351, tmp349, tmp350
	ldrsh	r3, [r3]	@ _98, X.input
	mul	r3, r3, r2	@ _100, _99, _96
	add	r3, r3, #16384	@ _101, _100,
	asr	r3, r3, #15	@ _102, _101,
	orr	r3, r3, #1	@ iftmp.7_178, _102,
	b	.L28		@
.L27:
@ iir_optimized.c:90: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	ldrsh	r2, [fp, #-26]	@ _103, C0
	add	r1, r4, #1	@ _104, i,
	movw	r3, #:lower16:X	@ tmp352,
	movt	r3, #:upper16:X	@ tmp352,
	lsl	r1, r1, #1	@ tmp353, _104,
	add	r3, r3, r1	@ tmp354, tmp352, tmp353
	ldrsh	r3, [r3]	@ _105, X.input
	mul	r3, r3, r2	@ _107, _106, _103
	add	r3, r3, #16384	@ _108, _107,
	asr	r3, r3, #15	@ iftmp.7_178, _108,
.L28:
@ iir_optimized.c:90: 		tmp_0 = ROUND_SHIFT((int)C0 *(int)X.input[i+1] + (1<<14));
	str	r3, [fp, #-48]	@ iftmp.7_178, tmp_0
@ iir_optimized.c:91: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _109, C1
	mul	r3, r3, r7	@ _110, _109, Xi
	add	r3, r3, #16384	@ _111, _110,
	ubfx	r3, r3, #0, #15	@ _112, _111,,
	cmp	r3, #0	@ _112,
	beq	.L29		@,
@ iir_optimized.c:91: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _113, C1
	mul	r3, r3, r7	@ _114, _113, Xi
	add	r3, r3, #16384	@ _115, _114,
	asr	r3, r3, #15	@ _116, _115,
	orr	r3, r3, #1	@ iftmp.8_179, _116,
	b	.L30		@
.L29:
@ iir_optimized.c:91: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	ldrsh	r3, [fp, #-28]	@ _117, C1
	mul	r3, r3, r7	@ _118, _117, Xi
	add	r3, r3, #16384	@ _119, _118,
	asr	r3, r3, #15	@ iftmp.8_179, _119,
.L30:
@ iir_optimized.c:91: 		tmp_1 = ROUND_SHIFT((int)C1 *(int)Xi + (1<<14));
	str	r3, [fp, #-52]	@ iftmp.8_179, tmp_1
@ iir_optimized.c:92: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-30]	@ _120, C2
	mul	r3, r3, r6	@ _121, _120, Xi_minus_1
	add	r3, r3, #16384	@ _122, _121,
	ubfx	r3, r3, #0, #15	@ _123, _122,,
	cmp	r3, #0	@ _123,
	beq	.L31		@,
@ iir_optimized.c:92: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-30]	@ _124, C2
	mul	r3, r3, r6	@ _125, _124, Xi_minus_1
	add	r3, r3, #16384	@ _126, _125,
	asr	r3, r3, #15	@ _127, _126,
	orr	r3, r3, #1	@ iftmp.9_180, _127,
	b	.L32		@
.L31:
@ iir_optimized.c:92: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-30]	@ _128, C2
	mul	r3, r3, r6	@ _129, _128, Xi_minus_1
	add	r3, r3, #16384	@ _130, _129,
	asr	r3, r3, #15	@ iftmp.9_180, _130,
.L32:
@ iir_optimized.c:92: 		tmp_2 = ROUND_SHIFT((int)C2 *(int)Xi_minus_1 + (1<<14));
	str	r3, [fp, #-40]	@ iftmp.9_180, tmp_2
@ iir_optimized.c:93: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-32]	@ _131, C3
	movw	r3, #:lower16:Y	@ tmp355,
	movt	r3, #:upper16:Y	@ tmp355,
	lsl	r1, r4, #1	@ tmp356, i,
	add	r3, r3, r1	@ tmp357, tmp355, tmp356
	ldrsh	r3, [r3]	@ _132, Y
	mul	r3, r3, r2	@ _134, _133, _131
	add	r3, r3, #16384	@ _135, _134,
	ubfx	r3, r3, #0, #15	@ _136, _135,,
	cmp	r3, #0	@ _136,
	beq	.L33		@,
@ iir_optimized.c:93: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-32]	@ _137, C3
	movw	r3, #:lower16:Y	@ tmp358,
	movt	r3, #:upper16:Y	@ tmp358,
	lsl	r1, r4, #1	@ tmp359, i,
	add	r3, r3, r1	@ tmp360, tmp358, tmp359
	ldrsh	r3, [r3]	@ _138, Y
	mul	r3, r3, r2	@ _140, _139, _137
	add	r3, r3, #16384	@ _141, _140,
	asr	r3, r3, #15	@ _142, _141,
	orr	r3, r3, #1	@ iftmp.10_181, _142,
	b	.L34		@
.L33:
@ iir_optimized.c:93: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	ldrsh	r2, [fp, #-32]	@ _143, C3
	movw	r3, #:lower16:Y	@ tmp361,
	movt	r3, #:upper16:Y	@ tmp361,
	lsl	r1, r4, #1	@ tmp362, i,
	add	r3, r3, r1	@ tmp363, tmp361, tmp362
	ldrsh	r3, [r3]	@ _144, Y
	mul	r3, r3, r2	@ _146, _145, _143
	add	r3, r3, #16384	@ _147, _146,
	asr	r3, r3, #15	@ iftmp.10_181, _147,
.L34:
@ iir_optimized.c:93: 		tmp_3 = ROUND_SHIFT((int)C3 *(int)Y[i] + (1<<14));
	str	r3, [fp, #-56]	@ iftmp.10_181, tmp_3
@ iir_optimized.c:94: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _148, C4
	mul	r3, r3, r5	@ _149, _148, Yi_minus_1
	add	r3, r3, #16384	@ _150, _149,
	ubfx	r3, r3, #0, #15	@ _151, _150,,
	cmp	r3, #0	@ _151,
	beq	.L35		@,
@ iir_optimized.c:94: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _152, C4
	mul	r3, r3, r5	@ _153, _152, Yi_minus_1
	add	r3, r3, #16384	@ _154, _153,
	asr	r3, r3, #15	@ _155, _154,
	orr	r3, r3, #1	@ iftmp.11_182, _155,
	b	.L36		@
.L35:
@ iir_optimized.c:94: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	ldrsh	r3, [fp, #-34]	@ _156, C4
	mul	r3, r3, r5	@ _157, _156, Yi_minus_1
	add	r3, r3, #16384	@ _158, _157,
	asr	r3, r3, #15	@ iftmp.11_182, _158,
.L36:
@ iir_optimized.c:94: 		tmp_4 = ROUND_SHIFT((int)C4 *(int)Yi_minus_1 + (1<<14));
	str	r3, [fp, #-44]	@ iftmp.11_182, tmp_4
@ iir_optimized.c:100: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-48]	@ tmp364, tmp_0
	ldr	r3, [fp, #-52]	@ tmp365, tmp_1
	add	r2, r2, r3	@ _159, tmp364, tmp365
	ldr	r3, [fp, #-40]	@ tmp366, tmp_2
	add	r2, r2, r3	@ _160, _159, tmp366
	ldr	r3, [fp, #-56]	@ tmp367, tmp_3
	add	r2, r2, r3	@ _161, _160, tmp367
	ldr	r3, [fp, #-44]	@ tmp368, tmp_4
	add	r3, r2, r3	@ _162, _161, tmp368
	movw	r2, #32767	@ tmp369,
	cmp	r3, r2	@ _162, tmp369
	movlt	r3, r3	@ _163, _162
	movge	r3, r2	@ _163, tmp369
@ iir_optimized.c:100: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	add	r1, r4, #1	@ _164, i,
@ iir_optimized.c:100: 		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _165, _163
	movw	r3, #:lower16:Y	@ tmp370,
	movt	r3, #:upper16:Y	@ tmp370,
	lsl	r1, r1, #1	@ tmp371, _164,
	add	r3, r3, r1	@ tmp372, tmp370, tmp371
	strh	r2, [r3]	@ movhi	@ _165, Y
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	add	r4, r4, #2	@ i, i,
.L16:
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	and	r3, r4, #128	@ _170, i,
@ iir_optimized.c:71: 	for (i =2; !(i&0x80); i+=2){
	cmp	r3, #0	@ _170,
	beq	.L37		@,
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	ldr	r3, [fp, #-24]	@ tmp379, run
	add	r3, r3, #1	@ tmp378, tmp379,
	str	r3, [fp, #-24]	@ tmp378, run
.L15:
@ iir_optimized.c:56: 	for(run = 0; run<10000; run++){
	ldr	r3, [fp, #-24]	@ tmp380, run
	movw	r2, #9999	@ tmp381,
	cmp	r3, r2	@ tmp380, tmp381
	ble	.L38		@,
@ iir_optimized.c:111: }
	nop	
	sub	sp, fp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

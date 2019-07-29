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
@ iir_optimized.c:12: 	X[0] = 0x80018001;
	ldr	r2, [fp, #-8]	@ tmp116, X
	movw	r3, #32769	@ tmp117,
	movt	r3, 32769	@ tmp117,
	str	r3, [r2]	@ tmp117, *X_9(D)
@ iir_optimized.c:15: 	for(i = 63; i; i--){
	mov	r4, #63	@ i,
@ iir_optimized.c:15: 	for(i = 63; i; i--){
	b	.L2		@
.L3:
@ iir_optimized.c:16: 		X[i] = 0x7FFF7FFF;
	mov	r3, r4	@ i.0_1, i
	lsl	r3, r3, #2	@ _2, i.0_1,
	ldr	r2, [fp, #-8]	@ tmp118, X
	add	r2, r2, r3	@ _3, tmp118, _2
@ iir_optimized.c:16: 		X[i] = 0x7FFF7FFF;
	movw	r3, #32767	@ tmp119,
	movt	r3, 32767	@ tmp119,
	str	r3, [r2]	@ tmp119, *_3
@ iir_optimized.c:15: 	for(i = 63; i; i--){
	sub	r4, r4, #1	@ i, i,
.L2:
@ iir_optimized.c:15: 	for(i = 63; i; i--){
	cmp	r4, #0	@ i,
	bne	.L3		@,
@ iir_optimized.c:19: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp120, Y
	add	r2, r3, #2	@ _4, tmp120,
@ iir_optimized.c:19: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp122,
	movt	r3, 65535	@ tmp122,
	strh	r3, [r2]	@ movhi	@ tmp121, *_4
@ iir_optimized.c:19: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _5, *_4
@ iir_optimized.c:19: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp123, Y
	strh	r2, [r3]	@ movhi	@ _5, *Y_14(D)
@ iir_optimized.c:20: }
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
@ iir_optimized.c:28: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp118, X
	add	r2, r3, #2	@ _1, tmp118,
@ iir_optimized.c:28: 	X[0] = X[1] = (short int) 0x8001;
	movw	r3, #32769	@ tmp120,
	movt	r3, 65535	@ tmp120,
	strh	r3, [r2]	@ movhi	@ tmp119, *_1
@ iir_optimized.c:28: 	X[0] = X[1] = (short int) 0x8001;
	ldrsh	r2, [r2]	@ _2, *_1
@ iir_optimized.c:28: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp121, X
	strh	r2, [r3]	@ movhi	@ _2, *X_10(D)
@ iir_optimized.c:30: 	for(i =2; i<128; i++){
	mov	r4, #2	@ i,
@ iir_optimized.c:30: 	for(i =2; i<128; i++){
	b	.L5		@
.L6:
@ iir_optimized.c:32: 		X[i] = (short int)0x7FFF;
	mov	r3, r4	@ i.1_3, i
	lsl	r3, r3, #1	@ _4, i.1_3,
	ldr	r2, [fp, #-8]	@ tmp122, X
	add	r3, r2, r3	@ _5, tmp122, _4
@ iir_optimized.c:32: 		X[i] = (short int)0x7FFF;
	mvn	r2, #32768	@ tmp124,
	strh	r2, [r3]	@ movhi	@ tmp123, *_5
@ iir_optimized.c:30: 	for(i =2; i<128; i++){
	add	r4, r4, #1	@ i, i,
.L5:
@ iir_optimized.c:30: 	for(i =2; i<128; i++){
	cmp	r4, #127	@ i,
	ble	.L6		@,
@ iir_optimized.c:34: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp125, Y
	add	r2, r3, #2	@ _6, tmp125,
@ iir_optimized.c:34: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp127,
	movt	r3, 65535	@ tmp127,
	strh	r3, [r2]	@ movhi	@ tmp126, *_6
@ iir_optimized.c:34: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _7, *_6
@ iir_optimized.c:34: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp128, Y
	strh	r2, [r3]	@ movhi	@ _7, *Y_17(D)
@ iir_optimized.c:36: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{r4, fp}	@
	bx	lr	@
	.size	filter_init, .-filter_init
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
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp118,
	movt	r3, #:upper16:Y	@ tmp118,
	ldr	r2, [fp, #-8]	@ tmp119, i
	lsl	r2, r2, #1	@ tmp120, tmp119,
	add	r3, r3, r2	@ tmp121, tmp118, tmp120
	ldrsh	r3, [r3]	@ _1, Y
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r1, r3	@ _2, _1
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp122,
	movt	r3, #:upper16:Y	@ tmp122,
	ldr	r2, [fp, #-8]	@ tmp123, i
	lsl	r2, r2, #1	@ tmp124, tmp123,
	add	r3, r3, r2	@ tmp125, tmp122, tmp124
	ldrsh	r3, [r3]	@ _3, Y
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r0, r3	@ _4, _3
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp126,
	movt	r3, #:upper16:Y	@ tmp126,
	ldr	r2, [fp, #-8]	@ tmp127, i
	lsl	r2, r2, #1	@ tmp128, tmp127,
	add	r3, r3, r2	@ tmp129, tmp126, tmp128
	ldrsh	r3, [r3]	@ _5, Y
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f32.s32	s14, s15	@ _6, _5
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vldr.32	s13, .L8	@ tmp130,
	vdiv.f32	s15, s14, s13	@ _7, _6, tmp130
@ iir_optimized.c:39: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
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
@ iir_optimized.c:40: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
.L9:
	.align	2
.L8:
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
@ iir_optimized.c:45: 	register const short int C0 = 0x10C8;
	movw	r5, #4296	@ C0,
@ iir_optimized.c:46: 	register const short int C1 = 0x2190;
	movw	r6, #8592	@ C1,
@ iir_optimized.c:47: 	register const short int C2 = 0x10C8;
	movw	r7, #4296	@ C2,
@ iir_optimized.c:48: 	register const short int C3 = 0x5FB7;
	movw	r8, #24503	@ C3,
@ iir_optimized.c:49: 	register const short int C4 = 0xDD28;//Negative representation
	movw	r4, #56616	@ C4,
	movt	r4, 65535	@ C4,
@ iir_optimized.c:55: 	filter_init_better(X.Init, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init_better		@
@ iir_optimized.c:57: 	for (i =2; !(i&0x80); i+=2){
	mov	r4, #2	@ i,
@ iir_optimized.c:57: 	for (i =2; !(i&0x80); i+=2){
	b	.L11		@
.L12:
@ iir_optimized.c:60: 		int Xi = X.input[i];
	movw	r3, #:lower16:X	@ tmp170,
	movt	r3, #:upper16:X	@ tmp170,
	lsl	r2, r4, #1	@ tmp171, i,
	add	r3, r3, r2	@ tmp172, tmp170, tmp171
	ldrsh	r3, [r3]	@ _1, X.input
@ iir_optimized.c:60: 		int Xi = X.input[i];
	str	r3, [fp, #-32]	@ _1, Xi
@ iir_optimized.c:61: 		int Xi_minus_1 = X.input[i-1];		
	sub	r2, r4, #1	@ _2, i,
@ iir_optimized.c:61: 		int Xi_minus_1 = X.input[i-1];		
	movw	r3, #:lower16:X	@ tmp173,
	movt	r3, #:upper16:X	@ tmp173,
	lsl	r2, r2, #1	@ tmp174, _2,
	add	r3, r3, r2	@ tmp175, tmp173, tmp174
	ldrsh	r3, [r3]	@ _3, X.input
@ iir_optimized.c:61: 		int Xi_minus_1 = X.input[i-1];		
	str	r3, [fp, #-36]	@ _3, Xi_minus_1
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	mov	r1, r7	@ _4, C2
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	sub	r2, r4, #2	@ _5, i,
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	movw	r3, #:lower16:X	@ tmp176,
	movt	r3, #:upper16:X	@ tmp176,
	lsl	r2, r2, #1	@ tmp177, _5,
	add	r3, r3, r2	@ tmp178, tmp176, tmp177
	ldrsh	r3, [r3]	@ _6, X.input
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	mul	r3, r3, r1	@ _8, _7, _4
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	add	r3, r3, #16384	@ _9, _8,
@ iir_optimized.c:62: 		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
	asr	r3, r3, #15	@ tmp179, _9,
	str	r3, [fp, #-40]	@ tmp179, tmp_2
@ iir_optimized.c:63: 		int Yi_minus_1 = Y[i-1];		
	sub	r2, r4, #1	@ _10, i,
@ iir_optimized.c:63: 		int Yi_minus_1 = Y[i-1];		
	movw	r3, #:lower16:Y	@ tmp180,
	movt	r3, #:upper16:Y	@ tmp180,
	lsl	r2, r2, #1	@ tmp181, _10,
	add	r3, r3, r2	@ tmp182, tmp180, tmp181
	ldrsh	r3, [r3]	@ _11, Y
@ iir_optimized.c:63: 		int Yi_minus_1 = Y[i-1];		
	str	r3, [fp, #-44]	@ _11, Yi_minus_1
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	mov	r1, r5	@ _12, C0
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	sub	r2, r4, #2	@ _13, i,
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	movw	r3, #:lower16:Y	@ tmp183,
	movt	r3, #:upper16:Y	@ tmp183,
	lsl	r2, r2, #1	@ tmp184, _13,
	add	r3, r3, r2	@ tmp185, tmp183, tmp184
	ldrsh	r3, [r3]	@ _14, Y
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	mul	r3, r3, r1	@ _16, _15, _12
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	add	r3, r3, #16384	@ _17, _16,
@ iir_optimized.c:64: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp186, _17,
	str	r3, [fp, #-48]	@ tmp186, tmp_4
@ iir_optimized.c:67: 		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
	mov	r2, r5	@ _18, C0
@ iir_optimized.c:67: 		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
	ldr	r3, [fp, #-32]	@ tmp187, Xi
	mul	r3, r3, r2	@ _19, tmp187, _18
@ iir_optimized.c:67: 		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
	add	r3, r3, #16384	@ _20, _19,
@ iir_optimized.c:67: 		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp188, _20,
	str	r3, [fp, #-52]	@ tmp188, tmp_0
@ iir_optimized.c:68: 		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
	mov	r2, r6	@ _21, C1
@ iir_optimized.c:68: 		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
	ldr	r3, [fp, #-36]	@ tmp189, Xi_minus_1
	mul	r3, r3, r2	@ _22, tmp189, _21
@ iir_optimized.c:68: 		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
	add	r3, r3, #16384	@ _23, _22,
@ iir_optimized.c:68: 		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp190, _23,
	str	r3, [fp, #-56]	@ tmp190, tmp_1
@ iir_optimized.c:69: 		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
	mov	r2, r8	@ _24, C3
@ iir_optimized.c:69: 		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
	ldr	r3, [fp, #-44]	@ tmp191, Yi_minus_1
	mul	r3, r3, r2	@ _25, tmp191, _24
@ iir_optimized.c:69: 		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
	add	r3, r3, #16384	@ _26, _25,
@ iir_optimized.c:69: 		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp192, _26,
	str	r3, [fp, #-60]	@ tmp192, tmp_3
@ iir_optimized.c:70: 		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r2, [fp, #-52]	@ tmp193, tmp_0
	ldr	r3, [fp, #-56]	@ tmp194, tmp_1
	add	r2, r2, r3	@ _27, tmp193, tmp194
@ iir_optimized.c:70: 		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r3, [fp, #-40]	@ tmp195, tmp_2
	add	r2, r2, r3	@ _28, _27, tmp195
@ iir_optimized.c:70: 		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r3, [fp, #-60]	@ tmp196, tmp_3
	add	r3, r2, r3	@ _29, _28, tmp196
@ iir_optimized.c:70: 		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r2, [fp, #-48]	@ tmp198, tmp_4
	add	r3, r2, r3	@ tmp197, tmp198, _29
	str	r3, [fp, #-64]	@ tmp197, Yi
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	mov	r1, r5	@ _30, C0
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	add	r2, r4, #1	@ _31, i,
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	movw	r3, #:lower16:X	@ tmp199,
	movt	r3, #:upper16:X	@ tmp199,
	lsl	r2, r2, #1	@ tmp200, _31,
	add	r3, r3, r2	@ tmp201, tmp199, tmp200
	ldrsh	r3, [r3]	@ _32, X.input
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	mul	r3, r3, r1	@ _34, _33, _30
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	add	r3, r3, #16384	@ _35, _34,
@ iir_optimized.c:72: 		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp202, _35,
	str	r3, [fp, #-52]	@ tmp202, tmp_0
@ iir_optimized.c:73: 		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
	mov	r2, r6	@ _36, C1
@ iir_optimized.c:73: 		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
	ldr	r3, [fp, #-32]	@ tmp203, Xi
	mul	r3, r3, r2	@ _37, tmp203, _36
@ iir_optimized.c:73: 		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
	add	r3, r3, #16384	@ _38, _37,
@ iir_optimized.c:73: 		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp204, _38,
	str	r3, [fp, #-56]	@ tmp204, tmp_1
@ iir_optimized.c:74: 		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
	mov	r2, r7	@ _39, C2
@ iir_optimized.c:74: 		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
	ldr	r3, [fp, #-36]	@ tmp205, Xi_minus_1
	mul	r3, r3, r2	@ _40, tmp205, _39
@ iir_optimized.c:74: 		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
	add	r3, r3, #16384	@ _41, _40,
@ iir_optimized.c:74: 		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp206, _41,
	str	r3, [fp, #-40]	@ tmp206, tmp_2
@ iir_optimized.c:75: 		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
	mov	r2, r8	@ _42, C3
@ iir_optimized.c:75: 		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
	ldr	r3, [fp, #-64]	@ tmp207, Yi
	mul	r3, r3, r2	@ _43, tmp207, _42
@ iir_optimized.c:75: 		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
	add	r3, r3, #16384	@ _44, _43,
@ iir_optimized.c:75: 		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp208, _44,
	str	r3, [fp, #-60]	@ tmp208, tmp_3
@ iir_optimized.c:76: 		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
	mov	r2, r5	@ _45, C0
@ iir_optimized.c:76: 		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
	ldr	r3, [fp, #-44]	@ tmp209, Yi_minus_1
	mul	r3, r3, r2	@ _46, tmp209, _45
@ iir_optimized.c:76: 		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
	add	r3, r3, #16384	@ _47, _46,
@ iir_optimized.c:76: 		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp210, _47,
	str	r3, [fp, #-48]	@ tmp210, tmp_4
@ iir_optimized.c:77: 		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r2, [fp, #-52]	@ tmp211, tmp_0
	ldr	r3, [fp, #-56]	@ tmp212, tmp_1
	add	r2, r2, r3	@ _48, tmp211, tmp212
@ iir_optimized.c:77: 		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r3, [fp, #-40]	@ tmp213, tmp_2
	add	r2, r2, r3	@ _49, _48, tmp213
@ iir_optimized.c:77: 		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r3, [fp, #-60]	@ tmp214, tmp_3
	add	r3, r2, r3	@ _50, _49, tmp214
@ iir_optimized.c:77: 		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
	ldr	r2, [fp, #-48]	@ tmp216, tmp_4
	add	r3, r2, r3	@ tmp215, tmp216, _50
	str	r3, [fp, #-68]	@ tmp215, Yi_plus_1
@ iir_optimized.c:80: 		Y[i] = (short int)( Yi);
	ldr	r3, [fp, #-64]	@ tmp217, Yi
	sxth	r2, r3	@ _51, tmp217
@ iir_optimized.c:80: 		Y[i] = (short int)( Yi);
	movw	r3, #:lower16:Y	@ tmp218,
	movt	r3, #:upper16:Y	@ tmp218,
	lsl	r1, r4, #1	@ tmp219, i,
	add	r3, r3, r1	@ tmp220, tmp218, tmp219
	strh	r2, [r3]	@ movhi	@ _51, Y
@ iir_optimized.c:81: 		Y[i+1] = (short int)( Yi_plus_1);
	add	r1, r4, #1	@ _52, i,
@ iir_optimized.c:81: 		Y[i+1] = (short int)( Yi_plus_1);
	ldr	r3, [fp, #-68]	@ tmp221, Yi_plus_1
	sxth	r2, r3	@ _53, tmp221
@ iir_optimized.c:81: 		Y[i+1] = (short int)( Yi_plus_1);
	movw	r3, #:lower16:Y	@ tmp222,
	movt	r3, #:upper16:Y	@ tmp222,
	lsl	r1, r1, #1	@ tmp223, _52,
	add	r3, r3, r1	@ tmp224, tmp222, tmp223
	strh	r2, [r3]	@ movhi	@ _53, Y
@ iir_optimized.c:57: 	for (i =2; !(i&0x80); i+=2){
	add	r4, r4, #2	@ i, i,
.L11:
@ iir_optimized.c:57: 	for (i =2; !(i&0x80); i+=2){
	and	r3, r4, #128	@ _54, i,
@ iir_optimized.c:57: 	for (i =2; !(i&0x80); i+=2){
	cmp	r3, #0	@ _54,
	beq	.L12		@,
@ iir_optimized.c:91: }
	nop	
	sub	sp, fp, #24	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

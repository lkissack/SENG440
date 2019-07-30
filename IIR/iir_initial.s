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
	.file	"iir_initial.c"
@ GNU C17 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  iir_initial.c -mtune=generic-armv7-a -mfloat-abi=hard
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
	.comm	X,256,4
	.comm	Y,256,4
	.align	2
	.global	filter_init
	.arch armv7-a
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
@ iir_initial.c:9: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp118, X
	add	r2, r3, #2	@ _1, tmp118,
@ iir_initial.c:9: 	X[0] = X[1] = (short int) 0x8001;
	movw	r3, #32769	@ tmp120,
	movt	r3, 65535	@ tmp120,
	strh	r3, [r2]	@ movhi	@ tmp119, *_1
@ iir_initial.c:9: 	X[0] = X[1] = (short int) 0x8001;
	ldrsh	r2, [r2]	@ _2, *_1
@ iir_initial.c:9: 	X[0] = X[1] = (short int) 0x8001;
	ldr	r3, [fp, #-8]	@ tmp121, X
	strh	r2, [r3]	@ movhi	@ _2, *X_10(D)
@ iir_initial.c:11: 	for(i =2; i<100; i++){
	mov	r4, #2	@ i,
@ iir_initial.c:11: 	for(i =2; i<100; i++){
	b	.L2		@
.L3:
@ iir_initial.c:12: 		X[i] = (short int)0x7FFFF;
	mov	r3, r4	@ i.0_3, i
	lsl	r3, r3, #1	@ _4, i.0_3,
	ldr	r2, [fp, #-8]	@ tmp122, X
	add	r3, r2, r3	@ _5, tmp122, _4
@ iir_initial.c:12: 		X[i] = (short int)0x7FFFF;
	mvn	r2, #0	@ tmp124,
	strh	r2, [r3]	@ movhi	@ tmp123, *_5
@ iir_initial.c:11: 	for(i =2; i<100; i++){
	add	r4, r4, #1	@ i, i,
.L2:
@ iir_initial.c:11: 	for(i =2; i<100; i++){
	cmp	r4, #99	@ i,
	ble	.L3		@,
@ iir_initial.c:14: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp125, Y
	add	r2, r3, #2	@ _6, tmp125,
@ iir_initial.c:14: 	Y[0] = Y[1] = (short int)0x8001;
	movw	r3, #32769	@ tmp127,
	movt	r3, 65535	@ tmp127,
	strh	r3, [r2]	@ movhi	@ tmp126, *_6
@ iir_initial.c:14: 	Y[0] = Y[1] = (short int)0x8001;
	ldrsh	r2, [r2]	@ _7, *_6
@ iir_initial.c:14: 	Y[0] = Y[1] = (short int)0x8001;
	ldr	r3, [fp, #-12]	@ tmp128, Y
	strh	r2, [r3]	@ movhi	@ _7, *Y_17(D)
@ iir_initial.c:16: }
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
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp118,
	movt	r3, #:upper16:Y	@ tmp118,
	ldr	r2, [fp, #-8]	@ tmp119, i
	lsl	r2, r2, #1	@ tmp120, tmp119,
	add	r3, r3, r2	@ tmp121, tmp118, tmp120
	ldrsh	r3, [r3]	@ _1, Y
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r1, r3	@ _2, _1
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp122,
	movt	r3, #:upper16:Y	@ tmp122,
	ldr	r2, [fp, #-8]	@ tmp123, i
	lsl	r2, r2, #1	@ tmp124, tmp123,
	add	r3, r3, r2	@ tmp125, tmp122, tmp124
	ldrsh	r3, [r3]	@ _3, Y
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	mov	r0, r3	@ _4, _3
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	movw	r3, #:lower16:Y	@ tmp126,
	movt	r3, #:upper16:Y	@ tmp126,
	ldr	r2, [fp, #-8]	@ tmp127, i
	lsl	r2, r2, #1	@ tmp128, tmp127,
	add	r3, r3, r2	@ tmp129, tmp126, tmp128
	ldrsh	r3, [r3]	@ _5, Y
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vmov	s15, r3	@ int	@ _5, _5
	vcvt.f32.s32	s14, s15	@ _6, _5
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
	vldr.32	s13, .L5	@ tmp130,
	vdiv.f32	s15, s14, s13	@ _7, _6, tmp130
@ iir_initial.c:19: 	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
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
@ iir_initial.c:20: }
	nop	
	sub	sp, fp, #4	@,,
	@ sp needed	@
	pop	{fp, pc}	@
.L6:
	.align	2
.L5:
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
	push	{r4, fp, lr}	@
	add	fp, sp, #8	@,,
	sub	sp, sp, #36	@,,
@ iir_initial.c:24: 	const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp151,
	strh	r3, [fp, #-14]	@ movhi	@ tmp150, C0
@ iir_initial.c:25: 	const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp153,
	strh	r3, [fp, #-16]	@ movhi	@ tmp152, C1
@ iir_initial.c:26: 	const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp155,
	strh	r3, [fp, #-18]	@ movhi	@ tmp154, C2
@ iir_initial.c:27: 	const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp157,
	strh	r3, [fp, #-20]	@ movhi	@ tmp156, C3
@ iir_initial.c:28: 	const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp159,
	movt	r3, 65535	@ tmp159,
	strh	r3, [fp, #-22]	@ movhi	@ tmp158, C4
@ iir_initial.c:34: 	filter_init(X, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init		@
@ iir_initial.c:36: 	for (i =2; i< 100; i++){
	mov	r4, #2	@ i,
@ iir_initial.c:36: 	for (i =2; i< 100; i++){
	b	.L8		@
.L9:
@ iir_initial.c:37: 		tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
	ldrsh	r2, [fp, #-14]	@ _1, C0
@ iir_initial.c:37: 		tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
	movw	r3, #:lower16:X	@ tmp160,
	movt	r3, #:upper16:X	@ tmp160,
	lsl	r1, r4, #1	@ tmp161, i,
	add	r3, r3, r1	@ tmp162, tmp160, tmp161
	ldrsh	r3, [r3]	@ _2, X
@ iir_initial.c:37: 		tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
	mul	r3, r3, r2	@ _4, _3, _1
@ iir_initial.c:37: 		tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
	add	r3, r3, #16384	@ _5, _4,
@ iir_initial.c:37: 		tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp163, _5,
	str	r3, [fp, #-28]	@ tmp163, tmp_0
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	ldrsh	r2, [fp, #-16]	@ _6, C1
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	sub	r1, r4, #1	@ _7, i,
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	movw	r3, #:lower16:X	@ tmp164,
	movt	r3, #:upper16:X	@ tmp164,
	lsl	r1, r1, #1	@ tmp165, _7,
	add	r3, r3, r1	@ tmp166, tmp164, tmp165
	ldrsh	r3, [r3]	@ _8, X
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	mul	r3, r3, r2	@ _10, _9, _6
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	add	r3, r3, #16384	@ _11, _10,
@ iir_initial.c:38: 		tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp167, _11,
	str	r3, [fp, #-32]	@ tmp167, tmp_1
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	ldrsh	r2, [fp, #-18]	@ _12, C2
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	sub	r1, r4, #2	@ _13, i,
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	movw	r3, #:lower16:X	@ tmp168,
	movt	r3, #:upper16:X	@ tmp168,
	lsl	r1, r1, #1	@ tmp169, _13,
	add	r3, r3, r1	@ tmp170, tmp168, tmp169
	ldrsh	r3, [r3]	@ _14, X
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	mul	r3, r3, r2	@ _16, _15, _12
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	add	r3, r3, #16384	@ _17, _16,
@ iir_initial.c:39: 		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp171, _17,
	str	r3, [fp, #-36]	@ tmp171, tmp_2
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	ldrsh	r2, [fp, #-20]	@ _18, C3
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	sub	r1, r4, #1	@ _19, i,
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	movw	r3, #:lower16:Y	@ tmp172,
	movt	r3, #:upper16:Y	@ tmp172,
	lsl	r1, r1, #1	@ tmp173, _19,
	add	r3, r3, r1	@ tmp174, tmp172, tmp173
	ldrsh	r3, [r3]	@ _20, Y
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	mul	r3, r3, r2	@ _22, _21, _18
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	add	r3, r3, #16384	@ _23, _22,
@ iir_initial.c:40: 		tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp175, _23,
	str	r3, [fp, #-40]	@ tmp175, tmp_3
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	ldrsh	r2, [fp, #-14]	@ _24, C0
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	sub	r1, r4, #2	@ _25, i,
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	movw	r3, #:lower16:Y	@ tmp176,
	movt	r3, #:upper16:Y	@ tmp176,
	lsl	r1, r1, #1	@ tmp177, _25,
	add	r3, r3, r1	@ tmp178, tmp176, tmp177
	ldrsh	r3, [r3]	@ _26, Y
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	mul	r3, r3, r2	@ _28, _27, _24
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	add	r3, r3, #16384	@ _29, _28,
@ iir_initial.c:41: 		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
	asr	r3, r3, #15	@ tmp179, _29,
	str	r3, [fp, #-44]	@ tmp179, tmp_4
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-28]	@ tmp180, tmp_0
	uxth	r2, r3	@ _30, tmp180
	ldr	r3, [fp, #-32]	@ tmp181, tmp_1
	uxth	r3, r3	@ _31, tmp181
	add	r3, r2, r3	@ tmp182, _30, _31
	uxth	r2, r3	@ _32, tmp182
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-36]	@ tmp183, tmp_2
	uxth	r3, r3	@ _33, tmp183
	add	r3, r2, r3	@ tmp184, _32, _33
	uxth	r2, r3	@ _34, tmp184
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-40]	@ tmp185, tmp_3
	uxth	r3, r3	@ _35, tmp185
	add	r3, r2, r3	@ tmp186, _34, _35
	uxth	r2, r3	@ _36, tmp186
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-44]	@ tmp187, tmp_4
	uxth	r3, r3	@ _37, tmp187
	add	r3, r2, r3	@ tmp188, _36, _37
	uxth	r3, r3	@ _38, tmp188
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	sxth	r2, r3	@ _39, _38
@ iir_initial.c:43: 		Y[i] = (short int)( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	movw	r3, #:lower16:Y	@ tmp189,
	movt	r3, #:upper16:Y	@ tmp189,
	lsl	r1, r4, #1	@ tmp190, i,
	add	r3, r3, r1	@ tmp191, tmp189, tmp190
	strh	r2, [r3]	@ movhi	@ _39, Y
@ iir_initial.c:36: 	for (i =2; i< 100; i++){
	add	r4, r4, #1	@ i, i,
.L8:
@ iir_initial.c:36: 	for (i =2; i< 100; i++){
	cmp	r4, #99	@ i,
	ble	.L9		@,
@ iir_initial.c:46: }
	nop	
	sub	sp, fp, #8	@,,
	@ sp needed	@
	pop	{r4, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

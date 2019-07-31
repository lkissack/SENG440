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
@ iir_initial.c:11: 	for(i =2; i<128; i++){
	mov	r4, #2	@ i,
@ iir_initial.c:11: 	for(i =2; i<128; i++){
	b	.L2		@
.L3:
@ iir_initial.c:12: 		X[i] = (short int)0x7FFF;
	mov	r3, r4	@ i.0_3, i
	lsl	r3, r3, #1	@ _4, i.0_3,
	ldr	r2, [fp, #-8]	@ tmp122, X
	add	r3, r2, r3	@ _5, tmp122, _4
@ iir_initial.c:12: 		X[i] = (short int)0x7FFF;
	mvn	r2, #32768	@ tmp124,
	strh	r2, [r3]	@ movhi	@ tmp123, *_5
@ iir_initial.c:11: 	for(i =2; i<128; i++){
	add	r4, r4, #1	@ i, i,
.L2:
@ iir_initial.c:11: 	for(i =2; i<128; i++){
	cmp	r4, #127	@ i,
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
@ iir_initial.c:23: 	int tmp = a;
	ldr	r3, [fp, #-16]	@ tmp112, a
	str	r3, [fp, #-8]	@ tmp112, tmp
@ iir_initial.c:24: 	if(tmp >= 32767)
	ldr	r3, [fp, #-8]	@ tmp113, tmp
	movw	r2, #32766	@ tmp114,
	cmp	r3, r2	@ tmp113, tmp114
	ble	.L8		@,
@ iir_initial.c:25: 		tmp = 32767;
	movw	r3, #32767	@ tmp115,
	str	r3, [fp, #-8]	@ tmp115, tmp
.L8:
@ iir_initial.c:26: 	if(tmp <= -32767)
	ldr	r2, [fp, #-8]	@ tmp116, tmp
	movw	r3, #32770	@ tmp117,
	movt	r3, 65535	@ tmp117,
	cmp	r2, r3	@ tmp116, tmp117
	bge	.L9		@,
@ iir_initial.c:27: 		tmp = -32767;
	movw	r3, #32769	@ tmp118,
	movt	r3, 65535	@ tmp118,
	str	r3, [fp, #-8]	@ tmp118, tmp
.L9:
@ iir_initial.c:29: 	return (short int) tmp;
	ldr	r3, [fp, #-8]	@ tmp119, tmp
	sxth	r3, r3	@ _7, tmp119
@ iir_initial.c:30: }
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
@ iir_initial.c:34: 	if(a&0x7FFF)
	ldr	r3, [fp, #-8]	@ tmp113, a
	ubfx	r3, r3, #0, #15	@ _1, tmp113,,
@ iir_initial.c:34: 	if(a&0x7FFF)
	cmp	r3, #0	@ _1,
	beq	.L12		@,
@ iir_initial.c:35: 		a|=0x8000;
	ldr	r3, [fp, #-8]	@ tmp115, a
	orr	r3, r3, #32768	@ tmp114, tmp115,
	str	r3, [fp, #-8]	@ tmp114, a
.L12:
@ iir_initial.c:36: 	return a>>15;
	ldr	r3, [fp, #-8]	@ tmp116, a
	asr	r3, r3, #15	@ _5, tmp116,
@ iir_initial.c:37: }
	mov	r0, r3	@, <retval>
	add	sp, fp, #0	@,,
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	bx	lr	@
	.size	round_shift, .-round_shift
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}	@
	add	fp, sp, #8	@,,
	sub	sp, sp, #44	@,,
@ iir_initial.c:42: 	for (run = 0; run <1000; run++){
	mov	r3, #0	@ tmp147,
	str	r3, [fp, #-16]	@ tmp147, run
@ iir_initial.c:42: 	for (run = 0; run <1000; run++){
	b	.L15		@
.L18:
@ iir_initial.c:43: 		const short int C0 = 0x10C8;
	movw	r3, #4296	@ tmp149,
	strh	r3, [fp, #-18]	@ movhi	@ tmp148, C0
@ iir_initial.c:44: 		const short int C1 = 0x2190;
	movw	r3, #8592	@ tmp151,
	strh	r3, [fp, #-20]	@ movhi	@ tmp150, C1
@ iir_initial.c:45: 		const short int C2 = 0x10C8;
	movw	r3, #4296	@ tmp153,
	strh	r3, [fp, #-22]	@ movhi	@ tmp152, C2
@ iir_initial.c:46: 		const short int C3 = 0x5FB7;
	movw	r3, #24503	@ tmp155,
	strh	r3, [fp, #-24]	@ movhi	@ tmp154, C3
@ iir_initial.c:47: 		const short int C4 = 0xDD28;//Negative representation
	movw	r3, #56616	@ tmp157,
	movt	r3, 65535	@ tmp157,
	strh	r3, [fp, #-26]	@ movhi	@ tmp156, C4
@ iir_initial.c:53: 		filter_init(X, Y);
	movw	r1, #:lower16:Y	@,
	movt	r1, #:upper16:Y	@,
	movw	r0, #:lower16:X	@,
	movt	r0, #:upper16:X	@,
	bl	filter_init		@
@ iir_initial.c:55: 		for (i =2; i< 128; i++){
	mov	r4, #2	@ i,
@ iir_initial.c:55: 		for (i =2; i< 128; i++){
	b	.L16		@
.L17:
@ iir_initial.c:62: 			tmp_0 = round_shift((int)C0 *(int)X[i] + (1<<14));
	ldrsh	r2, [fp, #-18]	@ _1, C0
@ iir_initial.c:62: 			tmp_0 = round_shift((int)C0 *(int)X[i] + (1<<14));
	movw	r3, #:lower16:X	@ tmp158,
	movt	r3, #:upper16:X	@ tmp158,
	lsl	r1, r4, #1	@ tmp159, i,
	add	r3, r3, r1	@ tmp160, tmp158, tmp159
	ldrsh	r3, [r3]	@ _2, X
@ iir_initial.c:62: 			tmp_0 = round_shift((int)C0 *(int)X[i] + (1<<14));
	mul	r3, r3, r2	@ _4, _3, _1
@ iir_initial.c:62: 			tmp_0 = round_shift((int)C0 *(int)X[i] + (1<<14));
	add	r3, r3, #16384	@ _5, _4,
	mov	r0, r3	@, _5
	bl	round_shift		@
	str	r0, [fp, #-32]	@, tmp_0
@ iir_initial.c:63: 			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
	ldrsh	r2, [fp, #-20]	@ _6, C1
@ iir_initial.c:63: 			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
	sub	r1, r4, #1	@ _7, i,
@ iir_initial.c:63: 			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
	movw	r3, #:lower16:X	@ tmp161,
	movt	r3, #:upper16:X	@ tmp161,
	lsl	r1, r1, #1	@ tmp162, _7,
	add	r3, r3, r1	@ tmp163, tmp161, tmp162
	ldrsh	r3, [r3]	@ _8, X
@ iir_initial.c:63: 			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
	mul	r3, r3, r2	@ _10, _9, _6
@ iir_initial.c:63: 			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
	add	r3, r3, #16384	@ _11, _10,
	mov	r0, r3	@, _11
	bl	round_shift		@
	str	r0, [fp, #-36]	@, tmp_1
@ iir_initial.c:64: 			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
	ldrsh	r2, [fp, #-22]	@ _12, C2
@ iir_initial.c:64: 			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
	sub	r1, r4, #2	@ _13, i,
@ iir_initial.c:64: 			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
	movw	r3, #:lower16:X	@ tmp164,
	movt	r3, #:upper16:X	@ tmp164,
	lsl	r1, r1, #1	@ tmp165, _13,
	add	r3, r3, r1	@ tmp166, tmp164, tmp165
	ldrsh	r3, [r3]	@ _14, X
@ iir_initial.c:64: 			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
	mul	r3, r3, r2	@ _16, _15, _12
@ iir_initial.c:64: 			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
	add	r3, r3, #16384	@ _17, _16,
	mov	r0, r3	@, _17
	bl	round_shift		@
	str	r0, [fp, #-40]	@, tmp_2
@ iir_initial.c:65: 			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
	ldrsh	r2, [fp, #-24]	@ _18, C3
@ iir_initial.c:65: 			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
	sub	r1, r4, #1	@ _19, i,
@ iir_initial.c:65: 			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
	movw	r3, #:lower16:Y	@ tmp167,
	movt	r3, #:upper16:Y	@ tmp167,
	lsl	r1, r1, #1	@ tmp168, _19,
	add	r3, r3, r1	@ tmp169, tmp167, tmp168
	ldrsh	r3, [r3]	@ _20, Y
@ iir_initial.c:65: 			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
	mul	r3, r3, r2	@ _22, _21, _18
@ iir_initial.c:65: 			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
	add	r3, r3, #16384	@ _23, _22,
	mov	r0, r3	@, _23
	bl	round_shift		@
	str	r0, [fp, #-44]	@, tmp_3
@ iir_initial.c:66: 			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));
	ldrsh	r2, [fp, #-26]	@ _24, C4
@ iir_initial.c:66: 			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));
	sub	r1, r4, #2	@ _25, i,
@ iir_initial.c:66: 			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));
	movw	r3, #:lower16:Y	@ tmp170,
	movt	r3, #:upper16:Y	@ tmp170,
	lsl	r1, r1, #1	@ tmp171, _25,
	add	r3, r3, r1	@ tmp172, tmp170, tmp171
	ldrsh	r3, [r3]	@ _26, Y
@ iir_initial.c:66: 			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));
	mul	r3, r3, r2	@ _28, _27, _24
@ iir_initial.c:66: 			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));
	add	r3, r3, #16384	@ _29, _28,
	mov	r0, r3	@, _29
	bl	round_shift		@
	str	r0, [fp, #-48]	@, tmp_4
@ iir_initial.c:68: 			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r2, [fp, #-32]	@ tmp173, tmp_0
	ldr	r3, [fp, #-36]	@ tmp174, tmp_1
	add	r2, r2, r3	@ _30, tmp173, tmp174
@ iir_initial.c:68: 			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-40]	@ tmp175, tmp_2
	add	r2, r2, r3	@ _31, _30, tmp175
@ iir_initial.c:68: 			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-44]	@ tmp176, tmp_3
	add	r2, r2, r3	@ _32, _31, tmp176
@ iir_initial.c:68: 			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	ldr	r3, [fp, #-48]	@ tmp177, tmp_4
	add	r3, r2, r3	@ _33, _32, tmp177
	mov	r0, r3	@, _33
	bl	short_int_clipping		@
	mov	r3, r0	@ tmp178,
	mov	r1, r3	@ _34, tmp178
@ iir_initial.c:68: 			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
	movw	r3, #:lower16:Y	@ tmp179,
	movt	r3, #:upper16:Y	@ tmp179,
	lsl	r2, r4, #1	@ tmp180, i,
	add	r3, r3, r2	@ tmp181, tmp179, tmp180
	strh	r1, [r3]	@ movhi	@ _34, Y
@ iir_initial.c:55: 		for (i =2; i< 128; i++){
	add	r4, r4, #1	@ i, i,
.L16:
@ iir_initial.c:55: 		for (i =2; i< 128; i++){
	cmp	r4, #127	@ i,
	ble	.L17		@,
@ iir_initial.c:42: 	for (run = 0; run <1000; run++){
	ldr	r3, [fp, #-16]	@ tmp183, run
	add	r3, r3, #1	@ tmp182, tmp183,
	str	r3, [fp, #-16]	@ tmp182, run
.L15:
@ iir_initial.c:42: 	for (run = 0; run <1000; run++){
	ldr	r3, [fp, #-16]	@ tmp184, run
	cmp	r3, #1000	@ tmp184,
	blt	.L18		@,
@ iir_initial.c:74: 	return 0;
	mov	r3, #0	@ _62,
@ iir_initial.c:76: }
	mov	r0, r3	@, <retval>
	sub	sp, fp, #8	@,,
	@ sp needed	@
	pop	{r4, fp, pc}	@
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits

#include <stdio.h>
#define ROUND_SHIFT(x) ((x)&0xFFFF ? ((x)|0x8000)>>15 : (x)>>15 ) 
#define SHORT_INT_CLIPPING(x) \
	((x) >= 32767) ? 32767 : (x); \
	((x) <= -32767) ? -32767 : (x); \

short int Y[128];

union{
	int Init[64];
	short int input[128];
} X;

void filter_init_better(int * restrict X, short int * restrict Y){
	register int i;
	X[0] = 0x80018001;
	
	//decrement because we don't have any order dependencies
	for(i = 63; i; i--){
		X[i] = 0x7FFF7FFF;
	}

	Y[0] = Y[1] = (short int)0x8001;
}

short int short_int_clipping(int a){
	int tmp = a;
	if(tmp >= 32767)
		tmp = 32767;
	if(tmp <= -32767)
		tmp = -32767;
	
	return (short int) tmp;
}

void print(int i){
	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
}

void main(){
	
	const short int C0 = 0x10C8;
	const short int C1 = 0x2190;
	const short int C2 = 0x10C8;
	const short int C3 = 0x5FB7;
	const short int C4 = 0xDD28;//Negative representation
	
	int tmp_0,tmp_1, tmp_2, tmp_3, tmp_4;
	
	register int i;
	
	filter_init_better(X.Init, Y);
	
	for (i =2; !(i&0x80); i+=2){
		register int Xi = X.input[i];
		register int Xi_minus_1 = X.input[i-1];	
		register int t2 = (int)C2 *(int)X.input[i-2] + (1<<14);
		tmp_2 = ROUND_SHIFT(t2);	
		register int Yi_minus_1 = Y[i-1];
		register int t4 = (int)C4 *(int)Y[i-2] + (1<<14);
		tmp_4 = ROUND_SHIFT(t4);
		
		//calculations
		register int t0 = (int)C0 *(int)Xi + (1<<14);
		tmp_0 = ROUND_SHIFT(t0);
		register int t1 = (int)C1 *(int)Xi_minus_1 + (1<<14);
		tmp_1 = ROUND_SHIFT(t1);
		register int t3 = (int)C3 *(int)Yi_minus_1 + (1<<14);
		tmp_3 = ROUND_SHIFT(t3);
		Y[i] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
		
		t0 = (int)C0 *(int)X.input[i+1] + (1<<14);
		tmp_0 = ROUND_SHIFT(t0);
		t1 = (int)C1 *(int)Xi + (1<<14);
		tmp_1 = ROUND_SHIFT(t1);
		t2 = (int)C2 *(int)Xi_minus_1 + (1<<14);
		tmp_2 = ROUND_SHIFT(t2);
		t3 = (int)C3 *(int)Y[i] + (1<<14);
		tmp_3 = ROUND_SHIFT(t3);
		t4 = (int)C4 *(int)Yi_minus_1 + (1<<14);
		tmp_4 = ROUND_SHIFT(t4);
		
		Y[i+1] = (short int) SHORT_INT_CLIPPING(tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
		
		print(i);
		print(i+1);
		
	}
	
}

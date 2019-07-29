#include <stdio.h>

short int Y[128];

union{
	int Init[64];
	short int input[128];
} X;

void filter_init_better(int *X, short int *Y){
	register int i;
	X[0] = 0x80018001;
	
	//decrement because we don't have any order dependencies
	for(i = 63; i; i--){
		X[i] = 0x7FFF7FFF;
	}

	Y[0] = Y[1] = (short int)0x8001;
}



void filter_init(short int *X, short int *Y){

	register int i;

	X[0] = X[1] = (short int) 0x8001;
	
	for(i =2; i<128; i++){
		//optimize by using a union of an array of 64 ints filled with 0x7FFF7FFF
		X[i] = (short int)0x7FFF;
	}
	Y[0] = Y[1] = (short int)0x8001;
	
}

void print(int i){
	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
}

void main(){

	//printf("Hello World\n");
	register const short int C0 = 0x10C8;
	register const short int C1 = 0x2190;
	register const short int C2 = 0x10C8;
	register const short int C3 = 0x5FB7;
	register const short int C4 = 0xDD28;//Negative representation
	
	int tmp_0,tmp_1, tmp_2, tmp_3, tmp_4;
	
	register int i;
	
	filter_init_better(X.Init, Y);
	
	for (i =2; i< 128; i+=2){
		//loading operations
		//not sure what (1<<14) is doing?
		int Xi = X.input[i];
		int Xi_minus_1 = X.input[i-1];		
		tmp_2 = ((int)C2 *(int)X.input[i-2] + (1<<14))>>15;	
		int Yi_minus_1 = Y[i-1];		
		tmp_4 = ((int)C0 *(int)Y.input[i-2] + (1<<14))>>15;
		
		//calculations
		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
						
		tmp_0 = ((int)C0 *(int)X.input[i+1] + (1<<14))>>15;
		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
		
		//storing operations
		Y[i] = (short int)( Yi);
		Y[i+1] = (short int)( Yi_plus_1);
		//The Y value is left as a fixed point value...
		//Currently has scale factor 2^15, but should switch to be 2^14
		//Need to shift y inputs of filter if doing so
		
	}
	/*printf("Outputting filter results\n");
	for(i = 0; i<128;i++){
		print(i);
	}*/
}

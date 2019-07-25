#include <stdio.h>

short int X[128], Y[128];

void filter_init(short int *X, short int *Y){

	register int i;

	X[0] = X[1] = (short int) 0x8001;
	
	for(i =2; i<100; i++){
		X[i] = (short int)0x7FFFF;
	}
	Y[0] = Y[1] = (short int)0x8001;
	
}

void print(int i){
	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
}

void main(){

	printf("Hello World\n");
	const short int C0 = 0x10C8;
	const short int C1 = 0x2190;
	const short int C2 = 0x10C8;
	const short int C3 = 0x5FB7;
	const short int C4 = 0xDD28;//Negative representation
	
	int tmp_0,tmp_1, tmp_2, tmp_3, tmp_4;
	
	register int i;
	
	filter_init(X, Y);
	
	for (i =2; i< 100; i+=2){
		//loading operations
		int Xi = X[i];
		int Xi_minus_1 = X[i-1];		
		tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;	
		int Yi_minus_1 = Y[i-1];		
		tmp_4 = ((int)C0 *(int)Y[i-2] + (1<<14))>>15;
		
		//calculations
		tmp_0 = ((int)C0 *(int)Xi + (1<<14))>>15;
		tmp_1 = ((int)C1 *(int)Xi_minus_1 + (1<<14))>>15;
		tmp_3 = ((int)C3 *(int)Yi_minus_1 + (1<<14))>>15;
		int Yi = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
						
		tmp_0 = ((int)C0 *(int)X[i+1] + (1<<14))>>15;
		tmp_1 = ((int)C1 *(int)Xi + (1<<14))>>15;
		tmp_2 = ((int)C2 *(int)Xi_minus_1 + (1<<14))>>15;
		tmp_3 = ((int)C3 *(int)Yi + (1<<14))>>15;
		tmp_4 = ((int)C0 *(int)Yi_minus_1 + (1<<14))>>15;
		int Yi_plus_1 = tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4;
		
		//storing operations
		Y[i] = (short int)( Yi);
		Y[i+1] = (short int)( Yi_plus_1);
		
	}
	
}

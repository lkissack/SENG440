#include <stdio.h>

short int X[128], Y[128];

void filter_init(short int *X, short int *Y){

	register int i;

	X[0] = X[1] = (short int) 0x8001;
	
	for(i =2; i<128; i++){
		X[i] = (short int)0x7FFF;
	}
	Y[0] = Y[1] = (short int)0x8001;
	
}

void print(int i){
	printf("Y[%2d]_=_%+6hi_=_%04hX_......._x[%2d]_=_%8.5f\n",i, Y[i], Y[i],i, ((float)Y[i])/32768);
}

short int short_int_clipping(int a){
	int tmp = a;
	if(tmp >= 32767)
		tmp = 32767;
	if(tmp <= -32767)
		tmp = -32767;
	
	return (short int) tmp;
}

int round_shift(int a){
	//printf("a: 0x%hX\n", a);
	if(a&0x7FFF)
		a|=0x8000;
	return a>>15;
}

int main(){

	int run;
	for (run = 0; run <1000; run++){
		const short int C0 = 0x10C8;
		const short int C1 = 0x2190;
		const short int C2 = 0x10C8;
		const short int C3 = 0x5FB7;
		const short int C4 = 0xDD28;//Negative representation

		int tmp_0,tmp_1, tmp_2, tmp_3, tmp_4;

		register int i;

		filter_init(X, Y);

		for (i =2; i< 128; i++){
			/*tmp_0 = ((int)C0 *(int)X[i] + (1<<14))>>15;
			tmp_1 = ((int)C1 *(int)X[i-1] + (1<<14))>>15;
			tmp_2 = ((int)C2 *(int)X[i-2] + (1<<14))>>15;
			tmp_3 = ((int)C3 *(int)Y[i-1] + (1<<14))>>15;
			tmp_4 = ((int)C4 *(int)Y[i-2] + (1<<14))>>15;*/

			tmp_0 = round_shift((int)C0 *(int)X[i] + (1<<14));
			tmp_1 = round_shift((int)C1 *(int)X[i-1] + (1<<14));
			tmp_2 = round_shift((int)C2 *(int)X[i-2] + (1<<14));
			tmp_3 = round_shift((int)C3 *(int)Y[i-1] + (1<<14));
			tmp_4 = round_shift((int)C4 *(int)Y[i-2] + (1<<14));

			Y[i] = short_int_clipping( tmp_0 +tmp_1 + tmp_2 + tmp_3 + tmp_4);
			//print(i);
		}
	}
	
	
	return 0;
	
}

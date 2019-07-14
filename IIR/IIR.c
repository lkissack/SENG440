#include <stdio.h>


#define SAMPLES 3

//switch to fixed point
uint8_t Coeff[4] = {0.01311, 0.26222, 0.74778, -0.27221}

int IIR(int x[SAMPLES], int y[SAMPLES]){

	int next_out;
	//switch all these values to fixed point

	y[2] = Coeff[0]*x[2] +Coeff[1]*x[1] + Coeff[2]*x[0] + Coeff[3]*y[0] + Coeff*y[1];

}



int main(){

	int output [3] = {0,0,0};

	int input [3];

	return 0;
}

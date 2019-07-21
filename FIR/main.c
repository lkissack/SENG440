#include <stdio.h>
#include <stdlib.h>


#define MAX_INPUT_LENGTH 80	//max number of input samples that can be handled per function call
#define MAX_FILT_LENGTH  63	//max filter length that can be hanled per function call	
#define BUFF_LEN	60
#define upper_limit 0x3fffffff
#define lower_limit -0x40000000

int input[ BUFF_LEN ]; //16 bit, any point in specifying size?

//FIR init

//initialize memory space?


void FIR(int *filter_coeffs, int *input, int *output, int length, int filt_length)
{
	int acc; //temporary accumulator for MAC operationv (32bit for 16bit input and 16bit for 8bit variables)
	int *h;	//pointer to filter coefficients
	int *x; //pointer to input samples

	//copy the samples out of memory into the buffer?

	for (int n = 0; n<length; n++)
	{
	h=filter_coeffs;
	x=input[filt_length - 1 + n];	//use memset??
	acc = 1 << 14; //load rounding constant, what does this mean and how does it relate to input size?

		for (int k; k<filt_length; k++)
		{
			acc += (int32_t)(*h++)*(int32_t)(x--);
		}

		if( acc > upper_limit){
			acc=upper_limit;
		} else if (acc < lower_limit) {
			acc=lower_limit;
		}
		output[n] = acc>>15;
	
		}

//memove to shift samples 

}

void main()
{
	
}
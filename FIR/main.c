#include <stdio.h>
#include <stdlib.h>
#include <string.h>
//#include <iostream>

#define MAX_INPUT_LENGTH 800    //max number of input samples that can be handled per function call
#define FILT_LENGTH  500    //max filter length that can be hanled per function call    
#define BUFF_LEN    (FILT_LENGTH - 1 + MAX_INPUT_LENGTH)
#define SAMPLES   800
#define upper_limit 0x3fffffff//
#define lower_limit -0x40000000//

int16_t coeffs[ FILT_LENGTH ] =
{
 -1,6,-1,6,-1,6,-1,6,-1,6,-1,6,-1,6,-2,6,-2,6,-2,6,-3,6,-3,6,-4,6,-4,5,-5,5,-6,5,-6,5,-7,4,-8,4,-10,3,-11,2,-12,2,-14,1,-15,0,-17,-1,-19,-2,-21,-3,-23,-4,-25,-5,-27,-6,-29,-7,-32,-9,-34,-10,-36,-11,-39,-12,-41,-13,-44,-14,-46,-15,-48,-15,-50,-16,-52,-16,-54,-16,-56,-16,-57,-16,-58,-15,-59,-14,-60,-12,-61,-10,-61,-8,-60,-6,-60,-3,-59,1,-58,5,-56,9,-54,14,-51,20,-48,25,-45,32,-41,38,-38,46,-33,53,-29,61,-24,70,-19,78,-13,87,-8,96,-2,106,3,115,9,125,15,135,20,145,25,154,30,164,35,173,40,182,44,191,47,200,50,208,52,216,54,223,54,229,54,236,53,241,51,246,48,250,45,253,39,255,33,257,26,258,18,259,8,258,-3,257,-15,256,-28,253,-43,250,-59,247,-75,244,-94,240,-113,236,-134,232,-155,228,-178,224,-203,221,-228,218,-255,216,-283,216,-312,217,-343,219,-376,224,-411,232,-448,243,-488,258,-532,278,-580,304,-634,339,-695,384,-767,443,-854,522,-963,630,-1106,783,-1304,1012,-1602,1386,-2113,2096,-3200,3949,-7176,20638,20638,-7176,3949,-3200,2096,-2113,1386,-1602,1012,-1304,783,-1106,630,-963,522,-854,443,-767,384,-695,339,-634,304,-580,278,-532,258,-488,243,-448,232,-411,224,-376,219,-343,217,-312,216,-283,216,-255,218,-228,221,-203,224,-178,228,-155,232,-134,236,-113,240,-94,244,-75,247,-59,250,-43,253,-28,256,-15,257,-3,258,8,259,18,258,26,257,33,255,39,253,45,250,48,246,51,241,53,236,54,229,54,223,54,216,52,208,50,200,47,191,44,182,40,173,35,164,30,154,25,145,20,135,15,125,9,115,3,106,-2,96,-8,87,-13,78,-19,70,-24,61,-29,53,-33,46,-38,38,-41,32,-45,25,-48,20,-51,14,-54,9,-56,5,-58,1,-59,-3,-60,-6,-60,-8,-61,-10,-61,-12,-60,-14,-59,-15,-58,-16,-57,-16,-56,-16,-54,-16,-52,-16,-50,-15,-48,-15,-46,-14,-44,-13,-41,-12,-39,-11,-36,-10,-34,-9,-32,-7,-29,-6,-27,-5,-25,-4,-23,-3,-21,-2,-19,-1,-17,0,-15,1,-14,2,-12,2,-11,3,-10,4,-8,4,-7,5,-6,5,-6,5,-5,5,-4,6,-4,6,-3,6,-3,6,-2,6,-2,6,-2,6,-1,6,-1,6,-1,6,-1,6,-1,6,-1,6,-1
};
 

int16_t insamp[ BUFF_LEN ]; //16 bit, any point in specifying size?


// FIR init
void FIR_Init( void )
{
    memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
}



void FIR(int16_t *filter_coeffs, int16_t *input, int16_t *output, int length) //ints are 16bit define as such?
{

    
    register int32_t acc; //temporary accumulator for MAC operationv (32bit for 16bit input and 16bit for 8bit variables)
    register int n,k = 0;
    register int16_t *h; //pointer to filter coefficients
    register int16_t *x; //pointer to input samples
    register int32_t temp1 = 0;
    register int32_t temp2 = 0;
  
//copy the samples out of memory into the buffer   
 memcpy( &insamp[FILT_LENGTH - 1], input, length * sizeof(int16_t));


    for (n = 0; n<length; n++)
    {
    h=filter_coeffs;
    x=&insamp[FILT_LENGTH - 1 + n]; //assign address of sample

    acc = (1 << 14);// preload rounding constant

	temp1 = (int32_t)(*h++)*(int32_t)(*x--);
	temp2 = (int32_t)(*h++)*(int32_t)(*x--);
	//temp1 += (1<<6); //rounding 
    //temp1 >>= 7;
  

        for (k = 0; k < ((FILT_LENGTH)>>3); k++)
        {  
            acc += temp1;
            acc += temp2;

            temp1 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
            
            //temp2 += (1<<4); //rounding 
            //temp2 >>= 5;     //shift

            temp2 = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
            
            //temp1 += (1<<4); //rounding 
            //temp1 >>= 5;     //shift

            //acc = acc + temp1;
           temp1 += (int32_t)(*h++)*(int32_t)(*x--);
            //temp2 += (1<<4); //rounding 
            //temp2 >>= 5;     //shift

            //acc = acc + temp2;
           temp2 += (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
            
           // temp1 += (1<<4); //rounding 
            //temp1 >>= 5;     //shift
           temp1 += (int32_t)(*h++)*(int32_t)(*x--);
            //temp2 += (1<<4); //rounding 
            //temp2 >>= 5;     //shift

            //acc = acc + temp2;
           temp2 += (int32_t)(*h++)*(int32_t)(*x--);
            temp1 += (int32_t)(*h++)*(int32_t)(*x--);
            //temp2 += (1<<4); //rounding 
            //temp2 >>= 5;     //shift

            //acc = acc + temp2;
           temp2 += (int32_t)(*h++)*(int32_t)(*x--);

        }
        
        acc += temp1;
        acc += temp2;


       /*  if( acc > upper_limit){ //check if accumulator has saturated
            acc=upper_limit;
        } else if (acc < lower_limit) {
            acc=lower_limit;
        }*/
        
        output[n] = (int16_t)(acc>>15);//convert to 16 bit
        }

//memove to shift samples to bottom of buffer
 memmove(&insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t) );
}

int main( void )
{
    int size;
    int16_t input[SAMPLES];
    int16_t output[SAMPLES];
    FILE   *in_fid;
    FILE   *out_fid;
 
    // open the input waveform file
    in_fid = fopen( "noisy.wav", "rb" );
    if ( in_fid == 0 ) {
        printf("couldn't open input file");
        exit(EXIT_FAILURE);
    }
 
    // open the output waveform file
    out_fid = fopen( "outputFIR.wav", "wb" );
    if ( out_fid == 0 ) {
        printf("couldn't open output file");
        exit(EXIT_FAILURE);
    }
 
    // initialize the filter
    FIR_Init();
 
    // process all of the samples
    do {
        // read samples from file
        size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
        // perform the filtering
        FIR( coeffs, input, output, size);
        // write samples to file
        fwrite( output, sizeof(int16_t), size, out_fid );
    } while ( size != 0 );
 
    fclose( in_fid );
    fclose( out_fid );
    
    printf("Filtering Complete \n");
    //printf("%d \n",(int)sizeof(coeffs));


    return 0;
}
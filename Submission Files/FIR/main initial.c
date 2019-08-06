#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_INPUT_LENGTH 800    //max number of input samples that can be handled per function call
#define FILT_LENGTH  500    //max filter length that can be hanled per function call    
#define BUFF_LEN    (FILT_LENGTH - 1 + MAX_INPUT_LENGTH)
#define SAMPLES   800

int16_t coeffs[ FILT_LENGTH ] =
{
500 FILTER TAPS GO HERE (REMOVED) 
}
 
int16_t insamp[ BUFF_LEN ]; //16 bit, any point in specifying size?


// FIR init
void FIR_Init( void )
{
    memset( insamp, 0, sizeof( insamp ) );//initiate space in memory
}


void FIR(int16_t *filter_coeffs, int16_t *input, int16_t *output, int length, int filt_length) //ints are 16bit define as such?
{
    int n, k;
    int32_t acc;
    int32_t temp; //temporary accumulator for MAC operation
    int16_t *h; //pointer to filter coefficients
    int16_t *x; //pointer to input samples
   
    //copy the samples out of memory into the top of the buffer
    memcpy( &insamp[filt_length - 1], input, length * sizeof(int16_t)); 

    for (n = 0; n<length; n++)
    {
    h=filter_coeffs;                
    x=&insamp[filt_length - 1 + n]; //assign address of sample
   
        for (k = 0; k<filt_length; k++)
        {
            temp = (int32_t)(*h++)*(int32_t)(*x--); //perform multiplication and add to accumulator
            temp = temp + (1<<6); //rounding 
            temp = (temp>>7);           //shift
            acc = acc + temp;     //accumulate
        }
        acc = acc + (1 << 14);
        output[n] = (int16_t)(acc>>15);//convert to Q15, 16 bit
        }

//memove to shift samples back in buffer
 memmove(&insamp[0], &insamp[length], (filt_length - 1) * sizeof(int16_t) );
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
 
    // initialize the memory space for the filter buffer 
    FIR_Init();
 
    // process all of the samples
    do {
        // read samples from input file
        size = fread( input, sizeof(int16_t), SAMPLES, in_fid );
        // apply filtering to input
        FIR( coeffs, input, output, size, FILT_LENGTH );
        // write samples to output file
        fwrite( output, sizeof(int16_t), size, out_fid );
    } while ( size != 0 );
 
    fclose( in_fid );
    fclose( out_fid );
    
    printf("Filtering Complete \n");

    return 0;
}

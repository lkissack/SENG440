#include <stdio.h>
#include <stdlib.h>
#include <string.h>


# define MAX_INPUT_LENGTH 800 //max number of input samples that can be handled per function call
# define FILT_LENGTH 500 //max filter length that can be hanled per function call    
# define BUFF_LEN (FILT_LENGTH - 1 + MAX_INPUT_LENGTH)
# define SAMPLES 800

int16_t output[SAMPLES];
int16_t input[SAMPLES];




int16_t insamp[BUFF_LEN]; //16 bit, any point in specifying size?
int16_t coeffs[FILT_LENGTH] = {
  500 FILTER TAPS GO HERE (REMOVED)
};





// FIR init
void FIR_Init(void) {
  memset(insamp, 0, sizeof(insamp)); //initiate space in memory
}

void FIR(int length) //ints are 16bit define as such?
{

  register int32_t acc; //temporary accumulator for MAC operationv (32bit for 16bit input and 16bit for 8bit variables)
  register int n, k = 0;
  register int16_t *h; //pointer to filter coefficients
  register int16_t *x; //pointer to input samples
  register int32_t temp1 = 0;
  register int32_t temp2 = 0;

  //copy the samples out of memory into the buffer   
  memcpy( &insamp[FILT_LENGTH - 1], input, length * sizeof(int16_t));

  for (n = 0; n < length; n++) {
    h = coeffs;
    x = &insamp[FILT_LENGTH - 1 + n]; //assign address of sample

    acc = (1 << 10); // preload rounding constant

    temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
    temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
   
    temp1 += (int32_t)( *h++) * (int32_t)( *x--);
    temp2 += (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
  
    temp1 += (int32_t)( *h++) * (int32_t)( *x--);
    temp2 += (int32_t)( *h++) * (int32_t)( *x--);

    temp1 += (int32_t)( *h++) * (int32_t)( *x--);
    temp2 += (int32_t)( *h++) * (int32_t)( *x--);



    for (k = ((FILT_LENGTH >> 3) - 1); k > 0; k--) {

      acc += temp1;
      acc += temp2;

      temp1 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator
      temp2 = (int32_t)( *h++) * (int32_t)( *x--); //perform multiplication and add to accumulator

      temp1 += (int32_t)( *h++) * (int32_t)( *x--);
      temp2 += (int32_t)( *h++) * (int32_t)( *x--); 
    
      temp1 += (int32_t)( *h++) * (int32_t)( *x--);
      temp2 += (int32_t)( *h++) * (int32_t)( *x--);  

      temp1 += (int32_t)( *h++) * (int32_t)( *x--);
      temp2 += (int32_t)( *h++) * (int32_t)( *x--);

      temp1 += (1 << 7); //rounding 
      temp1 >>= 6; //shift
      temp2 += (1 << 7); //rounding 
      temp2 >>= 6; //shift

    }

    acc += temp1;
    acc += temp2;

    output[n] = (int16_t)(acc >> 9); //convert to 16 bit
  }

  //memove to shift samples to bottom of buffer
  memmove( &insamp[0], &insamp[length], (FILT_LENGTH - 1) * sizeof(int16_t));
}

int main(void) {
 
  int size;

  FILE *in_fid;
  FILE *out_fid;

  // open the input waveform file
  in_fid = fopen("noisy.wav", "rb");
  if (in_fid == 0) {
    printf("couldn't open input file");
    exit(EXIT_FAILURE);
  }

  // open the output waveform file
  out_fid = fopen("outputFIR.wav", "wb");
  if (out_fid == 0) {
    printf("couldn't open output file");
    exit(EXIT_FAILURE);
  }

  // initialize the filter
  FIR_Init();

  // process all of the samples
  do {
    // read samples from file
    size = fread(input, sizeof(int16_t), SAMPLES, in_fid);
    // perform the filtering
    FIR(size);
    // write samples to file
    fwrite(output, sizeof(int16_t), size, out_fid);
  } while (size != 0);

  fclose(in_fid);
  fclose(out_fid);

  printf("Filtering Complete \n");
  //printf("%d \n",(int)sizeof(coeffs));

  return 0;
}

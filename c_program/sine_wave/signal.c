
ioport unsigned port0bfff;

#define IOSR port0bfff
#define COSX 0.999390827

#pragma DATA_SECTION(cosx,"data_buf1")
float cosx[200];
#pragma DATA_SECTION(dacdata,"data_buf2")
int dacdata[200];
unsigned int i;

void delay(void);
void main(void)
{
	cosx[0]=1.000;
	dacdata[0]=4095;
	cosx[1]=COSX;
	dacdata[1]=COSX*2047+2048;
	for(i=2;i<200;i++)
	{ 
    	cosx[i]=2*COSX*cosx[i-1]-cosx[i-2];
     	dacdata[i]=cosx[i]*2047+2048;
     	IOSR=dacdata[i];
     	//delay();
  	}
}

void delay(void)
{
	long int j;
	for(j=0;j<65536;j++)
		asm("	NOP");
}




ioport unsigned port0bfff;						//��������˿�

#define IOSR port0bfff
#define COSX 0.999390827						//cos(pi/180)�Ĵ�С

#pragma DATA_SECTION(cosx,"data_buf1")			//��data_buf1��Ϊcosx�������ݿռ�
float cosx;
#pragma DATA_SECTION(dacdata,"data_buf2")		//��data_buf2��Ϊdacdata�������ݿռ�
int dacdata;
unsigned int i;

void delay(void);
void main(void)
{
	float temp1,temp2;
	temp1=1.000;
	temp2=COSX;	
	while(1)
	{ 
    	cosx=2*COSX*temp2-temp1;				//����cosx��ֵ
     	dacdata=cosx*2047+2048;					//��cosx��ֵ�Ŵ���λ
     	IOSR=dacdata;							//���cosx��ֵ
     	temp1=temp2;
     	temp2=cosx;
     	delay();								//��ʱ
  	}
}

void delay(void)
{
	long int j;
	for(j=0;j<1000;j++)
		asm("	NOP");
}




ioport unsigned port0bfff;				//��������˿�
#define IOSR port0bfff

void delay(void);
void main(void)
{
	while(1)
	{	IOSR=0;							//���0
		delay();						//��ʱ
		IOSR=4095;						//���1
		delay();						//��ʱ
	}			
}

void delay(void)
{
	long int j;
	for(j=0;j<10000;j++)
		asm("	NOP");
}

		

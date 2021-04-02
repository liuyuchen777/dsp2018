
ioport unsigned port0bfff;				//定义输出端口
#define IOSR port0bfff

void delay(void);
void main(void)
{
	while(1)
	{	IOSR=0;							//输出0
		delay();						//延时
		IOSR=4095;						//输出1
		delay();						//延时
	}			
}

void delay(void)
{
	long int j;
	for(j=0;j<10000;j++)
		asm("	NOP");
}

		

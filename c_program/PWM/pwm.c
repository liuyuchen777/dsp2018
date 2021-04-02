
ioport unsigned port0bfff;				//定义输出端口
#define IOSR port0bfff

void delay(void);
void main(void)
{	long j;
	while(1)
	{	IOSR=0;							//占空比15:1
		for(j=0;j<4000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<60000;j++)
		asm("	NOP");
		IOSR=0;							//占空比14:2
		for(j=0;j<8000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<56000;j++)
		asm("	NOP");
		IOSR=0;							//占空比13:3
		for(j=0;j<12000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<52000;j++)
		asm("	NOP");
		IOSR=0;							//占空比12:4
		for(j=0;j<16000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<48000;j++)
		asm("	NOP");
		IOSR=0;							//占空比11:5
		for(j=0;j<20000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<44000;j++)
		asm("	NOP");
		IOSR=0;							//占空比10:6
		for(j=0;j<24000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<40000;j++)
		asm("	NOP");
		IOSR=0;							//占空比9:7
		for(j=0;j<28000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<36000;j++)
		asm("	NOP");
		IOSR=0;							//占空比8:8
		for(j=0;j<32000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<32000;j++)
		asm("	NOP");
		IOSR=0;							//占空比7:9
		for(j=0;j<36000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<28000;j++)
		asm("	NOP");
		IOSR=0;							//占空比6:10
		for(j=0;j<40000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<24000;j++)
		asm("	NOP");
		IOSR=0;							//占空比5:11
		for(j=0;j<44000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<20000;j++)
		asm("	NOP");
		IOSR=0;							//占空比4:12
		for(j=0;j<48000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<16000;j++)
		asm("	NOP");
		IOSR=0;							//占空比3:13
		for(j=0;j<52000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<12000;j++)
		asm("	NOP");
		IOSR=0;							//占空比2:14
		for(j=0;j<56000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<8000;j++)
		asm("	NOP");
		IOSR=0;							//占空比1:15
		for(j=0;j<60000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<4000;j++)
		asm("	NOP");
	}			
}


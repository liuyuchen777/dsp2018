
ioport unsigned port0bfff;				//��������˿�
#define IOSR port0bfff

void delay(void);
void main(void)
{	long j;
	while(1)
	{	IOSR=0;							//ռ�ձ�15:1
		for(j=0;j<4000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<60000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�14:2
		for(j=0;j<8000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<56000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�13:3
		for(j=0;j<12000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<52000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�12:4
		for(j=0;j<16000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<48000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�11:5
		for(j=0;j<20000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<44000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�10:6
		for(j=0;j<24000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<40000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�9:7
		for(j=0;j<28000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<36000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�8:8
		for(j=0;j<32000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<32000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�7:9
		for(j=0;j<36000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<28000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�6:10
		for(j=0;j<40000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<24000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�5:11
		for(j=0;j<44000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<20000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�4:12
		for(j=0;j<48000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<16000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�3:13
		for(j=0;j<52000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<12000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�2:14
		for(j=0;j<56000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<8000;j++)
		asm("	NOP");
		IOSR=0;							//ռ�ձ�1:15
		for(j=0;j<60000;j++)
		asm("	NOP");
		IOSR=4095;
		for(j=0;j<4000;j++)
		asm("	NOP");
	}			
}


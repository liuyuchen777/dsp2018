//FIR 17阶 fl=1500 fs=8000
ioport unsigned port7FFF;						//定义AD端口
ioport unsigned port0BFFF;						//定义DA端口
ioport unsigned port0FFFE;						//定义其它端口
ioport unsigned port0FFFF;
#define ADR port7FFF
#define DAW port0BFFF
#define TEMPIO port0FFFE
#define TEMPIO2 port0FFFF
interrupt void int_handler(void);
unsigned int temp1;
#pragma DATA_SECTION(input,"data_buf1")		//在data_buf1段为intemp分配数据空间
float input[17] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
#pragma DATA_SECTION(h,"data_buf2")		//在data_buf2段为outtemp分配数据空间
float h[17] = {0,158,263,-290,-1406,-951,3186,9287,12272,9287,3186,-951,-1406,-290,263,158,0};

void main(void)
{	unsigned int temp;
	int k;
	asm("	LD		#1c60h,A");					//重新映射中断向量的变量
	asm("	NOP");
	asm("	NOP");
	asm("	NOP");
	asm("	STLM	A,PMST");
	asm("	NOP");
	asm("	NOP");
	asm("	NOP");

	asm("	STM     #0010h,TCR");	
	asm("	NOP");
	asm("	NOP");
	asm("	STM		#02EEh,PRD");	
	asm("	NOP");
	asm("	NOP");
	asm("	STM     #0029h,TCR");   
	asm("	NOP");
	asm("	NOP");
	asm("	STM		#0008h,IMR");	
	asm("	NOP");
	asm("	NOP");

	asm("	SSBX	INTM");						//屏蔽中断
	temp=TEMPIO;								//读别的端口使A/D转换器的CS位高
	for(k=0;k<5;k++)
		k=k;
	temp=128;
	for(k=0;k<2;k++)
		k=k;
	ADR=temp;									//写A/D转换器的寄存器CR0
	for(k=0;k<5;k++)
		k=k;
	temp=256;
	for(k=0;k<2;k++)
		k=k;
	ADR=temp;									//写A/D转换器的寄存器CR1
	temp=TEMPIO2;								//读别的端口,使A/D转换器的CS为高
	for(k=0;k<5;k++)
		k=k;
	asm("	RSBX	INTM");						//开启中断
	while(1)
		k=k;
}		
	
interrupt void int_handler(void)				//中断服务程序
{	
	unsigned int temp;
	int i;
	asm("	RSBX	XF");						//发出读信号,A/D转换器收到后开始下一次采样
	temp=ADR;									//读A/D转换数据
	asm("	SSBX	XF");						//制高读信号
	temp1=TEMPIO2;								//读别的端口,使A/D转换器的CS为高
	for(i=0;i<16;i++)
	{
		input[i]=input[i+1];
	}
	input[16]=(float)temp;
	temp=0;
	for(i=0;i<=16;i++)
	{
		temp+=input[i]*h[16-i]/32768;
	}
	DAW=(int)temp;									//从D/A转换器输出
}


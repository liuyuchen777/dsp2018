
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
#pragma DATA_SECTION(intemp,"data_buf1")		//在data_buf1段为intemp分配数据空间
float intemp[4];
#pragma DATA_SECTION(outtemp,"data_buf2")		//在data_buf2段为outtemp分配数据空间
float outtemp[4];

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
	asm("	STM		#1,IMR");					//中断设置
	asm("	STM		#0,IFR");
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
	asm("	RSBX	XF");						//发出读信号,A/D转换器收到后开始下一次采样
	temp=ADR;									//读A/D转换数据
	intemp[3]=(float)temp;						//转换数制赋给intemp[3]
	temp1=TEMPIO2;								//读别的端口,使A/D转换器的CS为高
	outtemp[3]=0.3236*intemp[3]+0.9707*intemp[2]+0.9707*intemp[1]+0.3236*intemp[0]-0.9215*outtemp[2]-0.6422*outtemp[1]-0.0247*outtemp[0];		//计算
	DAW=(int)outtemp[3];						//从D/A转换器输出
	intemp[0]=intemp[1];						//数据易位，把最早的数据丢掉
	intemp[1]=intemp[2];
	intemp[2]=intemp[3];
	outtemp[0]=outtemp[1];
	outtemp[1]=outtemp[2];
	outtemp[2]=outtemp[3];
	asm("	SSBX	XF");						//制高读信号
}


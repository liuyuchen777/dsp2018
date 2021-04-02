//FIR 17�� fl=1500 fs=8000
ioport unsigned port7FFF;						//����AD�˿�
ioport unsigned port0BFFF;						//����DA�˿�
ioport unsigned port0FFFE;						//���������˿�
ioport unsigned port0FFFF;
#define ADR port7FFF
#define DAW port0BFFF
#define TEMPIO port0FFFE
#define TEMPIO2 port0FFFF
interrupt void int_handler(void);
unsigned int temp1;
#pragma DATA_SECTION(input,"data_buf1")		//��data_buf1��Ϊintemp�������ݿռ�
float input[17] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
#pragma DATA_SECTION(h,"data_buf2")		//��data_buf2��Ϊouttemp�������ݿռ�
float h[17] = {0,158,263,-290,-1406,-951,3186,9287,12272,9287,3186,-951,-1406,-290,263,158,0};

void main(void)
{	unsigned int temp;
	int k;
	asm("	LD		#1c60h,A");					//����ӳ���ж������ı���
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

	asm("	SSBX	INTM");						//�����ж�
	temp=TEMPIO;								//����Ķ˿�ʹA/Dת������CSλ��
	for(k=0;k<5;k++)
		k=k;
	temp=128;
	for(k=0;k<2;k++)
		k=k;
	ADR=temp;									//дA/Dת�����ļĴ���CR0
	for(k=0;k<5;k++)
		k=k;
	temp=256;
	for(k=0;k<2;k++)
		k=k;
	ADR=temp;									//дA/Dת�����ļĴ���CR1
	temp=TEMPIO2;								//����Ķ˿�,ʹA/Dת������CSΪ��
	for(k=0;k<5;k++)
		k=k;
	asm("	RSBX	INTM");						//�����ж�
	while(1)
		k=k;
}		
	
interrupt void int_handler(void)				//�жϷ������
{	
	unsigned int temp;
	int i;
	asm("	RSBX	XF");						//�������ź�,A/Dת�����յ���ʼ��һ�β���
	temp=ADR;									//��A/Dת������
	asm("	SSBX	XF");						//�Ƹ߶��ź�
	temp1=TEMPIO2;								//����Ķ˿�,ʹA/Dת������CSΪ��
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
	DAW=(int)temp;									//��D/Aת�������
}


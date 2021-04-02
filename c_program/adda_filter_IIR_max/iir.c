
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
#pragma DATA_SECTION(intemp,"data_buf1")		//��data_buf1��Ϊintemp�������ݿռ�
float intemp[4];
#pragma DATA_SECTION(outtemp,"data_buf2")		//��data_buf2��Ϊouttemp�������ݿռ�
float outtemp[4];

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
	asm("	STM		#1,IMR");					//�ж�����
	asm("	STM		#0,IFR");
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
	asm("	RSBX	XF");						//�������ź�,A/Dת�����յ���ʼ��һ�β���
	temp=ADR;									//��A/Dת������
	intemp[3]=(float)temp;						//ת�����Ƹ���intemp[3]
	temp1=TEMPIO2;								//����Ķ˿�,ʹA/Dת������CSΪ��
	outtemp[3]=0.3236*intemp[3]+0.9707*intemp[2]+0.9707*intemp[1]+0.3236*intemp[0]-0.9215*outtemp[2]-0.6422*outtemp[1]-0.0247*outtemp[0];		//����
	DAW=(int)outtemp[3];						//��D/Aת�������
	intemp[0]=intemp[1];						//������λ������������ݶ���
	intemp[1]=intemp[2];
	intemp[2]=intemp[3];
	outtemp[0]=outtemp[1];
	outtemp[1]=outtemp[2];
	outtemp[2]=outtemp[3];
	asm("	SSBX	XF");						//�Ƹ߶��ź�
}


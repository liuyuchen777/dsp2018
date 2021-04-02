
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
float intemp[21];
#pragma DATA_SECTION(outtemp,"data_buf2")		//��data_buf2��Ϊouttemp�������ݿռ�
float outtemp;

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
	intemp[20]=(float)temp;						//ת�����Ƹ���intemp[20]
	temp1=TEMPIO2;								//����Ķ˿�,ʹA/Dת������CSΪ��
	outtemp=0.0002*intemp[20]-0.0106*intemp[19]-0.0181*intemp[18]-0.0236*intemp[17]\
		   -0.0189*intemp[16]+0.0021*intemp[15]+0.0408*intemp[14]+0.0919*intemp[13]\
		   +0.1441*intemp[12]+0.1832*intemp[11]+0.1978*intemp[10]+0.1832*intemp[9]\
		   +0.1441*intemp[8]+0.0919*intemp[7]+0.0408*intemp[6]-0.0021*intemp[5]\
		   -0.0189*intemp[4]-0.0236*intemp[3]-0.0181*intemp[2]-0.0106*intemp[1]\
		   +0.0002*intemp[0];
	temp1=(int)(outtemp);						//��D/Aת�������
	DAW=temp1;
	intemp[0]=intemp[1];						//������λ������������ݶ���
	intemp[1]=intemp[2];
	intemp[2]=intemp[3];
	intemp[3]=intemp[4];
	intemp[4]=intemp[5];
	intemp[5]=intemp[6];
	intemp[6]=intemp[7];
	intemp[7]=intemp[8];
	intemp[8]=intemp[9];
	intemp[9]=intemp[10];
	intemp[10]=intemp[11];
	intemp[11]=intemp[12];
	intemp[12]=intemp[13];
	intemp[13]=intemp[14];
	intemp[14]=intemp[15];
	intemp[15]=intemp[16];
	intemp[16]=intemp[17];
	intemp[17]=intemp[18];
	intemp[18]=intemp[19];
	intemp[19]=intemp[20];
	asm("	SSBX	XF");						//�Ƹ߶��ź�
}


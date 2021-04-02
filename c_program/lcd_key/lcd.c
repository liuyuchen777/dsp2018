#include "lcd.h"

void delayLcd(int times){

	int i,j;
	for(i=0; i<times;++i){
		for(j=0;j<times;++j);
	}	

}

void lcdWrite(unsigned char comm, unsigned char data){

	if(comm){
		CMD = data;
	}else{
		DATA = data;
	}

	delayLcd(50);

}


void initLcd(){
	int i;

	// �����ı�����ʼ��ַ
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x00);
	lcdWrite(1, TXHOME);

	// ����ͼ������ʼ��ַ
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x02);
	lcdWrite(1, GRHOME);

	// �����ı������
	lcdWrite(0, 0x10);
	lcdWrite(0, 0x00);
	lcdWrite(1, TXAREA);

	// ����ͼ�������
	lcdWrite(0, 0x10);
	lcdWrite(0, 0x00);
	lcdWrite(1, GRAREA);

	// ���ù�������
	lcdWrite(1, CURSOR);

	// ����ģʽ ����
	lcdWrite(1, MODE);

	// ������ʾģʽ
	lcdWrite(1, DISPMODE);


	// ����ı���
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x00);
	lcdWrite(1, ADPSET);

	// ���Զ�д
	lcdWrite(1, AWRON);

	for(i=0; i<128; ++i){
		lcdWrite(0,0x00);
	}
	lcdWrite(1, AWROFF);

	// ���ͼ����

	lcdWrite(0, 0x00);
	lcdWrite(0, 0x02);
	lcdWrite(1, ADPSET);
	lcdWrite(1, AWRON);

	for(i=0; i<1280; ++i){
		lcdWrite(0, 0x00);
	}
	lcdWrite(1, AWROFF);
	
}

void lcdDisplayStr(unsigned char str[], unsigned char size){
	int i;

	lcdWrite(0, 0x35);
	lcdWrite(0, 0x00);
	lcdWrite(1, ADPSET);
	lcdWrite(1, AWRON);


	for(i=0; i<size; ++i){
		lcdWrite(0, str[i]);
	}
	lcdWrite(1, AWROFF);
}






#include "ledkey.h"

void delayLed(int times){

	int i,j;
	for(i=0; i<times;++i){
		for(j=0;j<times;++j);
	}	

}


// comm = 1, dataΪָ�� �� comm = 0��dataΪ����
void ledWrite(unsigned char comm, unsigned char data){
	if(comm){
		LEDCMD = data;
	}else{
		LEDDATA = data;
	}
	delayLed(50);
}

unsigned char ledRead(){

	unsigned char ch ;

	ch = LEDDATA;
	delayLed(50);

	return ch;

}

// ��ʼ��7279�������
void initLedkey(){

	// ����7279�Ĺ�����ʽ
	ledWrite(1, 0x00);

	// ����7279�ķ�Ƶϵ��
	ledWrite(1, 0x3f);

	// ��RAM��FIFO����
	ledWrite(1, 0xdf);

	// ��RAM��д����
	ledWrite(1, 0x90);


}

// �������ʾ�ַ�ch
void ledDisplayCh(unsigned char ch){
	int j;
	for(j=0; j<16;++j){
		ledWrite(0, ch);
		delayLed(50);		
	}

}



// ������ʾ0-9�� 0x00 ->�ַ�0�� 0x10 -> �ַ�1�� ... 0x90 -> �ַ�9
void ledDisplayNum(void){

	int i;
	unsigned char ch = 0x00;
	for(i=0; i<10; ++i){
		ledDisplayCh(ch);
		ch += 0x10;
		delayLed(1000);	
	}

	ledWrite(1, 0xA0);

}

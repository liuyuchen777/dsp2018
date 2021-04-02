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

	// 设置文本区起始地址
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x00);
	lcdWrite(1, TXHOME);

	// 设置图形区起始地址
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x02);
	lcdWrite(1, GRHOME);

	// 设置文本区宽度
	lcdWrite(0, 0x10);
	lcdWrite(0, 0x00);
	lcdWrite(1, TXAREA);

	// 设置图形区宽度
	lcdWrite(0, 0x10);
	lcdWrite(0, 0x00);
	lcdWrite(1, GRAREA);

	// 设置光标的行数
	lcdWrite(1, CURSOR);

	// 设置模式 ‘或’
	lcdWrite(1, MODE);

	// 设置显示模式
	lcdWrite(1, DISPMODE);


	// 清空文本区
	lcdWrite(0, 0x00);
	lcdWrite(0, 0x00);
	lcdWrite(1, ADPSET);

	// 打开自动写
	lcdWrite(1, AWRON);

	for(i=0; i<128; ++i){
		lcdWrite(0,0x00);
	}
	lcdWrite(1, AWROFF);

	// 清空图形区

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






#include "ledkey.h"

void delayLed(int times){

	int i,j;
	for(i=0; i<times;++i){
		for(j=0;j<times;++j);
	}	

}


// comm = 1, data为指令 ； comm = 0，data为数据
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

// 初始化7279相关配置
void initLedkey(){

	// 设置7279的工作方式
	ledWrite(1, 0x00);

	// 设置7279的分频系数
	ledWrite(1, 0x3f);

	// 将RAM和FIFO清零
	ledWrite(1, 0xdf);

	// 往RAM中写数据
	ledWrite(1, 0x90);


}

// 数码管显示字符ch
void ledDisplayCh(unsigned char ch){
	int j;
	for(j=0; j<16;++j){
		ledWrite(0, ch);
		delayLed(50);		
	}

}



// 依次显示0-9， 0x00 ->字符0， 0x10 -> 字符1， ... 0x90 -> 字符9
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

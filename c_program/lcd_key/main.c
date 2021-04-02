#include "lcd.h"
#include "ledkey.h"


#define IMR  *(volatile unsigned int *)0x0000
#define IFR  *(volatile unsigned int *)0x0001
#define PMST *(volatile unsigned int *)0x001D

unsigned char ch = 0 ;

unsigned char conststr[] = {0x28, 0x55, 0x44, 0x41, 0x58, 0x01};

int main(){
	

	asm(" LDM PMST, A");
	asm(" OR #0x20, A");

	asm(" AND #0x007F, A");

	asm(" OR  #0x1C00, A ");
	asm(" STLM  A, PMST");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	asm(" nop");
	initLcd();
	initLedkey();
	
	IMR = 0x0002;
	//asm(" STM #0002H,IMR");
	delayLed(2);
	IFR = 0x0000;
	//asm(" STM #0000H,IFR");
	delayLed(2);
	asm(" RSBX INTM");
 	delayLed(2);

	// 数码管依次显示"0-9"
    ledDisplayNum();

	// 液晶屏显示"Hudax!"
	lcdDisplayStr(conststr, sizeof(conststr));

	while(1){
	/*
		delayLcd(3000);
		ledWrite(1,0xdf);
		ledDisplayNum();	*/
	}

}

interrupt void intrFn(){

	asm(" SSBX INTM");
	ledWrite(1, 0xdf);
	ledWrite(1, 0x50);
	ch = ledRead();
	ledWrite(1, 0x90);
	switch(ch){
		case 0x03: ledDisplayCh(0x00);break;
		case 0x0B: ledDisplayCh(0x10);break;	
		case 0x13: ledDisplayCh(0x20);break;
		case 0x1B: ledDisplayCh(0x30);break;	
		case 0x02: ledDisplayCh(0x40);break;
		case 0x0A: ledDisplayCh(0x50);break;	
		case 0x12: ledDisplayCh(0x60);break;
		case 0x1A: ledDisplayCh(0x70);break;	
		case 0x01: ledDisplayCh(0x80);break;
		case 0x09: ledDisplayCh(0x90);break;
		default : break;		
	}

	ledWrite(1, 0xef);
	asm(" RSBX INTM");
}

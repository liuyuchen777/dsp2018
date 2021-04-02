#ifndef __LCD_H__
#define __LCD_H__

#define TXHOME 0x40
#define TXAREA 0x41
#define GRHOME 0x42
#define GRAREA 0x43
#define OFFSET 0x22
#define ADPSET 0x24
#define AWRON 0xB0
#define AWROFF 0xB2
#define MODE 0x80
#define DISPMODE 0x97
#define CURSOR 0xA2


ioport unsigned port0efff;
ioport unsigned port0cfff;

#define CMD port0efff
#define DATA port0cfff


void lcdWrite(unsigned char comm, unsigned char data);
void lcdDisplayStr(unsigned char str[], unsigned char size, unsigned char pos);
void clc_lcd();
void initLcd();

#endif


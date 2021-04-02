#ifndef __LEDKEY_H__
#define __LEDKEY_H__



ioport unsigned port0f7ff;
ioport unsigned port0f3ff;

#define LEDCMD port0f7ff
#define LEDDATA port0f3ff


void delayLed(int times);
void ledWrite(unsigned char comm, unsigned char data);
unsigned char ledRead();
void initLedkey(void);
void ledDisplayCh(unsigned char ch);
void ledDisplayNum(void);

#endif


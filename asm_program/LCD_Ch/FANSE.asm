*************************************************
*
* Title:		LCD.asm
* Description:	Display Chinese
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/11/25
*
* LAST UPDATE: 	04/03/01
*
*************************************************
        	.def  start
        	.def  OPERATION
          
       		.data
       		.global english_text
       		
data1		.WORD 0x08,0x80,0x0C,0x88,0x10,0x9C,0x30,0xE0;"华"
			.WORD 0x53,0x80,0x90,0x84,0x10,0x84,0x10,0x7C
			.WORD 0x11,0x00,0x01,0x00,0x7F,0xFE,0x01,0x00
			.WORD 0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00
			
data2		.WORD 0x01,0x00,0x01,0x00,0x21,0x08,0x3F,0xFC;"中"
			.WORD 0x21,0x08,0x21,0x08,0x21,0x08,0x21,0x08
			.WORD 0x21,0x08,0x3F,0xF8,0x21,0x08,0x01,0x00
			.WORD 0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00
			
data3		.WORD 0x06,0x08,0x78,0x88,0x08,0x48,0x08,0x48;"科"
			.WORD 0xFE,0x08,0x18,0x88,0x1C,0x48,0x2A,0x48
			.WORD 0x28,0x0E,0x48,0x78,0x8B,0x88,0x08,0x08
			.WORD 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
			
data4		.WORD 0x10,0x20,0x10,0x20,0x10,0x20,0xFD,0xFE;"技"
			.WORD 0x10,0x20,0x14,0x20,0x19,0xFC,0x31,0x08
			.WORD 0xD0,0x88,0x10,0x90,0x10,0x60,0x10,0x60
			.WORD 0x10,0x90,0x11,0x0E,0x56,0x04,0x20,0x00


data5		.WORD 0x01,0x00,0x01,0x00,0x01,0x00,0x01,0x00;"大"
			.WORD 0x01,0x00,0xFF,0xFE,0x01,0x00,0x02,0x80
			.WORD 0x02,0x80,0x02,0x40,0x04,0x40,0x04,0x20
			.WORD 0x08,0x10,0x10,0x18,0x20,0x0E,0x40,0x04

data6		.WORD 0x01,0x08,0x10,0x8C,0x0C,0xC8,0x08,0x90;"学"
			.WORD 0x7F,0xFE,0x40,0x04,0x8F,0xE8,0x00,0x40
			.WORD 0x00,0x80,0x7F,0xFE,0x00,0x80,0x00,0x80
			.WORD 0x00,0x80,0x00,0x80,0x02,0x80,0x01,0x00
	

ITERANCE 	.word 0x0000



TXHOME		.set  40h	;TEXT HOME ADDRESS
TXAREA		.set  41h	;TEXT AREA
GRHOME		.set  42h	;GRAPHIC HOME ADDRESS
GRAREA		.set  43h	;GRAPHIC AREA
OFFSET  	.set  22h	;OFFSET ADDRESS
ADPSET 		.set  24h	;ADDRESS POINTER
AWRON	    .set  0xB0	;SET AUTO WRITE MODE
AWROFF		.set  0xB2	;RESET AUTO WRITE MODE
MODE		.set  80h	;LCD MODE 
DISPMODE 	.set  98h	;LCD DISPLAY MODE
CURSOR		.set  0xA3	;CURSOR PATTERN

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
DATA_SIZE	.set  192
DATA		.usect "data",DATA_SIZE
        	.text
        	.asg AR2,ORIGIN
        	.asg AR3,OUTPUT

start:

        LDM  PMST, A
        OR   #0x20, A    ;OLVY = 1: The on-chip RAM is mapped into program and data space. 
        								 ;And the Data Page0( 0h-7fh ) is not mapped into the space
        AND  #0x007F, A		
        OR   #0x1C00, A  ;Remount the interrupt table to 0x1C00
        STL  A, PMST     ;initial PMST PMST:Processor mode status register


OPERATION:

*****************************
*
* MAIN PROGRAM,DISPLAY BEGIN
*
*****************************

		STM 	#1600h,AR1
		STM		#1700h,AR4
;SET TEXT HOME ADDRESS		
		;Send data 0000h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond TXHOME(40h)
		STM     #TXHOME, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET GRAPHIC HOME ADDRESS

		;Send data 0200h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY	
		STM     #02h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond GRHOME(42h)
		STM     #GRHOME, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET TEXT AREA
		
		;Send data 0010h
		STM     #10h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond TXAREA(41h)
		STM     #TXAREA, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;SET GRAPHIC AREA
		
		;Send data 0010h
		STM     #10h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond GRAREA(43h)
		STM     #GRAREA, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;LCD MODE SET
		
		;Send commond 80h
		;OR MODE,Internal Character Generater MODE
		STM     #MODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
		
;LCD DISPLAY MODE SET
		
		;Send commond 98H
		;text off,graphics on,cursor off
		STM     #DISPMODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY


;WRITE ZERO TO TEXT RAM 
	
	;SET ADDRESS POINTER 0000h
		;Send data 0000h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
	;SET DATA AUTO WRITE 
		;Send commond AWRON(0B0h)
		STM     #AWRON,*AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		;Write data for 80H times
		LD 		#0080H,A
		LD		#0001H,B
TEXT_LOOP:
		STM		#00h,*AR1
		SUB		B,A
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		BC		TEXT_LOOP,ANEQ
		
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

;WRITE ZERO TO GRAPHIC RAM 
	
	;SET ADDRESS POINTER 0200h
		;Send data 0000h
		STM     #00h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #02h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		
		;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
	;SET DATA AUTO WRITE 
		;Send commond AWRON(0B0h)
		STM     #AWRON,*AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		;Write data for 4FFH times
		LD 		#04FFH,A
		LD		#0001H,B

GRAPH_LOOP:	
		STM		#00h,*AR1
		SUB		B,A
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		BC		GRAPH_LOOP,ANEQ
		
		
	;AUTO RESET 
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

*****************************
*							*
*  WRITE GRAPHIC RAM FIRST  * 
*							*	
*****************************

;Display "华"		
		LD 		#10H,A
		LD		#02H,B
		STM		#data1,ORIGIN
DISPLAY1:
	;SET CURSOR POINTER
		;Send data 0203h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	  
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY1,ANEQ

;Display "中"		
		LD 		#10H,A
		LD		#04H,B
		STM		#data2,ORIGIN
DISPLAY2:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY2,ANEQ
		
;Display "科"
		LD 		#10H,A
		LD		#06H,B
		STM		#data3,ORIGIN
DISPLAY3:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY3,ANEQ
		
;Display "技"		
		LD 		#10H,A
		LD		#08H,B
		STM		#data4,ORIGIN
DISPLAY4:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY4,ANEQ

;Display "大"		
		LD 		#10H,A
		LD		#0AH,B
		STM		#data5,ORIGIN
DISPLAY5:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY5,ANEQ
		
;Display "学"		
		LD 		#10H,A
		LD		#0CH,B
		STM		#data6,ORIGIN
DISPLAY6:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
	
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
	
		SUB		#0001,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		ADD 	#0010h,B
		
		BC		DISPLAY6,ANEQ
		
*****************************
*							*
*  REDAD GRAPHIC RAM AND    *
*  WTIRE IT ON ANOTHER PLACE*
*							*	
*****************************

		STM		#DATA,OUTPUT

		LD 		#10H,A
		LD		#02H,B

INPUT1:
	;SET CURSOR POINTER
		;Send data B03h
		STL		B,*AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #03h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	  ;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
	;SET DATA AUTO READ 
		;Send command B1H
		STM     #0B1H, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		STL		A,*AR4	;SAVE THE VALUE OF RIGISTER A
	;DATA READ 12 TIMES	
		STM		#0CH-1,BRC
		RPTB	END1
		CALL	READ
END1:
		NOP
		
	;AUTO RESET
		;Send command AWROFF(B2H)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		LD		*AR4,A		
		SUB		#0001,A
		ADD 	#0010h,B
		NOP		
		NOP
		BC		INPUT1,ANEQ				 		 
		
		
		LD 		#10H,A
		LD		#02H,B
		STM		#DATA,OUTPUT	;RESET DATA ADDRESS		
;		STM		#data1,ORIGIN	;TEST CODE		
OUTPUT1:
	;SET CURSOR POINTER
		;Send data B03h
		STL		B,*AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
	  ;Send commond ADPSET(24h)
		STM     #ADPSET, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY			
		
		STL		A,*AR4	;SAVE THE VALUE OF RIGISTER A		
		
	;SET DATA AUTO WRITE
		;Send commond AWRON(0B0h)
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
						
	;DATA WRITE 12 TIMES
		STM		#0CH-1,BRC
		RPTB	END2
		PORTW	*OUTPUT+,#0CFFFh
;		PORTW	*ORIGIN+,#0CFFFh	;TEST CODE
		CALL	DELAY
END2:
		NOP
				
	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY

		LD		*AR4,A
		SUB		#0001,A
		ADD 	#0010h,B
		NOP		
		NOP		
		BC		OUTPUT1,ANEQ	
		
LOOP_END:
		NOP
		
		B  LOOP_END


DELAY:
 		RPT		#0FFFH
		NOP
		RET
		
READ:
		PORTR	#0CFFFh,*AR1
		RPT		#0FFFH
		NOP
		LD		*AR1,A
		CMPL	A
		STL		A,*OUTPUT+
		RET
		

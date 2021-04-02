*************************************************
*
* Title:		LCD.asm
* Description:	Only display character
* Company:		HUST HUDAX COMPANY
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/11/25
*
* LAST UPDATE: 	05/03/05 15:50
*
*************************************************
        	.def  start
        	.def  OPERATION
    
       		.data
       		.global english_text
data1				;ENGLISH CHAR DATA
			.WORD 28H,55H,44H,41H,58H,01H	;"Hudax!"

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
DISPMODE 	.set  94h	;LCD DISPLAY MODE
CURSOR		.set  0xA2	;CURSOR PATTERN

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
        	.text
        	.asg AR2,ORIGIN

start:

        LDM  PMST, A
        OR   #0x20, A    ;OLVY = 1: The on-chip RAM is mapped into program and data space. 
        								 ;And the Data Page0( 0h-7fh ) is not mapped into the space
        AND  #0x007F, A		
        OR   #0x1C00, A  ;Remount the interrupt table to 0x1C00
        STL  A, PMST     ;initial PMST PMST:Processor mode status register


OPERATION:


;SET TEXT HOME ADDRESS		
		;Send data 0000h
		STM 	#0300h, AR1
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
		
;SET CURSOR PATTERN
		;Send commond CURSOR
		;pattern 8*2
;		STM     #CURSOR, *AR1
;		PORTW	*AR1,#0EFFFh
;		CALL 	DELAY	
			
;LCD MODE SET
		
		;Send commond 80h
		;OR MODE,Internal Character Generater MODE
		STM     #MODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY	
		
;LCD DISPLAY MODE SET
		
		;Send commond DISPMODE
		;text on,graphics off,cursor off
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
		
;WRITE TEXT RAM FOR TEST
	
	;SET CURSOR POINTER
		;Send data 0000h
		STM     #0035h, *AR1
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
		STM     #AWRON, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
		;Display "Hudax!"
		LD 		#0006H,A
		STM		#data1,ORIGIN
DISPLAY1:
		LD		#0001H,B
		SUB		B,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		BC		DISPLAY1,ANEQ

	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		

LOOP_END:
		NOP
		
		B  LOOP_END


DELAY:
 		RPT		#0FFFH
		NOP
		RET
*************************************
*
* Title:		led.asm
* Description:	Display LED AND CONTROL KEYBOARD
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/12/26
*
* LAST UPDATE: 	05/01/03 22:50
*
*************************************
        	.def  start
        	.def  OPERATION

       		.data
       		.global english_text
data1				;ENGLISH CHAR DATA
			.WORD 28H,55H,44H,41H,58H,01H	;"Hudax!"

ITERANCE 	.word 0x0000



TXHOME		.set  40h	;TEXT HOME ADDRESS
TXAREA		.set  41h	;TEXT AREA

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
        	.text
        	.asg AR2,ORIGIN

start:
		
        LDM  PMST, A
        OR   #0x20, A    ;OLVY = 1: The on-chip RAM is mapped into program and data space. ;And the Data Page0( 0h-7fh ) is not mapped into the space
        AND  #0x007F, A		
        OR   #0x1C00, A  ;Remount the interrupt table to 0x1C00
        STL  A, PMST     ;initial PMST PMST:Processor mode status register
		
		
OPERATION:
				
;设置8279工作方式
		
		;write commond 00h
 		STM 	#0300h, AR1
		STM     #01h, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY

;设置8279分频系数
		
		;write commond 2Ah,100KHz=1M/10
		STM     #3fh, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
;8279显示RAM和FIFO全部清零
		
		;write commond 0xDF
		STM     #0xDF, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
		
		
;向RAM中写数据
		
		;write commond 0x90
		STM     #0x90, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
		;write data 0xFF
		LD 		#0010H,A
LOOP1:	
		STM     #0x50, *AR1	;送数字"5"
		CALL 	DELAY
		PORTW	*AR1,#0F3FFh
		CALL 	DELAY
		LD		#0001H,B
		SUB		B,A
		BC		LOOP1,ANEQ
		
;8279 A,B开始显示
		
		;write commond 0xA0
;		CALL 	DELAY
;		STM     #0xA0, *AR1
;		CALL 	DELAY
;		PORTW	*AR1,#0F7FFh
;		CALL 	DELAY
		
		
LOOP_END:
		NOP
		
		B  LOOP_END


DELAY:
		RPT		#0FFFH
		NOP
		RET
*************************************
*
* Title:		keyboard.asm
* Description:	Display LED AND CONTROL KEYBOARD
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/12/02
*
* LAST UPDATE: 	04/12/31 22:50
*
*************************************
        	.def  start
        	.def  OPERATION
        	.def  DEALINT

       		.data
       		.global english_text

data1
			.WORD 0x10,0x04,0x08,0x04,0x08,0x04,0xFF,0xA4;"刘"
			.WORD 0x02,0x24,0x42,0x24,0x22,0x24,0x14,0x24
			.WORD 0x14,0x24,0x08,0x24,0x08,0x24,0x14,0x24
			.WORD 0x24,0x04,0x42,0x04,0x82,0x14,0x00,0x08
data2			
			.WORD 0x1F,0xF0,0x10,0x10,0x10,0x10,0x1F,0xF0;"昱"
			.WORD 0x10,0x10,0x10,0x10,0x1F,0xF0,0x02,0x00
			.WORD 0x01,0x00,0x01,0x00,0x7F,0xFC,0x00,0x00
			.WORD 0x10,0x10,0x08,0x20,0x04,0x40,0xFF,0xFE

data3                   .WORD 0x00,0x00,0x3F,0xFC,0x20,0x00,0x20,0x00;"辰"
			.WORD 0x2F,0xF8,0x20,0x00,0x20,0x00,0x3F,0xFC
			.WORD 0x24,0x80,0x24,0x88,0x24,0x50,0x24,0x20
			.WORD 0x44,0x10,0x45,0x08,0x86,0x06,0x04,0x00

ITERANCE 	.word 0x0000

TXHOME		.set  40h	;TEXT HOME ADDRESS
TXAREA		.set  41h	;TEXT AREA
GRHOME		.set  42h	;GRAPHIC HOME ADDRESS
GRAREA		.set  43h	;GRAPHIC AREA
OFFSET  	.set  22h	;OFFSET ADDRESS
ADPSET 		.set  24h	;ADDRESS POINTER
AWRON	        .set  0xB0	;SET AUTO WRITE MODE
AWROFF		.set  0xB2	;RESET AUTO WRITE MODE
MODE		.set  80h	;LCD MODE 
DISPMODE 	.set  9ch	;LCD DISPLAY MODE
CURSOR		.set  0xA3	;CURSOR PATTERN

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
        	.text
        	.asg AR4,ORIGIN
			.asg AR5,TEMP1
			.asg AR6,TEMP2

start:

        LDM  PMST, A
        OR   #0x20, A    ;OLVY = 1: The on-chip RAM is mapped into program and data space. ;And the Data Page0( 0h-7fh ) is not mapped into the space
        AND  #0x007F, A		
        OR   #0x1C00, A  ;Remount the interrupt table to 0x1C00
        STL  A, PMST     ;initial PMST PMST:Processor mode status register
		
		
OPERATION:
				
;设置8279工作方式:
		
		;write commond 07h
 		STM 	#0300h, AR1
		STM     #00h, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY

;设置8279分频系数
		
		;write commond 2Ah,100KHz=1M/10
		STM     #3fh, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
;8279显示RAM和FIFO全部清零
		
		;write commond 0xDF,set zero
		STM     #0xDF, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
;向RAM中写数据
		
		;write commond 0x80
		STM     #0x90, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
		;write data 0xFF
		LD 		#0010H,A

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
		STM     #03h, *AR1
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
		
		;Send commond DISPMODE
		;text on,graphics off,cursor off
		STM     #DISPMODE, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY


LOOP1:	
		STM     #0x50, *AR1	;送数字"5"
		
		CALL 	DELAY
		PORTW	*AR1,#0F3FFh
		CALL 	DELAY
		LD		#0001H,B
		SUB		B,A
		BC		LOOP1,ANEQ
		
;5409 DSP中断设置
				
				
		stm		#0002H,IMR	;open int1
		nop
		nop
		stm		#0000H,IFR	;通过写IFR,取消挂起的中断
		nop
		rsbx	intm
		nop
		
		B    	LOOP3
		CALL	DELAY

;按键进中断后的处理程序

DEALINT:
		CALL GRAPH_CLEAR

;清除8279显示RAM中的数据
		;write commond 0xDF,set 8279 RAM and FIFO zero
		STM     #0xDF, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY


;读8279FIFO堆栈
		;write commond 0x50
		STM     #0x50, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
		;DATA READ
		STM 	#0400h, AR2
		PORTR	#0F3FFh,*AR2
		CALL 	DELAY
;		LD  	*AR2,A

;向显示RAM中写数据
		
		;write commond 0x80
		STM     #0x90, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY
		
		;设置循环次数16次
		LD 		#0010H,A

		LD		#03H,B
	    STM     #0x00, TEMP1	;送数字"0"
	    SUB  	*AR2,B
		BC		DISPLAY2,BEQ
		CALL	DELAY
		
		LD		#0BH,B
		STM     #0x10, TEMP1	;送数字"1"		
		SUB  	*AR2,B		
		BC		DISPLAY2,BEQ
		CALL	DELAY
		
		LD		#13H,B
		STM     #0x20, TEMP1	;送数字"2"
		SUB  	*AR2,B
		BC		DISPLAY2,BEQ
		CALL	DELAY
		
		LD		#1BH,B
		STM     #0x30, *AR1	;送数字"3"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#02H,B
		STM     #0x40, *AR1	;送数字"4"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#0AH,B
		STM     #0x50, *AR1	;送数字"5"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#12H,B
		STM     #0x60, *AR1	;送数字"6"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#1AH,B
		STM     #0x70, *AR1	;送数字"7"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#01H,B
		STM     #0x80, *AR1	;送数字"8"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY
		
		LD		#09H,B
		STM     #0x90, *AR1	;送数字"9"
		SUB  	*AR2,B
		BC		OUTPUT,BEQ
		CALL	DELAY

DISPLAY2
;显示第二个汉字		
		LD      TEMP1,T
		LD      #0000h,A
		MAC     #0002h,A
		ADD		#data1,A
		STL     A,ORIGIN

		LD 		#0010H,A
		LD		#0003H,B
DISPLAY22:
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
		BC		DISPLAY22,ANEQ
;结束8279硬件中断信号?
		;write commond 0xF0
		STM     #0xEF, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY

		RETE
		NOP
		NOP
		
OUTPUT:	
		;CALL    GRAPH_CLEAR
		PORTW	*AR1,#0F3FFh
		CALL 	DELAY
		SUB		#0001H,A
		BC		OUTPUT,ANEQ

;结束8279硬件中断信号?
		;write commond 0xF0
		STM     #0xEF, *AR1
		PORTW	*AR1,#0F7FFh
		CALL 	DELAY

		RETE
		NOP
		NOP
		
LOOP3:	
		NOP
		
LOOP_END:
		NOP
		
		B  LOOP_END
		
		
DELAY:	
		RPT		#0FFFH
		NOP
		RET

GRAPH_CLEAR:
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
		RETE
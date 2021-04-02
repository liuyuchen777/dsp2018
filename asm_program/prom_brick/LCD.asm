*************************************************
*
* Title:		LCD.asm
* Description:	Display LCD screen,read and write
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/11/25
*
* LAST UPDATE: 	04/12/30 15:50
*
*************************************************
        	.def  start
        	.def  OPERATION
			.def  DEALINT
			.def  TIMEHANDLE
    
       		.data
       		.global english_text
data1
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A
			.word 0x0A,0x0A,0x0A,0x0A

data2       
			.word 0x03,0x03,0x03,0x03
			.word 0x03,0x03,0x03,0x03

data3       .word 0x04
	


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
DISPMODE 	.set  9ch	;LCD DISPLAY MODE
CURSOR		.set  0xA3	;CURSOR PATTERN

        	.mmregs     ;define memory-mapped registers, 
        				;such as IFR, al, IMR, bl, PRD, PMST, TCR, st0
        	.text
			.asg AR3,FLAG
			.asg AR4,ORIGIN
			.asg AR5,BOARD
			.asg AR6,XLABEL
			.asg AR7,YLABEL

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
				
				
		stm     #0010h,TCR	;TCR的TSS位写1以停止计时器
		nop
		nop
		stm		#0020h,PRD	;装载PRD
		nop
		nop
		stm     #0029h,TCR   ;初始化TDDR
		nop
		nop
		stm		#000Ah,IMR	;开中断零
		nop
		nop
		stm 	#000Ah,IFR	;写IFR，取消所悬挂的中断
		nop
		rsbx	intm		;设置允许中断
		nop

		CALL	DELAY

;初始化代码
        CALL    GRAPH_CLEAR
		STM     #0005h,BOARD
		STM     #000Ah,XLABEL
		STM     #0006h,YLABEL
		STM     #0000h,FLAG
		CALL    DISPLAYBALL
		CALL    DISPLAYBOARD
		CALL    DISPLAYBRICK


LOOP_END:
		NOP
		
		B  LOOP_END

DISPLAYBOARD:
	;SET CURSOR POINTER
		;Send data 0000h
		LD      #0070h,A
		ADD     BOARD,A
		STL     A,*AR1
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
		
		
		LD 		#0008H,A
		STM		#data2,ORIGIN
DISPLAYBOARD1:
		LD		#0001H,B
		SUB		B,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		BC		DISPLAYBOARD1,ANEQ

	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		RET

DISPLAYBALL:	
	;SET CURSOR POINTER
		;Send data 0000h
		LD      #0000h,A
		ADD     XLABEL,A 
		STM     #0010h,T
		MAC     YLABEL,A
		STL     A,*AR1
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
		LD 		#0001H,A
		STM		#data3,ORIGIN
DISPLAYBALL1:
		LD		#0001H,B
		SUB		B,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		BC		DISPLAYBALL1,ANEQ

	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		RET

DISPLAYBRICK:
	;SET CURSOR POINTER
		;Send data 0000h
		STM     #0000h, *AR1
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
		
		
		LD 		#0040H,A
		STM		#data1,ORIGIN
DISPLAYBRICK1:
		LD		#0001H,B
		SUB		B,A
		PORTW	*ORIGIN+,#0CFFFh
		CALL 	DELAY
		BC		DISPLAYBRICK1,ANEQ

	;AUTO RESET
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		RET

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
		
		;设置循环TIMES
		LD 		#0004H,A
		
		LD		#1BH,B
		STM     #0x30, *AR1	;板向左移动
		SUB  	*AR2,B
		BC		LEFT_MOV,BEQ
		CALL	DELAY
		
		
		LD		#1AH,B
		STM     #0x70, *AR1	;板向右移动
		SUB  	*AR2,B
		BC		RIGHT_MOV,BEQ
		CALL	DELAY
		;测试按键是否工作
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

OUTPUT:	
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

;定时器中断处理程序
TIMEHANDLE:
		CALL    DELAY

		LD		FLAG,A
		SUB		#0000h,A
		BC		FLAG0,AEQ
		
		LD		FLAG,A
		SUB		#0001h,A
		BC		FLAG1,AEQ

		LD		FLAG,A
		SUB		#0002h,A
		BC		FLAG2,AEQ

		LD		FLAG,A
		SUB		#0003h,A
		BC		FLAG3,AEQ

		RETE

FLAG0:
		LD		XLABEL,A
		ADD		#0001h,A
		STL		A,XLABEL
		
		LD		YLABEL,A
		ADD		#0001h,A
		STL		A,XLABEL
		;状态跳转函数
		LD		XLABEL,A
		SUB		#000Fh,A
		STM		#0002h,*AR1;状态0-2
		BC		FLAGCHANGE,AEQ

		RET

FLAG1:
		LD		XLABEL,A
		ADD		#0001h,A
		STL		A,XLABEL
		
		LD		YLABEL,A
		SUB		#0001h,A
		STL		A,XLABEL
		;状态跳转函数
		LD		XLABEL,A
		SUB		#000Fh,A
		STM		#0003h,*AR1;状态1-3
		BC		FLAGCHANGE,AEQ

		RET

FLAG2:
		LD		XLABEL,A
		SUB		#0001h,A
		STL		A,XLABEL
		
		LD		YLABEL,A
		ADD		#0001h,A
		STL		A,XLABEL
		;状态跳转函数
		LD		XLABEL,A
		SUB		#0000h,A
		STM		#0000h,*AR1;状态2-0
		BC		FLAGCHANGE,AEQ

		RET

FLAG3:
		LD		XLABEL,A
		SUB		#0001h,A
		STL		A,XLABEL
		
		LD		YLABEL,A
		SUB		#0001h,A
		STL		A,XLABEL
		;状态跳转函数
		LD		XLABEL,A
		SUB		#0000h,A
		STM		#0001h,*AR1;状态3-1
		BC		FLAGCHANGE,AEQ

		RET

FLAGCHANGE:
		LD		*AR1,A
		SUB		#0000h,A
		BC		FC0,AEQ
		
		LD		*AR1,A
		SUB		#0001h,A
		BC		FC1,AEQ

		LD		*AR1,A
		SUB		#0002h,A
		BC		FC2,AEQ

		LD		*AR1,A
		SUB		#0003h,A
		BC		FC3,AEQ

		RET

FC0:
		STM		#0000h,FLAG
		RET

FC1:
		STM		#0001h,FLAG
		RET

FC2:
		STM		#0002h,FLAG
		RET

FC3:
		STM		#0003h,FLAG
		RET

LEFT_MOV:
		LD       BOARD,A
		ADD      #0001H,A
		STL      A,BOARD
		CALL     DISPLAYBOARD
		CALL     DISPLAYBRICK
		CALL     DISPLAYBALL
		RETE

RIGHT_MOV:
		LD       BOARD,A
		SUB      #0001H,A
		STL      A,BOARD
		CALL     DISPLAYBOARD
		CALL     DISPLAYBRICK
		CALL     DISPLAYBALL
		RETE

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
		RET

DELAY:
 		RPT		#0FFFH
		NOP
		RET
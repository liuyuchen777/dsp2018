
                .mmregs
				.def	jump 
				.def	start
K_SAMPLE_NUM	.set	128 
				;���ñ���������ݵĵ���
out_data		.usect	"out_vars",K_SAMPLE_NUM

       			;�������λ�ã���СΪK_SAMPLE_NUM����������һ�����ݣ��Ա�鿴��
				;���Ƿ���ȷ��Ҳ���Թ���Ҫ������������ݵĳ�����ã�����FFT������
				;������ARX��ָ�����ݵ��׵�ַ
in_data			.usect	"in_vars",1
d_cr0_send		.usect	"cr_send",1
d_cr1_send		.usect	"cr_send",1
				;��������״̬�֣���״̬�־�����Ҫ��ʼд��TLV1571�ĳ�ʼֵ

d_temp			.usect	"temp",1 ;�����ʱ����
k_cr0_send		.set 0080h
k_cr1_send		.set 0100h

var1			.usect "temp",1
var2			.usect "temp",1
var3			.usect "temp",1
var4			.usect "temp",1
varT			.usect "temp",1
bias			.usect "temp",1
data_or			.usect "temp",1
data_ptr		.usect "temp",1

d_var1			.usect "temp",1
d_var2			.usect "temp",1

var_display     .usect "temp",1

;����ӳ���ж�����


K_IPTR			.set 000111000b<<07  ;ָ��1C00H�µ�������
				;IPTR��DSP�ڲ�PMST�Ĵ����ĸ�9λ������ָ���ж��������λ�á�
				;��λʱȫΪ1����ʱ����Ϊ�˵��ԣ�����ӳ�䵽��ַ1D00��
K_TEMP			.set 1111111b
				;����һ�������������Ժ���PMST�������������PMST�ĵ���λ����
D_PMST			.usect "pmst",1
	
	            
			.data

data1
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data2			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data3
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data4			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data5
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data6			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data7
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data8
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data9
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data10
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data11
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data12
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data13
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data14
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data15
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data16
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data17
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data18
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data19			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data20
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data21			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data22
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
data23			
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data24
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data25
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data26
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data27
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data28
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data29
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data30
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data31
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

data32
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
			.WORD 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

ITERANCE 	.word 0x0000


;LED��ʾ�������
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

			.asg AR3,ORIGIN
			.sect	"prog"

start:
			LDM	PMST,A
				;ȡ��PMST��ֵ������A���ı�PMST�ĸ�0λ���ٷ���PMST
			AND	# K_TEMP,A
			OR	# K_IPTR,A
			STL	A,PMST
			;MVDM	ar2,PMST

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
			;reset LED

;SET TEXT HOME ADDRESS		
		;Send data 0000h
		STM 	#1500h, AR1
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
		
		;Send commond DISPMODE
		;text off,graphics on,cursor off
		STM     #DISPMODE, *AR1; 98h
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			;AD��ʼ��
        	stm		#0001h,IMR  ;���ж�
	        nop
	        nop
 	        stm		#0002h,IFR	;ͨ��дIFR��ȡ�������ҵ��ж�
	        nop
	        rsbx	intm		;״̬�Ĵ���ST0��INTMλ�������ж�
	        nop

		    stm		#d_temp,ar2
		    stm		#d_cr0_send,ar1
	 	    st		#k_cr0_send,*ar1+  ; d_cr0_send(address) = k_cr0_send(value)
		    st		#k_cr1_send,*ar1
		    stm		#d_cr0_send,ar1
		    LD		#K_SAMPLE_NUM,A ;���Լ���
		    stm		#out_data,ar5


			;д״̬��
			portr 0ffffh,*ar2		;����Ķ˿ڣ�ʹA/Dת������CSΪ��
			rpt #20
			nop
			nop
			nop
			portw *ar1+,07FFFh		;��A/Dת�����ļĴ���ARI
			rpt	#20
			nop
			nop
			portw *ar1,07FFFh		;��A/Dת�����ļĴ���ARI


			portr 0ffffh,*ar2		;����Ķ˿ڣ�ʹA/Dת������CSΪ��
			rpt	#20
			nop
			nop
								;��ʱ��д��״̬��A/D��ʼ����


WAIT:	    NOP
			NOP
			NOP
			NOP
			NOP
			CALL RESETAD
			B	WAIT
			NOP

DELAY:
 		RPT		#0FFFH
		NOP
		RET
		
RESETAD:
			;����AD�ж�
			stm		#0001h,IMR  ;���ж�
	        nop
	        nop
 	        stm		#0002h,IFR	;ͨ��дIFR��ȡ�������ҵ��ж�
	        nop
	        rsbx	intm		;״̬�Ĵ���ST0��INTMλ�������ж�
	        nop

		RET	

MAPDATA_TO_GRAPHIC_MEMORY:
			NOP
			NOP
			SUB #1H,A  ;A = A-1

			stm #var1,ar3		;*ar3 = var1
			stm #var2,ar4		;*ar4 = var2
			stl A,*ar4          ;var2 = A
			LD *ar4,B       ;B = var2
			sub #1h,B        ;B=B-1
			stl B,*ar4       ;var2 = B
			LD	#K_SAMPLE_NUM,B
			rpt *ar4
			SUB #1h,B
			stl B,*ar3         ;var1Ϊ��ǰ�����±�			

			;����ƫ��
			rpt #3
			ROR B
			stl B,*ar4			;var2 = var1>>4 var2�ǵ�ǰ����
			rsbx FRCT
			stm #var3,ar3		;*ar3 = var3
			st #0080h,*ar3       ;var3 = 80h
			ld *ar4,T
			mpy *ar3,B   ;B=80h*var2
			stm #bias,ar3		;*ar3 = bias
			stl B,*ar3			;bias+=��ƫ��   bias = B



			;��ƫ��
			LD #0041h,B
			rpt *ar5
			sub #1h,B
			stm #varT,ar4
			st #2h,*ar4
			ld *ar4,T
			stm #var4,ar4
			stl B,*ar4
			mpy *ar4,B

			add *ar3,B
			stl B,*ar3			;bias+=��ƫ��
			stm #var3,ar3		;ar3 = var3


			;������ƫ��
			stm #var1,ar3
			ld *ar3,B
			rpt #2
			ROR B
			stm #var4, ar4
			st #01h,*ar4
			add *ar4,B
			and #0000000001h, B
			stm #bias,ar3
			add *ar3,B
			stl B,*ar3
			stm #var3,ar3

			
			;get or_data
			stm #data_or, ar4
			st #0080h, *ar4		;0000 0000 1000 0000
			stm #var1,ar3		;ar3 = var1
			LD *ar3,B
			and #0007h,B
			sub #1h,B
			stm #var3,ar3       ;ar3 = var3
			stl B,*ar3
			LD *ar4,B
			and #000000FFFFh,B
			RPT #10
			NOP
			rpt *ar3
			ROR B
			stl B,*ar4			;0000 0000 0010 0000
			stm #var2, ar4
			
			;ORIGIN+bias
			stm #data1, ar4
			stm #bias,ar3
			LD *ar3,B
			sub #1h,B
			stl B,ar3			;bias-1
			rpt *ar3
			mar *ar4+			;data1+bias
			
			;д��data
			LD *ar4,B
			stm #data_or,ar3
			or *ar3,B
			stl B, *ar4
			stm #var2,ar4
			stm #var3,ar3

			MAR *ar5+
			B MAPDATA

			
			;����128����ļ���ѭ��
RESETA:
		
			
			
			NOP
			NOP
			;��out_data�е�����ӳ�䵽�Դ�ռ�
			STM	#out_data,ar5
			LD	#K_SAMPLE_NUM,A
MAPDATA:
			BC  MAPDATA_TO_GRAPHIC_MEMORY, ANEQ


			;��ʾ�Դ��е����ݵ�LED
			CALL DISPLAY


			;�����Դ�
			STM #data1,ar1
			rpt #03FFh
			st #0000h,*ar1+

		
			;����AD�ж�
        	stm		#0001h,IMR  ;���ж�
	        nop
	        nop
 	        stm		#0002h,IFR	;ͨ��дIFR��ȡ�������ҵ��ж�
	        nop
	        rsbx	intm		;״̬�Ĵ���ST0��INTMλ�������ж�
	        nop

		    stm		#d_temp,ar2
		    stm		#d_cr0_send,ar1
	 	    st		#k_cr0_send,*ar1+  ; d_cr0_send(address) = k_cr0_send(value)
		    st		#k_cr1_send,*ar1
		    stm		#d_cr0_send,ar1
		    LD		#K_SAMPLE_NUM,A ;���Լ���
		    stm		#out_data,ar5


			;д״̬��
			portr 0ffffh,*ar2		;����Ķ˿ڣ�ʹA/Dת������CSΪ��
			rpt #20
			nop
			nop
			nop
			portw *ar1+,07FFFh		;��A/Dת�����ļĴ���ARI
			rpt	#20
			nop
			nop
			portw *ar1,07FFFh		;��A/Dת�����ļĴ���ARI


			portr 0ffffh,*ar2		;����Ķ˿ڣ�ʹA/Dת������CSΪ��
			rpt	#20
			nop
			nop
								;��ʱ��д��״̬��A/D��ʼ����


			NOP
			NOP
			RET	


		;��LED��ʾ�Դ��е�����
DISPLAY:
		
		
		;reset LED

;SET TEXT HOME ADDRESS		
		;Send data 0000h
		STM 	#1500h, AR1
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
		
		;Send commond DISPMODE
		;text off,graphics on,cursor off
		STM     #DISPMODE, *AR1; 98h
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY



		
		
	;AUTO RESET 
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
				
	;AUTO RESET 
		;Send commond AWROFF(0B2h)
		STM     #AWROFF, *AR1
		PORTW	*AR1,#0EFFFh
		CALL 	DELAY
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;���Դ��е�������ʾ��LED��		
		;Display "1"
		LD 		#0010H,A
		LD		#0000H,B
		STM		#data1,ORIGIN
DISPLAY1:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		
				
		;Display "2"
		LD 		#0010H,A
		LD		#0000H,B
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

				
		;Display "3"
		LD 		#0010H,A
		LD		#0000H,B
		STM		#data3,ORIGIN
DISPLAY3:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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

				
		;Display "4"
		LD 		#0010H,A
		LD		#0000H,B
		STM		#data4,ORIGIN
DISPLAY4:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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

		;Display "5"
		LD 		#0010H,A
		LD		#0002H,B
		STM		#data5,ORIGIN
DISPLAY5:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		
				
		;Display "6"
		LD 		#0010H,A
		LD		#0002H,B
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

				
		;Display "7"
		LD 		#0010H,A
		LD		#0002H,B
		STM		#data7,ORIGIN
DISPLAY7:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY7,ANEQ

				
		;Display "8"
		LD 		#0010H,A
		LD		#0002H,B
		STM		#data8,ORIGIN
DISPLAY8:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY8,ANEQ

		;Display "9"
		LD 		#0010H,A
		LD		#0004H,B
		STM		#data9,ORIGIN
DISPLAY9:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY9,ANEQ
		
				
		;Display "10"
		LD 		#0010H,A
		LD		#0004H,B
		STM		#data10,ORIGIN
DISPLAY10:
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
		BC		DISPLAY10,ANEQ

				
		;Display "11"
		LD 		#0010H,A
		LD		#0004H,B
		STM		#data11,ORIGIN
DISPLAY11:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY11,ANEQ

				
		;Display "12"
		LD 		#0010H,A
		LD		#0004H,B
		STM		#data12,ORIGIN
DISPLAY12:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY12,ANEQ

		;Display "13"
		LD 		#0010H,A
		LD		#0006H,B
		STM		#data13,ORIGIN
DISPLAY13:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY13,ANEQ
		
				
		;Display "14"
		LD 		#0010H,A
		LD		#0006H,B
		STM		#data14,ORIGIN
DISPLAY14:
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
		BC		DISPLAY14,ANEQ

				
		;Display "15"
		LD 		#0010H,A
		LD		#0006H,B
		STM		#data15,ORIGIN
DISPLAY15:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY15,ANEQ

				
		;Display "16"
		LD 		#0010H,A
		LD		#0006H,B
		STM		#data16,ORIGIN
DISPLAY16:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY16,ANEQ

		;Display "17"
		LD 		#0010H,A
		LD		#0008H,B
		STM		#data17,ORIGIN
DISPLAY17:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY17,ANEQ
		
				
		;Display "18"
		LD 		#0010H,A
		LD		#0008H,B
		STM		#data18,ORIGIN
DISPLAY18:
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
		BC		DISPLAY18,ANEQ

				
		;Display "19"
		LD 		#0010H,A
		LD		#0008H,B
		STM		#data19,ORIGIN
DISPLAY19:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY19,ANEQ

				
		;Display "20"
		LD 		#0010H,A
		LD		#0008H,B
		STM		#data20,ORIGIN
DISPLAY20:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY20,ANEQ

		;Display "21"
		LD 		#0010H,A
		LD		#000AH,B
		STM		#data21,ORIGIN
DISPLAY21:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY21,ANEQ
		
				
		;Display "22"
		LD 		#0010H,A
		LD		#000AH,B
		STM		#data22,ORIGIN
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

				
		;Display "23"
		LD 		#0010H,A
		LD		#000AH,B
		STM		#data23,ORIGIN
DISPLAY23:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY23,ANEQ

				
		;Display "24"
		LD 		#0010H,A
		LD		#000AH,B
		STM		#data24,ORIGIN
DISPLAY24:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY24,ANEQ

		;Display "25"
		LD 		#0010H,A
		LD		#000CH,B
		STM		#data25,ORIGIN
DISPLAY25:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY25,ANEQ
		
				
		;Display "26"
		LD 		#0010H,A
		LD		#000CH,B
		STM		#data26,ORIGIN
DISPLAY26:
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
		BC		DISPLAY26,ANEQ

				
		;Display "27"
		LD 		#0010H,A
		LD		#000CH,B
		STM		#data27,ORIGIN
DISPLAY27:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY27,ANEQ

				
		;Display "28"
		LD 		#0010H,A
		LD		#000CH,B
		STM		#data28,ORIGIN
DISPLAY28:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY28,ANEQ

		;Display "29"
		LD 		#0010H,A
		LD		#000EH,B
		STM		#data29,ORIGIN
DISPLAY29:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
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
		BC		DISPLAY29,ANEQ
		
				
		;Display "30"
		LD 		#0010H,A
		LD		#000EH,B
		STM		#data30,ORIGIN
DISPLAY30:
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
		BC		DISPLAY30,ANEQ

				
		;Display "31"
		LD 		#0010H,A
		LD		#000EH,B
		STM		#data31,ORIGIN
DISPLAY31:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #04h, *AR1
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
		BC		DISPLAY31,ANEQ

				
		;Display "32"
		LD 		#0010H,A
		LD		#000EH,B
		STM		#data32,ORIGIN
DISPLAY32:
	;SET CURSOR POINTER
		;Send data 0200h
		STL    	B, *AR1
		PORTW	*AR1,#0CFFFh
		CALL 	DELAY
		STM     #05h, *AR1
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
		BC		DISPLAY32,ANEQ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		rpt #2FFFH
		NOP


		RET

jump:        
			stm		#0000h,IFR
			CC RESETA,AEQ
			NOP
			NOP
			
			SUB # 1h,A       ;����
			 
			stm #bias,ar3		;bias����
			st #0000h,*ar3


	        rsbx    xf       ;�������źţ�A/Dת�����յ�����һ�β��� �Ĵ���״̬��λ
			rpt  # 5
			nop              ;�ȴ��������ڣ�����ʾ�����鿴����

			portr  07FFFh,*ar5
	                         ;��A/Dת�����ݣ�д��RAM��out_data���ݶ�
							 
			rpt #5
			nop
			
					 
				
			ssbx xf         ;ʹ���ź���Ч   �Ĵ���״̬��λ
			nop
			portr  0FFFFh,*ar2  ;ʹ��Ķ˿ڣ�ʹA/Dת������CSΪ��
			nop
			nop
			portw *ar5+,0BFFFh  ;��D/Aת�������



			;CALL  DELAY


			stm		#0001h,IMR  ;���ж�
	        nop
	        nop
 	        stm		#0002h,IFR	;ͨ��дIFR��ȡ�������ҵ��ж�
	        nop
	        rsbx	intm		;״̬�Ĵ���ST0��INTMλ�������ж�
	        nop

			rete             ;�жϷ���
            .end
				.mmregs
				.def jump
				.def start
in_data			.usect 	"in_vars",1
d_cr0_send    	.usect	"cr_send",1
d_cr1_send		.usect	"cr_send",1
							;����2��״̬�ʣ���״̬�ʾ�����Ҫд��TLV1571�ĳ�ʼֵ
d_temp 			.usect 	"temp",1
k_cr0_send		.set 	0080h
k_cr1_send		.set	0100h
;filter
K_B				.set	15		;b
DATA_DP			.usect	"filter_vars",0
bufferdatax		.usect	"filter_vars",K_B
data_one		.usect  "filter_vars",1

a1	.set	0162h
a2	.set	0000h
a3	.set	-01FFh
a4	.set	0286h
a5	.set	0000h
a6	.set	-0520h
a7	.set	0A4Ah
a8	.set	18EAh
a9	.set	0A4Ah
a10	.set	-0520h
a11	.set	0000h
a12	.set	0286h
a13	.set	-01FFh
a14	.set	0000h
a15	.set	0162h

		.asg	AR3,INPUT
		.asg    AR6,TEMP


****************************************************
*****����ӳ���ж������ı���*************************
****************************************************

K_IPTR			.set	000111000b<<07;ָ��1C00H�µ�������
								;IPTR��DSP�ڲ�PMST�Ĵ����ĸ�6λ������ָ���ж��������λ�ã���λʱ���˳���Ϊ�˵��ԣ�����ӳ�䵽��ַD��
K_TEMP			.set 	1111111b
							;����һ������ �����Ժ�PMST������� ����PMST�ĵ�6Ϊ����
D_PMST			.usect "pmst",1
	.sect "prog"
start:
		LDM PMST,A
				;ȡ��PMST��ֵ������A���ı�PMST�ĸ�9λ���ٷ���PMST
		AND		#K_TEMP,A
		OR    	#K_IPTR,A
		STL  	A,PMST

*********************************************
******�ж�����*********************
***************************************
	
	stm     #0010h,TCR	;TCR��TSSλд1��ֹͣ��ʱ��
	nop
	nop
	stm		#0020h,PRD	;װ��PRD
	nop
	nop
	stm     #0829h,TCR   ;��ʼ��TDDR
	nop
	nop
	stm		#0008h,IMR	;���ж���
	nop
	nop
	stm 	#0008h,IFR	;дIFR��ȡ�������ҵ��ж�
	nop
	rsbx	intm		;���������ж�
	nop
	

					
*****************************************
*************���ó�ʼֵ********************
*******************************************					

		stm 	#d_temp,ar2
		stm  	#d_cr0_send,ar1
		st		#k_cr0_send,*ar1+
		st		#k_cr1_send,*ar1
		stm 	#d_cr0_send,ar1
				
*****************************************************
**************д״̬�֣�����AD***********************
*****************************************************

		portr	 0FFFFh,*ar2	;̧�����ж˿�
		nop
		nop
		nop
		portw 	*ar1+,07FFFh	;��AD�Ĵ���AR1
		rpt 	#8
		nop
		portw 	*ar1,07FFFh		;��AD�Ĵ���AR1
		
		portr 0FFFFh,*ar2 		;̧�����ж˿�
		rpt		#10
		nop
		nop
												;��ʱ��д��״̬��A/D��ʼ����
		;��ʼ��bufferdatax,��λ15�����ȥ
		STM		#bufferdatax,INPUT
		RPT		K_B-1
		STM		#0,*INPUT+
		STM		#bufferdatax+1,INPUT
*******************************************************************
*************���жϣ���A������������д��K_SAMPLE_NUM�����ݺ�*******
*************�����ü���������ʹARSָ��out_data�Ŀ�ʼ��ַ***********
*******************************************************************

WAIT:	NOP
		B WAIT
		NOP
				
*******************************************************************
*************�жϷ���������Զ�ת���źţ�����out_data��**********
*******************************************************************

jump:  	
		STM		#data_one,ar5
		rsbx 	xf		;�������źţ�AD�յ���ʼ��һ�β���
		rpt		#5
		nop
		portr		07FFFh,*ar5		;��ADת������,д��RAM��out_data��
		LD		*ar5,A
		NOP
		NOP
		AND		#03FFh,A
		NOP
		STL		A,*ar5
		
		;������ǰ��ֵ����λ
	    STM		K_B-1-1,BRC
		RPTB	move_end-1;ѭ����֮ǰ��ֵ��ǰ��һ��
		LD		*INPUT-,A
		NOP
		NOP
		STL		A,*INPUT+
		NOP
		NOP
		LD		*INPUT+,A		
move_end:
		NOP
		NOP
		LD		*INPUT-,A
		NOP
		NOP
		LD		*AR5,A
		NOP
		NOP
		STL		A,*INPUT
		NOP
		NOP
		STM		#bufferdatax,INPUT
		NOP
		NOP

		;�����˲������ֵ
		LD		#0,B
		NOP
		NOP
		LD		#0,A
		NOP
		NOP
		MPY		*INPUT+,#a15,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a14,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a13,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a12,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a11,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a10,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a9,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a8,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a7,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a6,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a5,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a4,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a3,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a2,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+,#a1,B			;B=b4*x(i)
		ADD		B,A
		nop
		nop

		SFTA	A,#8

		STH		A,*ar5
		STM		#bufferdatax+1,INPUT
		;дDA
		rpt #5
		nop
		ssbx 	xf
		nop
		portr  0FFFFh,*ar2	;̧�߶˿ڵ�ѹ
		nop
		nop
		portw	*ar5,0BFFFh ;дDA
		rete				 ;�жϷ���
		.end
																				
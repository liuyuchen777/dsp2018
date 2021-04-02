				.mmregs
				.def jump
				.def start
in_data			.usect 	"in_vars",1
d_cr0_send    	.usect	"cr_send",1
d_cr1_send		.usect	"cr_send",1
							;定义2个状态词，此状态词就是需要写入TLV1571的初始值
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
*****重新映射中断向量的变量*************************
****************************************************

K_IPTR			.set	000111000b<<07;指向1C00H新的向量区
								;IPTR是DSP内部PMST寄存器的高6位，用于指定中断向量表的位置，复位时，此程序为了调试，重新映射到地址D处
K_TEMP			.set 	1111111b
							;定义一个参数 用于以后PMST的与操作 保持PMST的低6为不变
D_PMST			.usect "pmst",1
	.sect "prog"
start:
		LDM PMST,A
				;取出PMST的值，放入A，改变PMST的高9位，再放入PMST
		AND		#K_TEMP,A
		OR    	#K_IPTR,A
		STL  	A,PMST

*********************************************
******中断设置*********************
***************************************
	
	stm     #0010h,TCR	;TCR的TSS位写1以停止计时器
	nop
	nop
	stm		#0020h,PRD	;装载PRD
	nop
	nop
	stm     #0829h,TCR   ;初始化TDDR
	nop
	nop
	stm		#0008h,IMR	;开中断零
	nop
	nop
	stm 	#0008h,IFR	;写IFR，取消所悬挂的中断
	nop
	rsbx	intm		;设置允许中断
	nop
	

					
*****************************************
*************设置初始值********************
*******************************************					

		stm 	#d_temp,ar2
		stm  	#d_cr0_send,ar1
		st		#k_cr0_send,*ar1+
		st		#k_cr1_send,*ar1
		stm 	#d_cr0_send,ar1
				
*****************************************************
**************写状态字，驱动AD***********************
*****************************************************

		portr	 0FFFFh,*ar2	;抬高所有端口
		nop
		nop
		nop
		portw 	*ar1+,07FFFh	;填AD寄存器AR1
		rpt 	#8
		nop
		portw 	*ar1,07FFFh		;填AD寄存器AR1
		
		portr 0FFFFh,*ar2 		;抬高所有端口
		rpt		#10
		nop
		nop
												;此时，写好状态字A/D开始采样
		;初始化bufferdatax,移位15个零进去
		STM		#bufferdatax,INPUT
		RPT		K_B-1
		STM		#0,*INPUT+
		STM		#bufferdatax+1,INPUT
*******************************************************************
*************等中断，用A做计数器，当写完K_SAMPLE_NUM个数据后*******
*************，重置计数器，并使ARS指向out_data的开始地址***********
*******************************************************************

WAIT:	NOP
		B WAIT
		NOP
				
*******************************************************************
*************中断服务程序，用以读转换信号，放入out_data区**********
*******************************************************************

jump:  	
		STM		#data_one,ar5
		rsbx 	xf		;发出读信号，AD收到后开始下一次采样
		rpt		#5
		nop
		portr		07FFFh,*ar5		;读AD转换数据,写在RAM的out_data段
		LD		*ar5,A
		NOP
		NOP
		AND		#03FFh,A
		NOP
		STL		A,*ar5
		
		;进行以前数值的移位
	    STM		K_B-1-1,BRC
		RPTB	move_end-1;循环把之前的值向前移一格
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

		;计算滤波输出的值
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
		;写DA
		rpt #5
		nop
		ssbx 	xf
		nop
		portr  0FFFFh,*ar2	;抬高端口电压
		nop
		nop
		portw	*ar5,0BFFFh ;写DA
		rete				 ;中断返回
		.end
																				
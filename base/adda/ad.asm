				.mmregs
				.def jump
				.def start
K_SAMPLE_NUM 	.set 256
							;设置保存采样数据的点数
out_data		.usect	"out_vars",K_SAMPLE_NUM
							;数据输出位置，大小为K_SAMPLE_NUM，用来保存一批数据，以便查看采样是否正确，也可以供需要分批处理的数据的程序调用，例如FFT，程序中可以用ARX来指定数据的首地址
in_data			.usect 	"in_vars",1
d_cr0_send    	.usect	"cr_send",1
d_cr1_send		.usect	"cr_send",1
							;定义2个状态词，此状态词就是需要写入TLV1571的初始值
d_temp 			.usect 	"temp",1
k_cr0_send		.set 	0080h
k_cr1_send		.set	0100h



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
	stm     #0029h,TCR   ;初始化TDDR
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
		LD 		#K_SAMPLE_NUM,A		;用以计数
		stm		#out_data,ar5
				
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

*******************************************************************
*************等中断，用A做计数器，当写完K_SAMPLE_NUM个数据后*******
*************，重置计数器，并使ARS指向out_data的开始地址***********
*******************************************************************

WAIT:	NOP
		BC WAIT,ANEQ
		NOP
		STM		#out_data,ar5
		LD 		#K_SAMPLE_NUM,A
		B WAIT
		NOP
				
*******************************************************************
*************中断服务程序，用以读转换信号，放入out_data区**********
*******************************************************************

jump:  	
		SUB #1h,A		;计数
		rsbx 	xf		;发出读信号，AD收到后开始下一次采样
		rpt		#5
		nop
		portr		07FFFh,*ar5		;读AD转换数据,写在RAM的out_data段
		
		rpt #5
		nop
		ssbx 	xf
		nop
		portr  0FFFFh,*ar2	;抬高端口电压
		nop
		nop
		portw	*ar5+,0BFFFh ;写DA
		rete				 ;中断返回
		.end
																				
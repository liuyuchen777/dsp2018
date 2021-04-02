			.mmregs
				;.ref	filter_start
				.def    START
K_DATA_SIZE		.set	256
K_BUFFER_SIZE	.set	32
								;缓冲大小，必须大于a+b,并且必须是2的整数幂
K_STACK_SIZE	.set	256		;堆栈大小
;K_A				.set	9		;a
K_B				.set	21		;b
K_CIR			.set	K_BUFFER_SIZE

STACK			.usect	"stack",K_STACK_SIZE
SYSTEM_STACK	.set	K_STACK_SIZE+STACK

DATA_DP			.usect	"filter_vars",0
filterdata		.usect	"filter_vars",K_DATA_SIZE
;bufferdatay		.usect	"filter_vars",K_BUFFER_SIZE*2
bufferdatax		.usect	"filter_vars",K_BUFFER_SIZE*2

		.data
		.global	inputdata
inputdata
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0
	.WORD	21315,	 4595,	-2444,	11368,	15066,	-2014,	-8408, 	 6957
	.WORD	12879,	-1643,	-5536,	11893,	19128,	 4966,    428,	0


		.text
		.asg	AR2,ORIGIN
		.asg	AR3,INPUT
		.asg	AR4,FILTER
		.asg	AR5,OUTPUT
		
START:
		NOP
		NOP
		NOP
		NOP
		SSBX	FRCT
		NOP
		NOP
		NOP
		NOP
		SSBX	INTM ;set value 1, close interruption
		NOP
		NOP
		NOP
		NOP
		;LD		#DATA_DP,DP
		STM		#STACK+K_STACK_SIZE,SP
		CALL	filter_start
		NOP
		NOP
		NOP
		
LOOP:
		B		LOOP


**************************************************************
****X(z)   0.1589+0.4768*(z-1)+0.4768*(z-2)+0.1589*(z-3)   ***
****---- = -----------------------------------------------****
****Y(z)   1- ( -0.1268*(z-1)+0.5239*(z-2)-0.1257*(z-3))  ***
**************************************************************

		
a1	.set	03fcH
a2	.set	0321H
a3	.set	-0000H
a4	.set	-0406H
a5	.set	-06a1H
a6	.set	-05a2H
a7	.set	0000H
a8	.set	0960H
a9	.set	13e6H
a10	.set	1c23H
a11	.set	1cb3H
a12	.set	1c23H
a13	.set	13e6H
a14	.set	0960H
a15	.set	0000H
a16	.set	-05a2H
a17	.set	-06a1H
a18	.set	-0406H
a19	.set	-0000H
a20	.set	0321H
a21	.set	03fcH
	
	.text
filter_start:
		STM		#K_CIR,BK
		STM		#1,AR0				;设置缓冲区大小和步长
		STM		#inputdata,ORIGIN	
		STM		#bufferdatax,INPUT
		;STM		#bufferdatay,FILTER
		STM		#filterdata,OUTPUT
										;初始化
		RPT		#20-1				    ;a1,a2,a3的个数
		MVDD	*ORIGIN+,*INPUT+0%	    ;初始化头三个Xs
		
		;STM		#bufferdatax,INPUT
		;RPT		#K_A-1					;a1,a2,a3的个数
		;MVDD	*INPUT+0%,*FILTER+0%	;初始化3个Ys
		
		;STM		#bufferdatay,FILTER
										;滤波
		STM		#K_DATA_SIZE-20-1,BRC	;头三个直接通过
		RPTB	filter_end-1
				
										;等待硬件中断
		MVDD	*ORIGIN+,*INPUT

		RPT		#21-1-1
		MAR		*INPUT-0%
		LD		#0,A

		MPY		*INPUT+0%,#a21,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a20,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a19,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a18,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a17,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a16,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a15,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a14,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a13,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a12,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a11,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a10,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a9,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a8,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a7,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a6,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a5,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a4,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a3,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a2,B			;B=b4*x(i)
		ADD		B,A
		MPY		*INPUT+0%,#a1,B			;B=b4*x(i)
		ADD		B,A

		;STH		A,*FILTER-0%
		STH		A,*OUTPUT+
		;MAR		*FILTER-0%
		NOP

filter_end:
		NOP
		RET
		.end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
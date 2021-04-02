*************************************
*************ÂË²¨ ³ÌÐò***************
*************************************

				.mmregs
				;.ref	filter_start
				.def	START 
K_DATA_SIZE		.set	256		;input data number
K_BUFFER_SIZE	.set    8		;buffer > a and b,buffer=2e
K_STACK_SIZE	.set 	256		
K_A				.set 	3		;a var number
K_B				.set 	4		;b var number
K_CIR			.set 	K_BUFFER_SIZE

STACK 			.usect	"stack",K_STACK_SIZE
SYSTEM_STACK	.set 	K_STACK_SIZE+STACK

DATA_DP			.usect	"filter_vars",0
filterdata		.usect	"filter_vars",K_DATA_SIZE
bufferdatay		.usect	"filter_vars",K_BUFFER_SIZE*2
bufferdatax		.usect	"filter_vars",K_BUFFER_SIZE*2

				.data
				.global inputdata
inputdata
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
	.WORD 21315,  4595, -2444, 11368, 15066, -2014, -8408,  6957
	.WORD 12897, -1643, -5536, 11893, 19128,  4966,   428, 16305
				
				
				.text
				.asg AR2,ORIGIN
				.asg AR3,INPUT
				.asg AR4,FILTER
				.asg AR5,OUTPUT
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
				SSBX	INTM
				NOP
				NOP
				NOP
				NOP
				;LD		#DATA_DP,DP
				STM		#STACK,SP
				CALL	filter_start
				NOP
				NOP
				NOP
LOOP:
				B 	LOOP
				
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
* Y(z)    0.1589+0.4768*(z-1)+0.4768*(z-2)+0.1589*(z-3)   *
*------ = ----------------------------------------------  *
* X(z)    1-(-0.1268*(z-1)+0.5239*(z-2)-0.1257(z-3))      *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
				.def 	b1,b2,b3,b4,a1,a2,a3
				.def 	filter_start	
b1				.set 	1456H	;b1=0.1589
b2				.set 	3D07H	;b2=0.4786
b3				.set 	3D07H	;b3=0.4786
b4				.set 	1456H	;b4=0.1589
a1				.set   -103AH	;a1=-0.1268
a2				.set    430FH	;a2=0.5239
a3				.set   -1016H	;a3=-0.1257

				.text
filter_start:
				STM		#K_CIR,BK
				STM		#1,AR0
				STM		#inputdata,ORIGIN
				STM		#bufferdatax,INPUT
				STM		#bufferdatay,FILTER
				STM		#filterdata,OUTPUT
				
				RPT		#K_A-1
				MVDD	*ORIGIN+,*INPUT+0%
				STM		#bufferdatax,INPUT
				
				RPT		#K_A-1
				MVDD	*INPUT+0%,*FILTER+0%
				STM		#bufferdatay,FILTER
				;STM		#bufferdatax,INPUT
				
				STM		#K_DATA_SIZE-3-1,BRC
				RPTB	filter_end-1
				
				;wait interupt
				
				MVDD	*ORIGIN+,*INPUT
				RPT		#K_B-1-1
				MAR		*INPUT-0%
				MPY		*INPUT+0%,#b4,B
				LD		B,A
				MPY		*INPUT+0%,#b3,B		
				ADD 	B,A
				MPY		*INPUT+0%,#b2,B
				ADD     B,A
				MPY		*INPUT+0%,#b1,B
				ADD 	B,A
				MPY		*FILTER+0%,#a3,B
				ADD 	B,A
				MPY		*FILTER+0%,#a2,B
				ADD 	B,A
				MPY		*FILTER+0%,#a1,B
				ADD 	B,A
				STH		A,*FILTER-0%
				STH		A,*OUTPUT+
				MAR		*FILTER-0%
				NOP
filter_end:
				NOP
				NOP
				RET
				.end
		







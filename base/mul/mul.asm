;addition
;完成两个16位数的乘法程序	
			.mmregs
			.def start
mul_num1 	.usect "mul_vars",1
mul_num2 	.usect "mul_vars",1
mul_result 	.usect "mul_vars",1
			.text
start:
			stm #mul_num1,ar1	;采用间接寻址方式
			stm #mul_num2,ar2
			stm #mul_result,ar3
			st #1234h,*ar1
			st #5678h,*ar2
			ld *ar1,16,a
			mpya *ar2
			sth b,*ar3+
			stl b,*ar3		
lop:
			nop
			b lop	
			.end
		
	
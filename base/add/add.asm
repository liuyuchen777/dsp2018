;addition
;完成两个16位数的加法程序	
			.mmregs
			.def start
add_num1 	.usect "add_vars",1
add_num2 	.usect "add_vars",1
add_result 	.usect "add_vars",1
			.text
start:
			stm #add_num1,ar1	;采用间接寻址方式
			stm #add_num2,ar2
			stm #add_result,ar3
			st #1234h,*ar1
			st #5678h,*ar2
			ld *ar1,a
			add *ar2,a
			stl a,*ar3		
lop:
			nop
			b lop	
			.end
		
	
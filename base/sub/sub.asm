
;subtraction
;完成两个16位数的减法程序	
			.mmregs
			.def start
sub_num1 	.usect "sub_vars",1
sub_num2 	.usect "sub_vars",1
sub_result 	.usect "sub_vars",1
			.text
start:
			stm #sub_num1,ar1	;采用间接寻址方式
			st 	#5678h,*ar1+
			st  #1234h,*ar1+
			stm #sub_num1,ar1	;采用间接寻址方式
			ld  *ar1+,a
			sub *ar1+,a
			stl a,*ar1		
lop:
			nop
			b lop	
			.end
		
	
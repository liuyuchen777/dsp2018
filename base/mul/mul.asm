;addition
;�������16λ���ĳ˷�����	
			.mmregs
			.def start
mul_num1 	.usect "mul_vars",1
mul_num2 	.usect "mul_vars",1
mul_result 	.usect "mul_vars",1
			.text
start:
			stm #mul_num1,ar1	;���ü��Ѱַ��ʽ
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
		
	
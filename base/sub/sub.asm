
;subtraction
;�������16λ���ļ�������	
			.mmregs
			.def start
sub_num1 	.usect "sub_vars",1
sub_num2 	.usect "sub_vars",1
sub_result 	.usect "sub_vars",1
			.text
start:
			stm #sub_num1,ar1	;���ü��Ѱַ��ʽ
			st 	#5678h,*ar1+
			st  #1234h,*ar1+
			stm #sub_num1,ar1	;���ü��Ѱַ��ʽ
			ld  *ar1+,a
			sub *ar1+,a
			stl a,*ar1		
lop:
			nop
			b lop	
			.end
		
	
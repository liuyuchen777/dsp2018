	;addition
;完成两个16位数的加法程序	
	.mmregs
	.def start
div_beichushu .usect "div_vars",1
div_chushu .usect "div_vars",1
div_shang .usect "div_vars",1
div_yushu .usect "div_vars",1
	.text
start:
	stm #div_beichushu,ar1	;采用间接寻址方式
	stm #div_chushu,ar2
	stm #div_shang,ar3
	stm #div_yushu,ar4
	st #0008h,*ar1
	st #0002h,*ar2
	rsbx sxm
	ld *ar1,a
	rpt #0fh
	subc *ar2,a
	stl a,*ar3
	sth a,*ar4
lop:
	nop
	b lop	
	.end
		
	
	
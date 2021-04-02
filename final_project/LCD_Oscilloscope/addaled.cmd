
/*ad.obj*/
/*vector.obj*/
-m ad.map
-o ad.out
-e reset

MEMORY{
      PAGE 0:      
            VEC :  org = 1c00H   len = 0080H   /*中断向量位置*/
			PROG : org = 0x1d00   len = 0x3000 /*program*/
      PAGE 1:
            STACKS:  origin = 0x0200   length = 0x0500
			TEMPDATA:origin = 0x0700   length = 0x0500
			IDATA:	origin = 0x1000    length = 0x0800
       }
SECTIONS{
       vectors:     {} > VEC   PAGE 0
       prog:        {} >PROG   PAGE 0
	   .text:		{} >PROG   PAGE 0
	   stack_section: {} >STACKS PAGE 1
	   out_vars:   {} >TEMPDATA PAGE 1
	   in_vars:    {} >TEMPDATA PAGE 1
       cr_send:    {} >TEMPDATA PAGE 1
	   temp:       {} >TEMPDATA PAGE 1
	   pmst:       {} >TEMPDATA PAGE 1
	   .data     {} > IDATA PAGE 1
      }
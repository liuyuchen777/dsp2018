div.obj
-e start
-m div.map
-o div.out
MEMORY
{
	PAGE 0:		
	 	PROG	:origin=0x1000,length=0x1000	
	PAGE 1:
		DATA	:origin=0x0100,length=0x0900	  
}

SECTIONS
{
	.text			{}>PROG		PAGE 0
	div_vars		{}>DATA     PAGE 1
}



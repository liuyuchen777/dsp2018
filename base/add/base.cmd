add.obj
-e start
-m add.map
-o add.out
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
	add_vars		{}>DATA     PAGE 1
}





MEMORY  {
        PAGE 0:
	         	vectorram:    	origin = 1C00h   	length = 0080h
	         	textram:		origin = 0100h		length = 0300h
        PAGE 1:
        		bssram:			origin = 0400h		length = 0100h
        		stackram:		origin = 0500h		length = 0400h
        		constram:		origin = 0900h		length = 0100h
        		userram:		origin = 0A00h		length = 0400h
        		
                
               
        }                               
SECTIONS{
        vectors 	: >		vectorram	PAGE 0
        .text		: >		textram		PAGE 0 
        .bss		: >		bssram		PAGE 1
        .stack		: >		stackram	PAGE 1
        .const		: >		constram	PAGE 1  
 
        }

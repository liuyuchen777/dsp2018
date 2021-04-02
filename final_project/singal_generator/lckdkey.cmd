-stack 5000h
MEMORY  {
	        PAGE 0:
		         	vectorram:    	origin = 1C00h   	length = 0080h
		         	textram:		origin = 0100h		length = 1000h
	        PAGE 1:
	        		dataram:		origin = 1000h		length = 1000h
	        		userram:		origin = 2000h		length = 1000h
				    stackram:		origin = 3000h		length = 5000h
        } 
                                      
SECTIONS{
	        vectors 	: >		vectorram	PAGE 0
	        .text		: >		textram		PAGE 0 
	        .data		: >		dataram		PAGE 1
	        .stack		: >		stackram	PAGE 1
			.cinit      : >     userram     PAGE 1
 
        }
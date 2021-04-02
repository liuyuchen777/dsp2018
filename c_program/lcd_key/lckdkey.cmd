-stack 5000h
MEMORY  {
	        PAGE 0:
		         	vectorram:    	origin = 1C00h   	length = 0080h
		         	textram:		origin = 0100h		length = 0800h
	        PAGE 1:
	        		dataram:		origin = 1000h		length = 0200h
	        		userram:		origin = 1200h		length = 0400h
				    stackram:		origin = 1600h		length = 5000h
                  
        } 
                                      
SECTIONS{
	        vectors 	: >		vectorram	PAGE 0
	        .text		: >		textram		PAGE 0 
	        .data		: >		dataram		PAGE 1
	        .stack		: >		stackram	PAGE 1
			.cinit      : >     userram     PAGE 1
 
        }
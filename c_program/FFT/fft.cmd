

MEMORY  {
        PAGE 0:
	         	vectorram:    	origin = 1C00h   	length = 0080h
	         	textram:		origin = 0100h		length = 0F00h
        PAGE 1:
        		bssram:			origin = 1000h		length = 0100h
        		stackram:		origin = 1100h		length = 0400h
        		constram:		origin = 1500h		length = 0100h
        		dataram:		origin = 1600h		length = 0100h
        		userram:		origin = 1D00h		length = 3000h
        		
                
               
        }                               
SECTIONS{
        vectors 	: >		vectorram	PAGE 0
        .text		: >		textram		PAGE 0 
        .bss		: >		bssram		PAGE 1
        .stack		: >		stackram	PAGE 1
        .const		: >		constram	PAGE 1
        .data		: >		dataram		PAGE 1
        data_buf1	: >		userram		PAGE 1
        data_buf2	: >		userram		PAGE 1
        data_buf3	: >		userram		PAGE 1
        data_buf4	: >		userram		PAGE 1
        data_buf5	: >		userram		PAGE 1
 
        }

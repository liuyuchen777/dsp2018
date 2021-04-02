/*************************************
*
* Title:		keyboard.cmd
* Description:	Configure file
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/12/2
*
* LAST UPDATE: 	04/12/2 14:54
*
*************************************/

led.obj
vectors.obj
-m led.map
-o led.out
-e RESET

MEMORY
{
    PAGE 0: VECT:       origin = 0x1C00,        len = 0x0080
    		EPROG:      origin = 0x1D00,        len = 0x3000
            
    PAGE 1: IDATA:      origin = 0x0200,        len = 0x0800
    		ISTACK:		origin = 0x1000,		len = 0x0200          
}

SECTIONS
{
    .vectors: {} > VECT  PAGE 0
    .text:    {} > EPROG PAGE 0
    .data     {} > IDATA PAGE 1
    .stack	  {} > ISTACK PAGE 1
}

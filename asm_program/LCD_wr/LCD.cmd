/*************************************
*
* Title:		LCD.cmd
* Description:	Configure file
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/11/25
*
* LAST UPDATE: 	04/11/25 15:50
*
*************************************/

LCD.obj
vectors.obj
-m LCD.map
-o LCD.out
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

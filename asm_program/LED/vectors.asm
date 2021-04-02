*************************************
*
* Title:		vectors.asm
* Description:	Configure file
* Company:		HUST HUDAX
* Author: 		SEAMAN(G.J.H)
* Version: 		V1.0
* Found Date:	04/12/02
*
* LAST UPDATE: 	04/12/02 15:50
*
*************************************
        .sect ".vectors"
		.def RESET
        .ref start              ; asm entry point
        .ref OPERATION
        
        .align  0x80            ; must be aligned on page boundary

RESET:                          ; reset vector
        BD start                ; branch to asm entry point
        STM #1000,SP            ; stack size of 200
nmi:    RETE                    ; enable interrupts and return from one
                NOP
                NOP
                NOP			     ;NMI~

                ; software interrupts
sint17 .space 4*16
sint18 .space 4*16
sint19 .space 4*16
sint20 .space 4*16
sint21 .space 4*16
sint22 .space 4*16
sint23 .space 4*16
sint24 .space 4*16
sint25 .space 4*16
sint26 .space 4*16
sint27 .space 4*16
sint28 .space 4*16
sint29 .space 4*16
sint30 .space 4*16

int0:   RETE
                NOP
                NOP
                NOP
int1:   RETE
                NOP
                NOP
                NOP
int2:   RETE
                NOP
                NOP
                NOP
                
tint:   RETE
                NOP
                NOP
                NOP
rint0:  RETE
                NOP
                NOP
                NOP
xint0:  RETE
                NOP
                NOP
                NOP
rint1:  RETE
                NOP
                NOP
                NOP
tint1:  RETE
                NOP
                NOP
                NOP
int3:   RETE
                NOP
                NOP
                NOP
                .end

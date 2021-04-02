
   .sect	"vectors"
   .global	_c_int00
   .mmregs   

reset:
        B		_c_int00
		NOP
		NOP
nmi:	
        RETE
		NOP
		NOP
		NOP

;software interrupts
sint17          .space 4*16
sint18          .space 4*16
sint19          .space 4*16
sint20          .space 4*16
sint21          .space 4*16
sint22          .space 4*16
sint23          .space 4*16
sint24          .space 4*16
sint25          .space 4*16
sint26          .space 4*16
sint27          .space 4*16
sint28          .space 4*16
sint29          .space 4*16
sint30          .space 4*16

int0:	RETE
		NOP
		NOP
		NOP

int1:	RETE
		NOP
		NOP
		NOP

int2:	RETE
		NOP
		NOP
		NOP

tint0:	RETE
		NOP
		NOP
		NOP

brint0:	RETE
		NOP
		NOP
		NOP

bxint0:	RETE
		NOP
		NOP
		NOP

dmac0:	RETE
		NOP
		NOP
		NOP

dmac1:	RETE
		NOP
		NOP
		NOP

int3:	RETE
		NOP
		NOP
		NOP

hpint:	RETE
		NOP
		NOP
		NOP

dmac2:	RETE
		NOP
		NOP
		NOP

bxint1:	RETE
		NOP
		NOP
		NOP

dmac4:	RETE
		NOP
		NOP
		NOP
		
dmac5:	RETE
		NOP
		NOP
		NOP
		
rsvd1:  RETE
		NOP
		NOP
		NOP
		 
rsvd2:  RETE
		NOP
		NOP
		NOP 
		;.end
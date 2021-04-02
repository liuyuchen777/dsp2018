DEBUG/ad.obj
DEBUG/vector.obj
-m ad.map
-o ad.out
-e reset

MEMORY
{
    PAGE 0:
		VEC		:origin=0x1c00,length=0x0080
        PROG	:origin=0x1d00,length=0x1000

    PAGE 1:
        STACKS  :origin=0x0200,length=0x0300
}

SECTIONS
{
    vectors:        {}>VEC      PAGE 0
    prog:           {}>PROG     PAGE 0
    stack_section:  {}>STACKS   PAGE 1
}






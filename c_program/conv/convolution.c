
#include<math.h>
#pragma DATA_SECTION(x,"data_buf1")			//在data_buf1段为x分配数据空间
int	x[4];
#pragma DATA_SECTION(h,"data_buf2")			//在data_buf2段为h分配数据空间
int	h[4];
#pragma DATA_SECTION(y,"data_buf3")			//在data_buf3段为y分配数据空间
int	y[7];

void main(void)
{	int i,k,a,b;
	for(i=0;i<4;i++)						//为x,h赋值
	{	x[i]=i;
		h[i]=i;
	}
	for(i=0;i<7;i++)						//卷积
	{	y[i]=0;
		if(i-3<0)
		{	a=0;
			b=i;
		}	
		else
		{	a=i-3;
			b=3;
		}		
		for(k=a;k<=b;k++)
			y[i]=y[i]+x[k]*h[i-k];
	}
}


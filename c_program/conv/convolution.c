
#include<math.h>
#pragma DATA_SECTION(x,"data_buf1")			//��data_buf1��Ϊx�������ݿռ�
int	x[4];
#pragma DATA_SECTION(h,"data_buf2")			//��data_buf2��Ϊh�������ݿռ�
int	h[4];
#pragma DATA_SECTION(y,"data_buf3")			//��data_buf3��Ϊy�������ݿռ�
int	y[7];

void main(void)
{	int i,k,a,b;
	for(i=0;i<4;i++)						//Ϊx,h��ֵ
	{	x[i]=i;
		h[i]=i;
	}
	for(i=0;i<7;i++)						//���
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


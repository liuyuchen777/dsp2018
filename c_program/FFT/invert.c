
//#include<stdio.h>
#include<math.h>
#pragma DATA_SECTION(num,"data_buf1")
int num[8];

void main(void)
{
	int i,m=0,n,k,q;
	for(i=0;i<=7;i++)
		num[i]=i;
	for(i=0;i<=7;i++)
	{
		q=num[i];
		for(k=0;k<=2;k++)
		{
			n=q%2;
			q=q/2;
			m=m+n*pow(2,(2-k));
		}
		num[i]=m;
		m=0;
	}
}


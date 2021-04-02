//#include"stdio.h"
//#include"stdlib.h"
#include<math.h>
#define pi 3.1415926536
#define N 1024
#pragma DATA_SECTION(output,"data_buf1")	//在data_buf1段为output分配数据空间
float output[N];
#pragma DATA_SECTION(input,"data_buf2")		//在data_buf2段为input分配数据空间
float input[N];
#pragma DATA_SECTION(num,"data_buf3")		//在data_buf3段为num分配数据空间
long num[N];
#pragma DATA_SECTION(d,"data_buf4")			//在data_buf4段为d分配数据空间
float d[N][2];
#pragma DATA_SECTION(w,"data_buf5")			//在data_buf5段为w分配数据空间
float w[N/2][2];

main()
{
	long i,j,m,n,k,q,s,t,p;
	float a0,a1,b0,b1;
	input[0]=0;								//输入正弦信号
	input[1]=0.707;
	input[2]=1;
	input[3]=0.707;
	input[4]=0;
	input[5]=-0.707;
	input[6]=-1;
	input[7]=-0.707;
	for(i=0;i<8;i++)
		{	for(k=1;k<128;k++)
			{	input[8*k+i]=input[i];
			}
		}
	p=log(N)/log(2);						//计算阶数
	for(i=0;i<N;i++)						//求倒序数
	{	q=i;
		m=0;
		for(k=0;k<p;k++)
		{	n=q%2;
			q=q/2;			
			m=m+n*ceil(pow(2,(p-1-k)));
		}
		num[i]=m;
	}
	for(i=0;i<N;i++)						//将输入正弦信号倒序
	{	d[i][0]=input[num[i]];
		d[i][1]=0;
	}	

	for(i=0;i<p;i++)						//FFT
 	{	for(m=0;m<pow(2,i);m++)				//产生三角因子
   		{ 	w[m][0]=(cos(2*pi*m/(pow(2,i+1))));
     		w[m][1]=(-sin(2*pi*m/(pow(2,i+1))));
   		}
   		for(j=0;j<N;j=j+ceil(pow(2,i+1)))	//蝶形运算
    	{	for(k=0;k<ceil(pow(2,i));k++)
      		{	s=(j+k);
       			t=(j+k+ceil(pow(2,i)));
       			a0=(d[s][0]+w[k][0]*d[t][0]-w[k][1]*d[t][1]);
       			a1=(d[s][1]+w[k][0]*d[t][1]+w[k][1]*d[t][0]);
       			b0=(d[s][0]-w[k][0]*d[t][0]+w[k][1]*d[t][1]);
       			b1=(d[s][1]-w[k][0]*d[t][1]-w[k][1]*d[t][0]);
       			d[s][0]=a0;
       			d[s][1]=a1;
       			d[t][0]=b0;
       			d[t][1]=b1;
       		}
     	}
   	}
	for(i=0;i<N;i++)
	{	output[i]=d[i][0]*d[i][0]+d[i][1]*d[i][1];	//计算功率谱
	}
}



ioport unsigned port0bfff;						//定义输出端口

#define IOSR port0bfff
#define COSX 0.999390827						//cos(pi/180)的大小

#pragma DATA_SECTION(cosx,"data_buf1")			//在data_buf1段为cosx分配数据空间
float cosx;
#pragma DATA_SECTION(dacdata,"data_buf2")		//在data_buf2段为dacdata分配数据空间
int dacdata;
unsigned int i;

void delay(void);
void main(void)
{
	float temp1,temp2;
	temp1=1.000;
	temp2=COSX;	
	while(1)
	{ 
    	cosx=2*COSX*temp2-temp1;				//计算cosx的值
     	dacdata=cosx*2047+2048;					//将cosx的值放大移位
     	IOSR=dacdata;							//输出cosx的值
     	temp1=temp2;
     	temp2=cosx;
     	delay();								//延时
  	}
}

void delay(void)
{
	long int j;
	for(j=0;j<1000;j++)
		asm("	NOP");
}



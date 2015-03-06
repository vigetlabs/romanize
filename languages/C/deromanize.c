#include<stdio.h>
#include<string.h>

static const char* roman[]=        {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"  };
static const unsigned int arabic[]={  1,   4,  5,   9, 10,  40, 50,  90,100, 400,500, 900,1000 };

unsigned int val_roman_recursive(const char* rstring,int location)
{
	if(location<0 || (*rstring=='\0')) return 0;
	unsigned int val=0;
	unsigned int rlen=1+(location & 1);
	while(strncmp(rstring,roman[location],rlen)==0)
	{
		rstring+=rlen;
		val+=arabic[location];
	}
	return val+val_roman_recursive(rstring,location-1);
}

unsigned int val_roman(const char* rstring)
{
	return val_roman_recursive(rstring,sizeof(arabic)/sizeof(arabic[0])-1);
}

int main(int argc,char** argv)
{
	if(argc > 1)
	{
		printf("%u\n",val_roman(argv[1]));
	}
	return 0;
}

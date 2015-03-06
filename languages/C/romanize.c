#include<stdio.h>
#include<stdlib.h>

static const char* roman[]=        {"I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"  };
static const unsigned int arabic[]={  1,   4,  5,   9, 10,  40, 50,  90,100, 400,500, 900,1000 };

void print_roman_recursive(unsigned int val,int location)
{
	if(location<0) return;
	unsigned int i,num=val / arabic[location];
	for(i=0;i<num;i++)
	{
		printf("%s",roman[location]);
	}
	print_roman_recursive(val % arabic[location],location-1);
}

void print_roman(unsigned int val)
{
	print_roman_recursive(val,sizeof(arabic)/sizeof(arabic[0])-1);
}

int main(int argc,char** argv)
{
	if(argc > 1)
	{
		print_roman(atoi(argv[1]));
		printf("\n");
	}
	return 0;
}

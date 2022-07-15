#include<stdio.h>

int main(){
	char i;
	
	printf("ÇëÊäÈë×ÖÄ¸:");
	
	for(;i != 'n';)
	{
		i = getchar();
		switch(i)
		{
		case 'A': case 'B': case 'C': i = '2';break;
		case 'D': case 'E': case 'F': i = '3';break;
		case 'G': case 'H': case 'I': i = '4';break;
		case 'J': case 'K': case 'L': i = '5';break;
		case 'M': case 'N': case 'O': i = '6';break;
		case 'P': case 'Q': case 'R': i = '7';break;
		case 'T': case 'V': case 'U': i = '8';break;
		case 'W': case 'Y': case 'X': i = '9';break;
	}
		putchar(i);
	}
	return 0;
}
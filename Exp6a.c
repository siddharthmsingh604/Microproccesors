#include<stdio.h>
void main(){
	int a,b,c,d,e,f;
	printf("Enter two integer for operations: \n");
	scanf("%d%d",&a,&b);
	
	asm{
		mov ax,a
		mov bx,b
		
		add ax,bx
		mov c,ax
		
		mov ax,a
		sub ax,bx
		mov d,ax
		
		mov ax,a
		mul bx
		mov e,ax
		
		mov ax,a
		div bx
		mov f,ax
	}
	
	printf("Addition of %d and %d is: %d\n",a,b,c);
	printf("Subtraction of %d and %d is: %d\n",a,b,d);
	printf("Multiplication of %d and %d is: %d\n",a,b,e);
	printf("Division of %d and %d is: %d\n",a,b,f);
}

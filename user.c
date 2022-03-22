#include <stdio.h>
int main() {
	int pass, x=10;	

	while (x!=0)
	{
	printf("\nInput the password: ");
	scanf("%d",&pass);	
	
	if (pass==1234)
	{
		printf("Correct password");
		x=0;
    }
    else
    {
       printf("Wrong password, try another");       
	}
	printf("\n");
   }
	return 0;
} 

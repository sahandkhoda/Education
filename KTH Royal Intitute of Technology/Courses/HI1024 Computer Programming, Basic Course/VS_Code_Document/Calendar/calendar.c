#include <stdio.h>
#define nbDAYS 31
#define firstDAY 3

int main (void)
{
    printf("Welcome to your calendar.\n");
        
    for (int i = 0; i < (nbDAYS + firstDAY - 1); i++)
    {
        if(i < (firstDAY-1))
            printf("   ");
        else
            printf("%2d ", i-1);

        if (((i+1) % 7) == 0)
            printf("\n"); 
    }
    return 0;
}
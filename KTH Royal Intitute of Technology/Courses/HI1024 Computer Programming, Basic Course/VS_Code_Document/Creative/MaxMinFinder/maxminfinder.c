#include <stdio.h>

int main(void)
{
    int NUM, MIN = 0, MAX = 0;
    printf("Welcome to Max Min Finder (MMF)\n");
    
    int i = 0;
    do  
    {   
        printf("Enter a number (exit with 0) :   ");
        scanf("%d", &NUM);
        if (MAX<NUM) MAX = NUM;
        if (MIN>NUM) MIN = NUM;

        i++;
            
    } while (NUM != 0);

    printf("You entered %d number(s) (excluding 0)\n", i-1);
    printf("MIN number = %d\n", MIN);
    printf("MAX number = %d\n", MAX);

    printf("\nMMF - DONE!\n");

    return 0;
}
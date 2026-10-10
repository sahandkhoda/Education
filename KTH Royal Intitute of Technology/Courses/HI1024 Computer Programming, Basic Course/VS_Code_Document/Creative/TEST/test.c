#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    printf("Welcome to Random Number Generator.\n");

    srand(time(0));

    for (int i = 0; i < 5; i++)
    {
        printf("#%d : %02d\n", i+1, rand()%100);
    }
    
    return 0;
}
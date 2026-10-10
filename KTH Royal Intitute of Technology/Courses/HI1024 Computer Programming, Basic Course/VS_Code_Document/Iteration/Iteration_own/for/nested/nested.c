#include <stdio.h>
#define SIZE 4

int main(void)
{
    for(int i = 0; i < SIZE; i++)
    {
        for(int k = 0; k < SIZE; k++)
        {
            printf("(%d,%d) ", i, k);
        }
    printf("\n"); 
    }
    return 0;
}
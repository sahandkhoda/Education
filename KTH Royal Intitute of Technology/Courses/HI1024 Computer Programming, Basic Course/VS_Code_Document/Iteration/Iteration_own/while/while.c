#include <stdio.h>

int main(void)
{
    int i = 0;
    int k;

    while(i <= 10)
    {
        printf("%d ", i);
        k = i;

        while(k > 0)
        {
            printf("%d ", k-1);
            k--;
        }
    
        i++;
        printf("\n");
    }

    return 0;
}
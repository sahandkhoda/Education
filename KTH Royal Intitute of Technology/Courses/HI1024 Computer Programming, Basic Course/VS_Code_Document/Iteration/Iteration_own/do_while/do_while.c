#include <stdio.h>

int main(void)
{
    int i = 0;
    int k;

    do
    {
        printf("%d ", i);

        k = i;
        do
        {
            printf("%d ", k-1);
            k--;
        } while (k > 0);

        i++;
        printf("\n");

    } while(i <= 10);

    return 0;
}
#include <stdio.h>

int main(void)
{
    printf("The while(...) loop\n");

    int counter = 1;
    
    while(counter<=5)              
    {
        printf("%d\n", counter);
        counter++;
    }
    return 0;
}
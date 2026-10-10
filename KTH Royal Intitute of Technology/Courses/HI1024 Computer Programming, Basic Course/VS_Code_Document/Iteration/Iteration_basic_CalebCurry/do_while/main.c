#include <stdio.h>

int main(void)
{
    printf("The do(...) while loop\n");

    int counter = 1;
    
    do              
    {
        printf("%d\n", counter);
        counter++;
    } while(counter<=5);
    
    return 0;
}
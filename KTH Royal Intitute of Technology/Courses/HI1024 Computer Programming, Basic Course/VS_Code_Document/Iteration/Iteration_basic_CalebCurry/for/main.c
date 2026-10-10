#include <stdio.h>

int main(void)
{
    printf("The for(...) loop\n");

    int counter;
                                                        /* Syntax: */
    for(counter=0; counter<=5; counter++)              /* for(initialize the counter; test the counter; increment/decrement the counter) {statement #1...#n} */
    {
        printf("%d\n", counter);
    }
    return 0;
}
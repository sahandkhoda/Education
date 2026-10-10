#include <stdio.h>

int main(void)
{
    int NUMBER;

    printf("How many digits?\n");
    printf("Enter an arbitrary number:  ");
    scanf("%d", &NUMBER);

    switch(NUMBER)
    {
        case    0   :   printf("One digit number\n");   break;
        case    2   :   printf("Two digit number\n");   break;
        case    3   :   printf("Three digit number\n"); break;
    }
}
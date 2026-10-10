#include <stdio.h>
int main(void)
{
    printf("\n");
    printf("Which lifeform am I?\n\n");

    int LEGS;

    printf("Enter number of legs:  ");
    scanf("%d", &LEGS);

    printf("ERROR! Type a number in the intervall of 1-10!\n", LEGS<0 || LEGS>=11);

    printf("Mammal  :   %d\n", LEGS>0 && LEGS<=4);
    printf("Insect  :   %d\n", LEGS>=5 && LEGS<=7);    
    printf("Spider  :   %d\n", LEGS==8);
    printf("Octopus :   %d\n", LEGS>8);
    
    
    printf("\n");
    printf("Which lifeform am I? DONE!\n\n"); 
    return 0;
}
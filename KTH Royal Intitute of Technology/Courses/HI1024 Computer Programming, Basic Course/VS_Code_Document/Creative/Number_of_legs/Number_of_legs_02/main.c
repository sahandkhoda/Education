#include <stdio.h>
int main(void)
{
    printf("\nWhich lifeform am I?\n\n");

    int LEGS;

    printf("Enter number of legs:  ");
    scanf("%d", &LEGS);
    {
        if(LEGS<=0)             printf("NOT AN ANIMAL. Enter a valid value above 0.\n");
        if(LEGS>0 && LEGS<=4)   printf("You're a Mammal\n");
        if(LEGS>=5 && LEGS<=7)  printf("You're a Insect\n");
        if(LEGS==8)             printf("You're a Spider\n");
        if(LEGS>8)              printf("You're an Octopus\n");
    }
    
    printf("\nWhich lifeform am I? DONE!\n\n"); 
    return 0;
}
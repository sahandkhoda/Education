#include <stdio.h>
#define DECK 52
#define RANK 13
#define SUIT 4

void printCard(int suit, int rank)
{
    switch (suit)
    {
        case 0: printf("Diamond %d\n", rank+1); break;
        case 1: printf("Club    %d\n", rank+1); break;
        case 2: printf("Heart   %d\n", rank+1); break;
        case 3: printf("Spade   %d\n", rank+1); break;
    }    
}

int main(void)
{
    printf("\n");
    printf("Welcome to Monte Carlo!\n");
    for (int suit = 0; suit < SUIT; suit++)
    {
        for (int rank = 0; rank < RANK; rank++)
        {
            printCard(suit, rank);
        }
    }
    
    printf("Monte Carlo - DONE!\n");
    return 0;
}
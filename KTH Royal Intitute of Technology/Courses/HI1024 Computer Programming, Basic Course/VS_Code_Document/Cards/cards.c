#include <stdio.h>
int main(void)
{
    printf("\n");
    printf("Welcome to Deck of Cards (DoC)\n");

    for(int SUIT = 1; SUIT <= 4; SUIT++)
    {
        for (int RANK = 1; RANK <= 13; RANK++)
        {
            // The SUIT
            switch (SUIT)
            {
            case 1: printf("Club        "); break;
            case 2: printf("Diamond     "); break;
            case 3: printf("Heart       "); break;
            case 4: printf("Spade       "); break;                        
            default: printf("NOT A SUIT\n"); break;     // This line is unnecessary needed because of the for-loop.
            }

            // The RANK
            switch (RANK)
            {
            case 1: printf("A\n"); break;
            case 2: printf("2\n"); break;
            case 3: printf("3\n"); break;
            case 4: printf("4\n"); break;
            case 5: printf("5\n"); break;
            case 6: printf("6\n"); break;
            case 7: printf("7\n"); break;
            case 8: printf("8\n"); break;
            case 9: printf("9\n"); break;
            case 10: printf("10\n"); break;
            case 11: printf("Knight\n"); break;
            case 12: printf("Queen\n"); break;
            case 13: printf("King\n\n"); break;
            default: printf("NOT A RANK!\n"); break;    // This line is unnecessary needed because of the for-loop.
            }
        }
    }
    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    // Greeting phrase
    printf("\n");
    printf("Welcome to CloseTo21.\n");

    char pick, card, choice;
    int sum = 0, score;

    // Första draget
    printf("Press 'p' to pick a card (or exit with 0) : ");   
    do
    {
        scanf(" %c", &pick);
        switch (pick)
        {
            case 'p' : continue;
            case '0' : { printf("-- Exiting program --\n"); return 0;}
            default  : printf("ERROR. Please enter a valid option : "); break;
        }

    } while (pick!='p');
    
    do
    {
        //Generera ett kort 1-13
        srand(time(0));
        card = rand()%13+1;
        printf("Card : %d\n", card);

        // Lägg på summan
        sum = sum + card;
        printf("Sum  : %d\n\n", sum);
        if (sum>21)          // Spelet slutar : mer än 21
        {
            score = 0;
            printf("The sum is higher than 21; you've lost.\n");
            printf("Score : %d\n\n", score);
            return 0;
        }

        // Spela igen?
        printf("Do you want to pick again? Yes (y) or No (n)? : ");
        scanf(" %c", &choice);

    } while (choice == 'y');
    
    switch (sum)
    {
    case 1 : break;
    
    default:
        break;
    }


    // Spelet slutar : mer än 21 eller användaren säger "Nej"
    // Om summan över 21 : 0 poäng (förlorare)
    // 01-17 : 1p
    // 18-20 : 2p
    //    21 : 3p

    return 0;
}
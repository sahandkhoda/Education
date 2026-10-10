#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int getPlayerBet(int Budget)
{
    int playerbet;
    do
    {
        printf("\n");
        printf("You have %d SEK, how much do you want to bet?\n", Budget);
        printf(" 0 kr\n");
        printf(" 1 kr\n");
        printf(" 10 kr\n");
        printf(" 100 kr\n");
        printf("Bet : ");
        do
        {
            scanf_s("%d", &playerbet);
            if (playerbet!=0 && playerbet!=1 && playerbet!=10 && playerbet!=100 && (playerbet<Budget || playerbet>Budget))
            {
                printf("Try a another number from your own budget : ");
            }
            
        } while (playerbet!=0 && playerbet!=1 && playerbet!=10 && playerbet!=100 && (playerbet<Budget || playerbet>Budget));

    } while (playerbet > Budget || playerbet < 0);
    return playerbet;
}

int getPlayerGuess()
{
    int Guess;
    do
    {
        printf("What do you want to bet on? 1 for Heads, 0 for Tails ? ");
        scanf_s("%d", &Guess);
    }
    while (Guess >= 2 && Guess < 0);
    return Guess;
}

int tossCoin()
{
    printf("tossingCoin...");
    return rand () % 2;
}

int main(void)
{
    int again=-1, Budget = 100;
    srand((unsigned)time(NULL));
    
    do
    {
        do
        {
            int playerBet = getPlayerBet(Budget);
            if (playerBet == 0)
            {
                printf("Game over! You still have %d SEK\n", Budget);
                printf("Do you want to play again? (0 for no, 1 for yes) : ");      
                do
                {
                    scanf_s("%d", &again);
                    switch (again)
                    {
                        case 0: return 0; break;
                        case 1:
                        {
                            Budget=100;
                            continue;
                        } break;          
                        default: printf("Try again! : "); break;
                    }
                } while (again>1 || again<0);
                            
            }
            else
            {
                int Guess = getPlayerGuess();
                int coin = tossCoin();

                if (coin == 0)
                {
                    printf("you got head\n");
                }
                else
                {
                    printf("You got tail\n");
                }

                if (Guess == coin)
                {
                    Budget = Budget+ playerBet;
                    printf("Congratulations! You won %d SEK\n", playerBet);
                }
                else
                {
                    Budget = Budget - playerBet;
                    printf("Sorry! You lost %d SEK\n", playerBet);
                }
            }

        } while (Budget>0);

        printf(" GAME OVER YOU LOST \n");
        printf("Do you want to play again? (0 for no, 1 for yes) : ");              
        do
            {
                scanf_s("%d", &again);
                switch (again)
                {
                    case 0: return 0;   break;
                    case 1:
                    {
                        Budget=100;
                        continue;
                    } break;          
                    default: printf("Try again! : "); break;
                }
            } while (again>1 || again<0);

    } while (again==1);

    return 0;
}
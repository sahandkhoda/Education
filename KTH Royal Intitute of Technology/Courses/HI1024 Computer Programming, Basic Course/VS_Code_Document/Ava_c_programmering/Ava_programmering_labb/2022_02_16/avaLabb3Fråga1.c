#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int getPlayerBet(int Budget)
{
    int playerbet;
    do
    {
        printf("You have %d SEK, how much do you want to bet? ", Budget);
        scanf_s("%d", &playerbet);
        if (playerbet > Budget || playerbet < 0)
        {
            printf("Try a another number from your own budget");
            }
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
    return rand () % 3;
}

int main(void)
{
    int counter = 0;
    int Budget = 100;
    srand((unsigned)time(NULL));
    do
    {
        int playerBet = getPlayerBet(Budget);
        if (playerBet == 0)
        {
            printf("Game over! You still have %d SEK\n\n", Budget);
            return 0;
        }

        
        int Guess = getPlayerGuess();
        int coin = tossCoin();
        
        if(coin == 2) continue;
        
        counter++;
        if (coin == 0) printf("you got head\n");
        else printf("You got tail\n");
        
        if (Guess == coin)
        {
            Budget = Budget+ playerBet;
            printf("Congratulations! You won %d SEK\n", playerBet);
            printf("Number of bets : %d\n\n", counter);
        } else {
            Budget = Budget - playerBet;
            printf("Sorry! You lost %d SEK\n", playerBet);
            printf("Number of bets : %d\n\n", counter);
        }

        if (counter > 0 && counter % 3 == 0 && Budget >= 50)
        {
            Budget -= 50;
            printf("The casino has withdrawn an extra fee of %d SEK\n", 50);
        }


    } while (Budget > 0);
    
    printf(" GAME OVER YOU LOST ");
    return 0;
}
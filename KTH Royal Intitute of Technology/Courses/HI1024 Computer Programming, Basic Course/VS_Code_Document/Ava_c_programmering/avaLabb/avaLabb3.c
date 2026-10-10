#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int getPlayerBet(int Budget, int maxBet)
{
    int playerbet;
    do
    {
        printf("You have %d SEK, how much do you want to bet? ", Budget);
        scanf_s("%d", &playerbet);
        if (playerbet > maxBet || playerbet < 0)
        {
            printf("Try a another number from your own budget!\n");
        }
    } while (playerbet > maxBet || playerbet < 0);
    return playerbet;
}

int getPlayerGuess()
{
    int Guess;
    do
    {
        printf("What do you want to bet on? 1 for Heads, 0 for Tails? ");
        scanf_s("%d", &Guess);
    } while (Guess > 1 && Guess < 0);
    return Guess;
}

int tossCoin()
{
    printf("tossingCoin...");
    return rand () % 2;
}

int main(void)
{
    int maximumBet = 0, Budget = 100;

    printf("Enter maximum bet : ");
    scanf_s("%d", &maximumBet);

    srand((unsigned)time(NULL));
    do
    {
        int playerBet = getPlayerBet(Budget, maximumBet);
        if (playerBet == 0)
        {
            printf("Game over! You still have %d SEK\n", Budget);
            return 0;
        }

        int Guess = getPlayerGuess();
        int coin = tossCoin();

        if (coin == 1) printf("You got head.\n");
        else printf("You got tail.\n");

        if (Guess == coin)
        {
            Budget = Budget + playerBet;
            printf("Congratulations! You won %d SEK\n\n", playerBet);
        }
        else
        {
            Budget = Budget - playerBet;
            printf("Sorry! You lost %d SEK\n\n", playerBet);
        }
    } while (Budget > 0);
    
    printf("GAME OVER YOU LOST\n");
    return 0;
}
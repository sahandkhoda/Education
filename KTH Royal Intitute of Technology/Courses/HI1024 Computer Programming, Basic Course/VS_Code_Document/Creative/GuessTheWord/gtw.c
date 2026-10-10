#include <stdio.h>
#include <string.h>
#define SIZE 100
#define ATTEMPTS 10

// Called functions
void lowerORuppercase(char letter[]);
void printBoard(char word[], char board[]);
void guessBoard(char word[], char board[], int *attempt, char *guess);

// Start of main function 
int main(void)
{
    char word[SIZE] = {};           // The answer (Player 1)
    char board[SIZE] = {};          // The playing board
    char guess;                     // Variable for character guess (Player 2)
        char *theGuess = &guess; 
    int attempt;                    // Number of current attempts.
        int *theAttempt = &attempt;

    printf("\n");
    printf("Welcome to Guess The Word (GTW) 0.1.\n");
    printf("Let Player 1 enter a word and Player 2 try to guess it! \n");
    printf("Enter a word to guess : ");
        scanf("%s", word);
        lowerORuppercase(word);     // Corrects upper- or lowercase errors.

    printBoard(word, board);
    guessBoard(word, board, theAttempt, theGuess);
    
    printf("The answer is : %s (%d characters)\n", word, strlen(word));
    printf("GTW - DONE!\n\n");
    return 0;
}

void lowerORuppercase(char letter[])
{
    if (letter[0] >= 'a') letter[0] = letter[0] - 'a' + 'A';        // First letter : uppercase
    for (int i = 1; i < strlen(letter); i++)                        // Rest of the letters : lowercase
        if (letter[i] < 'a') letter[i] = letter[i] - 'A' + 'a';
    
}

void printBoard(char word[], char board[])
{
    printf("\n");
    printf("The playing board is:\n");
    for (int i = 0; i < strlen(word); i++)
    {
        board[i] = '+';
        printf("+ ");
    }
    printf("(%d characters)\n", strlen(word));    
}

void guessBoard(char word[], char board[], int *attempt, char *guess)
{
    for (*attempt=1; *attempt<=ATTEMPTS; (*attempt)++)
    {
        printf("\n");
        printf("Try a guess : ");
        scanf(" %c", &(*guess));
        printf(" %2d : ", *attempt);

        for (int i=0; i < strlen(word); i++)
        {
                                    // For example, if the same letter has already been entered?
            if (word[i]==*guess)
            board[i] = *guess;
            printf("%c ", board[i]);
        }
    if (strcmp(word, board)==0)
        {
            printf("\n\n");
            printf("Congratulations. You solved it in %d attempts!\n", *attempt);
            break;
        }
    }
    if (*attempt > ATTEMPTS)
    {
        printf("\n\n");
        printf("FAIL! You did not guess right.\n");
    }
}
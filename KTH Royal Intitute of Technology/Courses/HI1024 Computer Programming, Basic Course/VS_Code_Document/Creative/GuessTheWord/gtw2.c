#include <stdio.h>
#include <string.h>
#define MAXCHAR  100
#define MAXATTEMPTS 3

void enterWord(char theWord[MAXCHAR]);
void uppercaseWORD(char theWord[MAXCHAR]);
void printBoard(char theWord[MAXCHAR], char theBoard[MAXCHAR]);
void enterGuess (char theWord[MAXCHAR], char theBoard[MAXCHAR], char *theGuess, int *nbGuess, int *nblife);
void uppercaseGUESS(char *aGuess);
void result(char theWord[MAXCHAR], char theBoard[MAXCHAR], int *nbLife);

int main(void)
{
    printf("\n");
    printf("Welcome to Guess The Word (GTW) 2.0\n");
    printf("Let Player 1 enter a word and Player 2 try to guess it! \n\n");

    char word[MAXCHAR];                                       // The word/answer
    char board[MAXCHAR];                                      // The Playing Board
    char guess, *ptrGuess = &guess;                           // The Guess
    int guessNumber=1, *ptrGuessNumber = &guessNumber;        // Guess number        
    int lives=MAXATTEMPTS, *ptrLife = &lives;                 // Number of lives left
    
    enterWord  (word                                          );
    printBoard (word, board                                   );  
    enterGuess (word, board, ptrGuess, ptrGuessNumber, ptrLife);
    result     (word, board, ptrLife                          );

    return 0;
}

void enterWord(char theWord[MAXCHAR])
{
    //         Instruction                     The Word               Uppercase word
    printf("Enter the word (PLAYER 1) : "); scanf("%s", theWord); uppercaseWORD(theWord);
}

void uppercaseWORD(char aWord[MAXCHAR])
{
    for (int i = 0; i < strlen(aWord); i++)             // For every character position
        if ( ('a'<=aWord[i]) && (aWord[i]<='z') )       // If character is between a-z
            aWord[i] = aWord[i] - 'a' + 'A';            // Change to uppercase letter
}

void printBoard(char theWord[MAXCHAR], char theBoard[MAXATTEMPTS])
{
    printf("The Word contains %d characters : ", strlen(theWord));
    for (int i = 0; i < strlen(theWord); i++)
    {
        theBoard[i] = '+';
        printf("%c ", theBoard[i]);
    } printf("\n\n");
}

void enterGuess (char theWord[MAXCHAR], char theBoard[MAXCHAR], char *theGuess, int *nbGuess, int *nbLife)
{
    printf("Guess a character (PLAYER 2)\n");
    do
    {
        printf("-- Lives left : %d --\n", *nbLife);
        //            Guess number                   The Guess                      Uppercase letter
        printf("Guess #%02d  : ", *nbGuess); scanf(" %c", &(*theGuess)); uppercaseGUESS(theGuess); (*nbGuess)++;
        
        int counter = 0;
        for (int i = 0; i < strlen(theWord); i++)
        {
            if (theWord[i] == *theGuess) theBoard[i] = theWord[i];
            else counter++;
            printf("%c ", theBoard[i]);

            if (counter == strlen(theWord)) (*nbLife)--;
        } printf("\n\n");

        /*
        printf("Strcmp is %d\n", strcmp(theWord, theBoard));
        printf("Word  is %s\n", theWord);                                   strcmp -1 for some odd reason?
        printf("Board is %s\n", theBoard);
        */

    } while ( *nbLife>0 && strcmp(theWord, theBoard)!=-1 );
}

void uppercaseGUESS(char *aGuess)
{
    if ( 'a'<=(*aGuess) && ((*aGuess)<='z') ) *aGuess = *aGuess - 'a' + 'A';
}

void result(char theWord[MAXCHAR], char theBoard[MAXCHAR], int *nbLife)
{  
    if (*nbLife == 0) {printf("FAIL. No more lives left!\n"); printf("The word was : %s\n", theWord);}
    else printf("Congratulations! You guessed the word with %d attempt(s) left.\n", *nbLife);
    printf("GTW - Done!\n");
}
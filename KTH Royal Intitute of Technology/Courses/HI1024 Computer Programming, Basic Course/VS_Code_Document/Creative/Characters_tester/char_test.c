#include <stdio.h>

int main(void)
{
    char LETTER;

    printf("\n");
    printf("Welcome to Characters Tester.\n");
    printf("Please enter a letter.\n\n");

    int input = 1;
    
    do
    {
        printf("Letter #%d : ", input);
            scanf(" %c", &LETTER);
        
        if (('A' <= LETTER) && (LETTER <= 'Z'))
        {
            LETTER = LETTER - 'A' + 'a';
            printf("The lowercase letter is %c.\n", LETTER);
        }
        
        input++;

    } while (LETTER!='0');

    printf("\nP.S. The output will always be a lowercase letter.\n\n");
    printf("Character tester - DONE!\n\n");
    return 0;
}
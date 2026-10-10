#include <stdio.h>
#define aSize 10

int main(void)
{
    printf("Welcome to The Vowel Analyzer (TVA).\n");
    
    char a[aSize] = {};
    int aPosition = 0;
    int *ptrPosition = &aPosition;
    int count = 0;
    char character;
    printf("\n");
    printf("Enter a sentence : ");

    do
    {
        scanf("%c", &character);                        // Läser in en bokstav och gör nödvändiga omvandlingar innan nästföljande inläsning.

        if (character >= ('a'))
            { character = character - 'a' + 'A'; }      // Omvandlar till en stor bokstav

        switch (character)
        {
            case 'A':
            {
                count++;
                while (a[*ptrPosition]!=0)
                    { (*ptrPosition)++; }

                a[*ptrPosition] = 'A'; 
            } break;
            case 'E':
            {
                count++;
                while (a[*ptrPosition]!=0)
                    { (*ptrPosition)++; }

                a[*ptrPosition] = 'E';  
            } break;
            case 'I':
            {
                count++;
                while (a[*ptrPosition]!=0)
                    { (*ptrPosition)++; }

                a[*ptrPosition] = 'I';  
            } break;
            case 'O':
            {
                count++;
                while (a[*ptrPosition]!=0)
                    { (*ptrPosition)++; }

                a[*ptrPosition] = 'O';  
            } break;
            case 'U':
            {
                count++;
                while (a[*ptrPosition]!=0)
                    { (*ptrPosition)++; }

                a[*ptrPosition] = 'U';  
            } break;
            default: break;
        }

    } while (character!=('\n'));

    if ( (count == 0) || (count == 1))
        { printf("The vowel is : { "); }
    else
        { printf("The vowels are : { "); }
    
    int i = 0;
    do
    {
        printf("[%c] ", a[i]);
        i++;
    } while (i <= *ptrPosition);
    printf("}\n");

    printf("The sentence contains %d vowels.\n", count);
    printf("TVA - DONE!\n\n");

    return 0;
}
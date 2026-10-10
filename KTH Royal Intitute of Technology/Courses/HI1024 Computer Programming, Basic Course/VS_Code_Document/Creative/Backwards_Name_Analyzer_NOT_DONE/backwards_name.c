#include <stdio.h>
#define nameSize 20

int main(void)
{
    printf("\n");
    printf("Welcome to Backwards Name Analyzer (BNA).\n");

    char character;
    int position = 0;
    char name[nameSize] = {};                                // En plats är reserverad för null: 0 <= index <= 18
    
    printf("Please type name (end with 0) : \n");

    do
    {
        scanf(" %c", &character);
        if (character >= 'a') character = character - 'a' + 'A';          // Omvandlar till stor bokstav

    } while (character != '0');
    

/*
    do
    {
        scanf(" %c", &character);
        if (character >= 'a') character = character - 'a' + 'A';          // Omvandlar till stor bokstav
        position++;

    } while (character != ('\n') && (position < (nameSize-2)) );
*/  
    printf("BNA - DONE!\n");
    return 0;
}
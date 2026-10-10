#include <stdio.h>                                                  /* Inkludera programbibliotek */
int main(int argc, char **argv)               
{
    int YEAR, MONTH, DAY;                                            /* Variabler */

    printf("\nWelcome to the SSNb format converter.\n");            /* Hälsningsfras */
    printf("Please enter SSNb (YY.MM.DD):  ");                      /* Läs in personnummer (YY.MM.DD) och skriv ut det på samma rad */
    scanf("%d.%d.%d", &YEAR, &MONTH, &DAY);     
    
    printf("\n   Year:   %04d\n", YEAR+2000);                       /* Skriv ut "   Year   : [YEAR+2000] " */

    switch(MONTH)
    {
        case 1: printf("   Month:  January\n");     break;          
        case 2: printf("   Month:  February\n");    break;
        case 3: printf("   Month:  Mars\n");        break;
        case 4: printf("   Month:  April\n");       break;
        case 5: printf("   Month:  May\n");         break;
        case 6: printf("   Month:  June\n");        break;
        case 7: printf("   Month:  July\n");        break;         /* Skriv ut "   Month  : [Namn på månad] " */
        case 8:  printf("   Month:  August\n");      break;
        case 9:  printf("   Month:  September\n");   break;
        case 10: printf("   Month:  October\n");     break;
        case 11: printf("   Month:  November\n");    break;
        case 12: printf("   Month:  December\n");    break;
        default: printf("   -- NOT A MONTH! --\n");  break;
    }
    
    printf("   Day:    %02d\n", DAY);                               /* Skriv ut "   Day    : [DAY]+[ändelse]" */
   
    printf("\nSSNb format converter DONE!\n\n");

    return 0;
}


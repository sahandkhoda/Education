#include <stdio.h>                             /* Inkludera programbibliotek */
int main(int argc, char **argv)               
{
    int YEAR;
    int MONTH;                                 /* Variabler */
    int DAY;

    printf("\n");
    printf("Welcome to the SSNb format converter.\n");   /* Hälsningsfras */
    printf("\n");
    printf("Please enter SSNb (YY.MM.DD):  ");           /* Läs in personnummer (YY.MM.DD) och skriv ut det på samma rad */
    scanf("%d.%d.%d", &YEAR, &MONTH, &DAY);     
    
    printf("\n");
    printf("   Year:   %04d\n", YEAR+2000);                         /* Skriv ut "   Year   : [YEAR+2000] " */

    switch(MONTH)
    {
        case 01: printf("   Month:  January\n");     break;          
        case 02: printf("   Month:  February\n");    break;
        case 03: printf("   Month:  Mars\n");        break;
        case 04: printf("   Month:  April\n");       break;
        case 05: printf("   Month:  May\n");         break;
        case 06: printf("   Month:  June\n");        break;
        case 07: printf("   Month:  July\n");        break;         /* Skriv ut "   Month  : [Namn på månad] " */
        case 8:  printf("   Month:  August\n");      break;
        case 9:  printf("   Month:  September\n");   break;
        case 10: printf("   Month:  October\n");     break;
        case 11: printf("   Month:  November\n");    break;
        case 12: printf("   Month:  December\n");    break;
        default: printf("   -- NOT A MONTH! --\n");  break;
    }
    
    printf("   Day:    %02d\n", DAY);                               /* Skriv ut "   Day    : [DAY]+[ändelse]" */
    printf("\n");
    printf("SSNb format converter DONE!\n");
    printf("\n");
    return 0;
}


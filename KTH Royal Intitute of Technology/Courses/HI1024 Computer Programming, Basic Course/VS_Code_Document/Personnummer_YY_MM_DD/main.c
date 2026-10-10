#include <stdio.h>                             /* Inkludera programbibliotek */
int main(int argc, char **argv)               
{
    int YEAR;
    int MONTH;
    int DAY;

    printf("SSNb format converter.\n");        /* Hälsningsfras: Skriv ut SSNb format converter */
    
    printf("Enter SSNb (YY.MM.DD)\n");         /* Läs in personnummer (YY.MM.DD) och skriv ut det på samma rad */
    scanf("%d.%d.%d", &YEAR, &MONTH, &DAY);     

    printf("    Year:   %04d\n", YEAR+2000);   /* Skriv ut "Year   : ... " */
    printf("    Month:  %02d\n", MONTH);       /* Skriv ut "Month  : ... " */
    printf("    Day:    %02d\n", DAY);         /* Skriv ut "Day    : ... " */

    printf("SSNb format converter done!\n");
    return 0;
}


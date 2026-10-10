#include <stdio.h>

int main(void)
{
    printf("Logical Expression Tester (LET)\n");

    printf("4==5 evaluates to:  %d\n", 4==5);           /* 4==5 är falskt och därför tilldelas det värdet 0. */

    int a = (4==4);                                     /* HL (4==4) är sant och därför tilldelas a värdet 1. */
    printf("4==4 evaluates to:  %d\n", a);

    printf("LET done!\n");
    return 0;
}
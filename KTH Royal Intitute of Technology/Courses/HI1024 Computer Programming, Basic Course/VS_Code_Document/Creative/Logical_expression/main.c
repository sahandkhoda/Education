#include <stdio.h>
int main(void)
{
    printf("\nLogical Expressions Tester (LET)!\n\n");
    
    int A, B, C;
    
    printf("Enter a number A (1-20):    ");
        scanf("%d", &A);
    printf("Enter a number B (1-20):    ");                 /* Enter and print the values of variables A, B and C */
        scanf("%d", &B);
    printf("Enter a number C (1-20):    ");
        scanf("%d", &C);

    printf("\n");
    printf("    A>0 and B<9 :   %d\n", A>0 && B<9);         /* AND */
    printf("    A>0 or B<9  :   %d\n", A>0 || B<9);         /* OR */
    printf("    A<B<C       :   %d\n\n", A<B && B<C);       /* Lesser than ... */

    printf("    !(A>11) and !(B<9)   :   %d\n", !(A>11) && !(B<9));       /* NOT AND NOT,   True + False = (0) */
    printf("    !(A>11) or  !(B<9)   :   %d\n\n", !(A>11) || !(B<9));     /* NOT OR NOT,    True + True  = (1) */

    A = A-1;    /* Legal statement. No value discarded. */
    B = ++B;    /* Legal statement. No value discarded. */
    
    printf("Now, A and B are respectively %d and %d.\n", A, B);

        printf("    A>0 and B<9   :   %d\n", A>0 && B<9);   
        printf("    A>0 or  B<9   :   %d\n", A>0 || B<9);

    printf("\nLET done!\n");
    return 0;
}
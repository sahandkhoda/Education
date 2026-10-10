#include <stdio.h>
#include <math.h>
#define MAX 100
#define MIN 0

int main(void)
{
    int NUM, NUMERATOR;
    double sqrtNUM;

    printf("\n");
    printf("Welcome to Prime Number Calculator (PNC)\n");
    printf("Enter a whole number (0-100): ");
    scanf("%d", &NUM);
    
    if(NUM >= MIN && NUM <= MAX) printf("-- Your number (%d) is valid --\n", NUM);
        else
            { do
                {
                    printf("ERROR! Please enter a valid number between 0 and 100:  ");
                    scanf("%d", &NUM);
                } while (NUM < MIN || NUM > MAX);
                printf("-- Your number (%d) is valid --\n", NUM);
            }
    
    
    sqrtNUM = sqrt(NUM);
    NUMERATOR = sqrtNUM + 0.5;
    printf("The square root of your number is %lf and the numerator is %d.\n", sqrtNUM, NUMERATOR);

    do
    {
        printf("%d", NUM / (NUMERATOR - 1));
        NUMERATOR--;
        printf("\n");

    } while (NUMERATOR > 1);
    

    //printf("%d\n", (int) sqrtNUM+1);


    printf("PNC - DONE!\n");        
    return 0;
}
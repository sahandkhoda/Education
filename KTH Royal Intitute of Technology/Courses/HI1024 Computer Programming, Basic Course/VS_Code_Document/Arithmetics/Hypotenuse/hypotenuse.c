#include <stdio.h>
#include <math.h>

int main(void)
{
    printf("\nWelcome to Hypotenuse calculator.\n");

    // Variabels
    float a, b;

    // Enter both catheters of a triangel
    printf("Enter the first catheter (a) of a triangel [cm]:     ");
        scanf("%f", &a);
    printf("Enter the second catheter (b) of a triangel [cm]:    ");
        scanf("%f", &b);

    // Calculate the hypotenuse using the formula: c = sqrt((a^2) + (b^2))
    float c = sqrt((pow(a,2))+(pow(b,2)));
    printf("The hypotenuse (c) is %f cm\n", c);

    printf("Hypotenuse calculator - DONE!");    
    return 0;
}
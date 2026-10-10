#include <stdio.h>
#include <math.h>

// The output of the factorial function
void outputFactorial(int number)
{
    printf("    The factorial of %d is %d.\n", number, inputFact(number));                         // Printing the value.
    printf("    The factorial of the factorial %d is %d.\n", number, inputFactorial(number));           // Printing the value. Care! Do not enter a larger number than 3!
}

// The factorial function
int inputFactorial(int number)
{
    int factorial = 1;

    for(int i=number; i>0; i--)
        {factorial = factorial * i;}

    return factorial;
}


// Start of the main function
int main(void)
{
    printf("\nWelcome to Factorial Calculator (FC).\n");
 
    int number;
    do
    {
        printf("Enter a number to calculate the factorial of (or exit with 0) : ");             // Enter number.
            scanf("%d", &number);                                                               // Input using the scanf function.

        outputFactorial(number);

    } while (number != 0);

    printf("-- Exiting program --");                                                            // Condition: To exit the program, press 0.
    printf("FC - DONE!");                                                                       // Program is done!
    
    return 0;
}
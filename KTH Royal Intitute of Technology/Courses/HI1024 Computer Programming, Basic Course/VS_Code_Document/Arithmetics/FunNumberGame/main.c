#include <stdio.h>
#define MAXSIZE 5

// Called functions
float enter(float *ptrNUMBER1);
void view(float *ptrNUMBER1, float *ptrNUMBER2);
float compute(float *ptrNUMBER1, float *ptrNUMBER2);
    float add(float *ptrNUMBER1, float *ptrNUMBER2);
    float subtract(float *ptrNUMBER1, float *ptrNUMBER2);
    float multiply(float *ptrNUMBER1, float *ptrNUMBER2);
    float divide(float *ptrNUMBER1, float *ptrNUMBER2);
int reset(float *ptrNUMBER1, float *ptrNUMBER2);

// The main-function
int main(void)
{
    int a[MAXSIZE] = {};                // Array for equation numbers.
    char OPTION;                        // Option for menu.

    float NUMBER1=0;                      // Original number.
        float *ptrNUMBER1 = &NUMBER1;       // Pointer
    float NUMBER2=0;                      // Number after equations.
        float *ptrNUMBER2 = &NUMBER2;       // Pointer

    // Greeting phrase
    {
        printf("\n");
        printf("Welcome to Fun Number Game (FNG) 1.0\n");
        printf("Please select an option:\n");           // Instructions:
            printf(" e to Enter\n");                    // Enter original number.
            printf(" v to View\n");                     // Shows the current number.
            printf(" c to Compute\n");                  // Enter equation.
            printf(" r to Reset\n");                    // Resets all equations.
            printf(" q to Quit\n");                     // Exits the program.
    }

    do
    {
        printf("\n");
        printf("Enter option : ");
            scanf(" %c", &OPTION);
        printf("\n");

        switch (OPTION)
        {
            case 'e':   enter(ptrNUMBER1);                   break;
            case 'v':   view(ptrNUMBER1, ptrNUMBER2);        break;
            case 'c':   compute(ptrNUMBER1, ptrNUMBER2);     break;
            case 'r':   reset(ptrNUMBER1, ptrNUMBER2);       break;
        }
    } while (OPTION != 'q');

    printf("-- Exiting program --\n\n");
    printf("-- FNG DONE! --\n\n");
    
    return 0;
}

// Enter
float enter(float *ptrNUMBER1)
{
    float number1 = *ptrNUMBER1;
    printf("-- Opening Enter --\n");
    printf("Enter a number [1-100] (or 0 to Back): ");
        scanf("%f", &number1);
    
    if(number1==0)
    {
        printf("-- Closing Enter --\n");
        return 0;
    } else
    {
        *ptrNUMBER1 = number1;
        printf("You've entered the number %.2f (rounded to two decimals)\n", number1);
        printf("-- Closing Enter --\n");
    }
}


void view(float *ptrNUMBER1, float *ptrNUMBER2)
{
    printf("-- Opening View --\n");
    printf("Original number   : %.2f\n", *ptrNUMBER1);
    printf("After equation(s) : %.2f\n", *ptrNUMBER2);
    // Array : equation number, up to a total of 5 equations (elements).
    printf("-- Closing View --\n");
}

float compute(float *ptrNUMBER1, float *ptrNUMBER2)
{
    // Need a start value
    if(*ptrNUMBER1==0)
    {
        printf("-- To continue please first enter number with option e (Enter) --\n");
        return 0;
    }

    // Equation number
    {
        printf("Please select an equation:\n");         // Instructions:
            printf(" 1 to Add\n");                      // Shows the current number.
            printf(" 2 to Subtract\n");                 // Enter equation.
            printf(" 3 to Mulitply\n");                 // Resets all equations.
            printf(" 4 to Divide\n\n");                 // Exits the program.
    }

    int equation;
    printf("Enter equation : ");
        scanf("%d", &equation);

    switch (equation)
    {
        case 1: add(ptrNUMBER1, ptrNUMBER2);         break;
        case 2: subtract(ptrNUMBER1, ptrNUMBER2);    break;
        case 3: multiply(ptrNUMBER1, ptrNUMBER2);    break;
        case 4: divide(ptrNUMBER1, ptrNUMBER2);      break;
        default: printf("Not a valid equation!\n");     break;
    }
}

    // Add
    float add(float *ptrNUMBER1, float *ptrNUMBER2)
    {
        float number1=*ptrNUMBER1;
        float number2=*ptrNUMBER2;
        float addnumber;

        printf("-- Opening Add --\n");
        printf("Enter number [1-100] to add on your number (or 0 to Back): ");
            scanf("%f", &addnumber);
        
        if(addnumber == 0)
        {
            printf("-- Closing Add --\n");
            return 0;
        }
            else
        {
            printf("You've added %.2f (rounded to two decimals) to your number.\n", addnumber);

            number2 = number1 + addnumber;
            printf("Your number is now %.2f.\n", number2);

            *ptrNUMBER2 = number2;
        }
    }
    
    float subtract(float *ptrNUMBER1, float *ptrNUMBER2)
    {
        
    }

    float multiply(float *ptrNUMBER1, float *ptrNUMBER2)
    {

    }
    
    float divide(float *ptrNUMBER1, float *ptrNUMBER2)
    {
        
    }

int reset(float *ptrNUMBER1, float *ptrNUMBER2)
{
    printf("-- Second chance --\n");
    printf("Are you sure you want to reset the number (including equations)?\n");
    char CHOICE;

    do
    {
        printf("Enter y (yes) or n (no) : ");
            scanf(" %c", &CHOICE);

        if( (CHOICE != 'y') && (CHOICE != 'n') )
            printf("    Not a valid choice!\n");

    } while( (CHOICE != 'y') && (CHOICE != 'n') );
       
    if(CHOICE == 'y')
    {
        printf("-- Deleted all values --\n");
        *ptrNUMBER1 = 0;
        *ptrNUMBER2 = 0;
    } else printf("-- No values deleted --\n");

}
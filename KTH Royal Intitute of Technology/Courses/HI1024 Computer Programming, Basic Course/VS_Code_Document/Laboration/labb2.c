#include <stdio.h>
#include <math.h>
#define aSIZE 10        // Size of array

// Called functions
void view(int *a, int *ptrLENGTH);
void enter(int *a, int *ptrLENGTH);
void reset(int *ptr);
void min(int *a, int *ptrLENGTH);
void max(int *a, int *ptrLENGTH);
float average(int *a, int *ptrLENGTH, float *ptrAVERAGE);
void normal(int *a, int *ptrLENGTH, float *ptrAVERAGE);
void compute(int *a, int *ptrLENGTH, float *ptrAVERAGE);

// Start of the main-function
int main(void)
{
    // Greeting phrase: MENU
    {
    printf("\n");
    printf("Welcome to Measurement tool 1.1\n\n");
    printf("Please select an option:\n");           // Instructions:
        printf(" v to View\n");                     // Shows which measurments are stored. 
        printf(" e to Enter\n");                    // Allows the user to add measurements.
        printf(" c to Compute\n");                  // Presents the maximum, minimum, and average as well as the normalized measurements.
        printf(" r to Reset\n");                    // Deleting all input measurements.
        printf(" q to Quit\n\n");                   // Exiting the program.
    printf("Enter option : ");
    }

    int a[aSIZE] = {};                              // The array containing measurements (elements).
    char OPTION;                                    // Variable for user input option (desired action).
    
    int aLENGTH = 0;                                // Length of array
    int *ptrLENGTH = &aLENGTH;                      // Pointer to length of array
    
    float AVERAGE = 0;                              // Average of array
    float *ptrAVERAGE = &AVERAGE;                   // Pointer to average of array

    do                                              // Select menu option
    {
        scanf(" %c", &OPTION);
        switch (OPTION)
        {
            case ('v'): view(a, ptrLENGTH);                 break;
            case ('e'): enter(a, ptrLENGTH);                break;
            case ('c'): compute(a, ptrLENGTH, ptrAVERAGE);  break;
            case ('r'): reset(ptrLENGTH);                   break;
        }
    } while (OPTION != 'q');
    if (OPTION == 'q') printf(" -- Exiting program... --\n\n");
    return 0;
}

    // View
    void view(int *a, int *ptrLENGTH)
    {
        int length = *ptrLENGTH;
        printf("\n-- Opening view --\n");
        
        if (length == 0) printf("[ No measurements ]\n");
        else
        {
            printf("{ ");
            int i = 0;
            do
            {
                printf("[%d] ", a[i]);
                i++;
            } while ((a[i] != 0) && (i < length));
            printf("}\n");
        }
        printf("-- Closing view --\n\n");
        printf("Enter option : ");
    }

    // Enter
    void enter(int *a, int *ptrLENGTH)
    {
        int length = *ptrLENGTH;
        int input;
        
        if (length < aSIZE)
        {
            printf("\n-- Enter measurement (or exit with 0) --\n");
            do
            {   
                printf("Measurement #%d :   ", length+1);
                scanf("%d", &input);
                a[length] = input;
                length++;
            } while ((input != 0) && (length < aSIZE));

            if ((input == 0))
            {
                printf("-- Returning to menu --\n");
                *ptrLENGTH = length-1;
            } else if (length == aSIZE)
            {
                printf("-- Returning to menu --\n");
                *ptrLENGTH = length;
            }
        } else          // Warning that array is full.
            {
                printf("\n-- Warning: Read below -- \n");
                printf("Can't enter more measurements!\n");
                printf("Please consider resetting all measurements.\n");
                printf("-- Returning to menu --\n");
            }
        printf("\n");
        printf("Enter option : ");
    }

    // Compute
    void compute(int *a, int *ptrLENGTH, float *ptrAVERAGE)
    {
        printf("\n");
        printf("-- Calculating... --\n");
            min(a, ptrLENGTH);
            max(a, ptrLENGTH);
            average(a, ptrLENGTH, ptrAVERAGE);
            normal(a, ptrLENGTH, ptrAVERAGE);
        printf("-- Calculation DONE --\n\n");
        printf("Enter option : ");
    }

        // Minimum element
        void min(int *a, int *ptrLENGTH)
        {
            int length = *ptrLENGTH;
            int MIN = a[0];
            
            if (length == 0)
                printf("Minimum value   :   [No measurements]\n");
            else
            {
                for(int counter = 1; counter < aSIZE; counter++)
                {
                    if((a[counter] < MIN) && (a[counter] != 0)) {MIN = a[counter];}
                }
                printf("Minimum value   :   %d\n", MIN);
            }
        }

        // Maximum element
        void max(int *a, int *ptrLENGTH)
        {
            int length = *ptrLENGTH;
            int MAX = a[0];
            
            if (length == 0)
                printf("Maximum value   :   [No measurements]\n");
            else
            {   
                for(int counter = 1; counter < aSIZE; counter++)
                {
                    if(a[counter] > MAX) {MAX = a[counter];}
                }
                printf("Maximum value   :   %d\n", MAX);
            }
        }

        // Average
        float average(int *a, int *ptrLENGTH, float *ptrAVERAGE)
        {
            int length = *ptrLENGTH;
            float average = *ptrAVERAGE;    // Calculated average
            int total = 0;                  // Resetting the sum 
            int counter = 0;                // Number of measurements

            if (length == 0)
                printf("Average         :   [No measurements]\n");
            else
            {
                do
                {
                    total = total + a[counter];
                    counter++;
                    average = (float) total / counter;

                } while ((a[counter] != 0) && (counter < aSIZE));

                *ptrAVERAGE = average;      
                printf("Average         :   %.2f\n", *ptrAVERAGE);
            }
        }
        
        // Normalise
        void normal(int *a, int *ptrLENGHT, float *ptrAVERAGE)
        {
            int length = *ptrLENGHT;
            float average = *ptrAVERAGE;
            int i = 0;

            if (length == 0)
                printf("Normalized      :   [No measurements]\n");
            else
            {
                printf("Normalized      :   { ");
                
                do
                {
                    printf("[%.1f] ", round(a[i]-average));
                    i++;
                } while ((a[i] != 0) && (i < aSIZE));
                
                printf("}\n");
            }
        }

    // Reset
    void reset(int *ptrLENGTH)
    {
        char CHOICE;
        printf("\n-- Second chance --\n");
        printf("Are you sure you want to reset?\n");
        printf("Enter y (yes) or n (no) : ");
            scanf(" %c", &CHOICE);
        
        if (CHOICE == 'y')
        {
            *ptrLENGTH = 0;
            printf("-- Deleted all values --\n");

        } else printf("-- No values deleted --\n");
        
        printf("\n");
        printf("Enter option : ");
    }
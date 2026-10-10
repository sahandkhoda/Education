#include <stdio.h>

int main(void)
{
    int measurement;
    int total = 0;                              /* Nollställ miniräknaren */
    for(int counter=0; counter<4; counter++)    /* Väg den första tomaten. Skriv ut värdet. Repetera tre gånger. */
    {
        printf("Enter weight [g] of tomato:    ");
        scanf("%d", &measurement);
        total=total+measurement;
    }

    printf("Average = %0.2f\n", total/4.0);     /* Beräkna medelvärdet och skriv ut värdet */

    return 0;
}

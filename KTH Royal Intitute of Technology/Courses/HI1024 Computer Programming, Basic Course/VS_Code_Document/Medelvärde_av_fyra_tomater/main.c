#include <stdio.h>

int main(void)
{
/* Nollställ miniräknaren */
/* Väg den första tomaten. Skriv ut värdet. Repetera för den andra, tredje och fjärde tomaten. */
/* Beräkna medelvärdet genom att dividera summan av alla tomaters vikt med antalet tomater (4 st) */
/* Skriv ut medelvärdet */

    int measurement;
    int total = 0;
    for(int counter=0; counter<4; counter++)
    {
        scanf("%d", &measurement);
        total+=measurement;
    }

    printf("Average = %f\n", total/4.0);
}

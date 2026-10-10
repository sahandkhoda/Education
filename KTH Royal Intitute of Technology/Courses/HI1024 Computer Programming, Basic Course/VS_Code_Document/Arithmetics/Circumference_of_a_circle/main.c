#include <stdio.h>
#define PI 3.1415f

int main(void)
{
    /* Hälsningsfras */
    /* Fråga efter diameter [cm] */
    /* Läs in diameter och multiplicera med konstanten pi = 3.1415f */
    /* Skriv ut svaret [cm]. */

printf("The circumference of a cirle.\n");

float diameter;

printf("Enter the diameter [cm] of the circle:  ");
scanf("%f", &diameter);

printf("The diameter is %.2f cm. Thus, the radius is %.2f cm.\n", diameter, diameter/2);
printf("The circumference of the circle is %.2f cm.\n", diameter*PI);

printf("The calculation is done!\n");
return 0;

}
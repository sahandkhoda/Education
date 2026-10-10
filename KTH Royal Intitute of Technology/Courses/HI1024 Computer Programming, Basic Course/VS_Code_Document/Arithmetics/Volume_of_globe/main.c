#include <stdio.h>
#include <math.h>
#define SCALE_FACTOR 4.0f/3.0f
#define PI 3.1415f

int main(void)
{
    float RADIUS, VOLUME;

    printf("Volume of globe calculator (VGC).\n");                                          /* Hälsningsfras */
    printf("Enter length of radius [cm]:    ");                                             /* Fråga efter radien. */
    scanf("%f", &RADIUS);                                                                   /* Läs in radien. */

    VOLUME = SCALE_FACTOR*(PI*(pow(RADIUS, 3)));                                            /* Formeln V=4/3(PIr^3) */

    printf("The volume of the globe is %.2f cm3 (or %.2f dm3) \n", VOLUME, VOLUME/1000);    /* Skriv ut volymen. */
    printf("Calculation VGC is complete!\n");                                               /* Avslutningsfras */
    
    return 0;
}
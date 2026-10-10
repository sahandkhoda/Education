#include <stdio.h>
#define Farenheit F
#define Celcius C
#define FREEZING_PT 32
#define SCALE_FACTOR 5.0f/9.0f

int main(void)
{
    float F;
    float C;

    printf("Farenheit-to-Celsius-converter.\n");        /* Hälsningsfras */
    
    printf("Enter Farenheit [F] temperature.\n");      /* Fråga efter värdet i Farenheit (F) */
    scanf("%f", &F);                                    /* Läs in värdet på Farenheit (F) */
      
    C=(F-FREEZING_PT)*SCALE_FACTOR;       /* Omvandlingsformeln från Farenheit (F) till Celsius (C). */

    printf("%.2f degrees Farenheit equals %.2f degrees Celsius.\n", F, C);    /* Skriv ut svaret (2 decimaler). */

    printf("The calculation is done!\n");    /* Programmet är klart! */
    return 0;
}
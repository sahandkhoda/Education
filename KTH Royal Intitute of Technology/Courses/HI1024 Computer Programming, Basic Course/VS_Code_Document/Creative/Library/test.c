#include <stdio.h>
#define MAXCHAR 101
#define MAXCARS 10

typedef struct
{
    char brand [MAXCHAR];
    char color [MAXCHAR]; 
    char owner [MAXCHAR];
    int  year;
} Garage;

void enter(Garage *aCar, int *CarNumber)
{
    for (int i = 0; i < 2; i++)
    {
        printf("Brand : "); scanf("%s", aCar[i].brand);
        printf("Color : "); scanf("%s", aCar[i].color);
        printf("Owner : "); scanf("%s", aCar[i].owner);
        printf("Year  : "); scanf("%d", aCar[i].year);
        printf("\n");
    }

    printf("\nYour brand is : %s\n", aCar[0].brand);
    printf("\nYour brand is : %s\n", aCar[1].brand);
}

int main(void)
{
    printf("\n");
    printf("Welcome to Car Library.\n\n");

    Garage myGarage[10];
    int numberOfCars = 0, *ptrCar = &numberOfCars;

    enter(myGarage, ptrCar);

    return 0;
}
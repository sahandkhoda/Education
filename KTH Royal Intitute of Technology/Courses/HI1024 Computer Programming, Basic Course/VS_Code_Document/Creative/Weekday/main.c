#include <stdio.h>

int main(void)
{
    int WEEKDAY;

    printf("\n");
    printf("Which Weekday? Enter the number of the weekday (1-7):   ");
    scanf("%d", &WEEKDAY);

    switch(WEEKDAY)
    {
        case    1:  printf("Monday\n");     break;
        case    2:  printf("Tuesday\n");    break;
        case    3:  printf("Wednesday\n");  break;
        case    4:  printf("Thursday\n");   break;
        case    5:  printf("Friday\n");     break;
        case    6:  printf("Saturday\n");   break;
        case    7:  printf("Sunday\n");     break;
        default  :  printf("NOT A WEAKDAY!\n");
    }

    printf("Weekday DONE!");
    return 0;
}
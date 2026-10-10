#include <stdio.h>

int main(void)
{
    printf("US to EUR date format converter.\n");

    int YYYY, MM, DD;

    printf("Enter date in US format (MM/DD/YYYY)    :   ");
    scanf("%d/%d/%d", &MM, &DD, &YYYY);
    printf("Converted date in EUR format            :   %02d/%02d-%d", DD, MM, YYYY);
    printf("\nConverter DONE!\n");

    return 0;
}
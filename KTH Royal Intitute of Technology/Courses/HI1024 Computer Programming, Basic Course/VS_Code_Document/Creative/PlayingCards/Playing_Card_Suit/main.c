#include <stdio.h>

int main(void)
{
    int PCS;

    printf("Playing Card Suit (PCS)\n");
    printf("Enter the suit:     ");
    scanf("%d", &PCS);

    switch(PCS)
    {
        case 0  :   printf("SPADE\n");    break;   
        case 1  :   printf("HEART\n");    break;
        case 2  :   printf("DIAMOND\n");  break;
        case 3  :   printf("CLUB\n");     break;
        default :   printf("NOT A PLAYING CARD SUIT\n");
    }
    
    printf("PCS DONE!\n");
    return 0;
}
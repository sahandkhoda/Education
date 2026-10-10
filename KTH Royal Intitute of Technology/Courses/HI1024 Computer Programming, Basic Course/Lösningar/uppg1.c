#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main()
{
    int sum=0,card,poang=0;
    char choice='j';
    srand(time(NULL));

    while (choice=='j')
    {
        card=rand()%13+1;
        sum+=card;
        printf("Du fick %d och har summan %d.\n",card,sum);
        if(sum>21) break;
        printf("Vill du ha ett kort till (j/n): ");
        scanf(" %c%*c",&choice);
    }
    if(sum<=17)
    {
        poang=1;
    }else if(sum<=20)
    {
        poang=2;
    }else if(sum==21)
    {
        poang=3;
    }
    printf("Resultat %d poang.\n",poang);
    return 0;
}
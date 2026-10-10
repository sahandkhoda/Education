#include <stdio.h>
#include <math.h>
#define e 0.001

int main(void)
{
    float x, rp=x, rn=x/2;

    printf("\nBabylon Square Method (BSM).\n");
    printf("Enter an arbitrary number:  ");
    scanf("%f", &x);

    while(fabs(rn-rp)>e)
    {
        printf("    DBG:    %f\n", rn);
        rp = rn;
        rn = (rn + x/rn)/2;
    }

    printf("Square root of %f is %0.3f\n", x, rn);
    return 0;
}
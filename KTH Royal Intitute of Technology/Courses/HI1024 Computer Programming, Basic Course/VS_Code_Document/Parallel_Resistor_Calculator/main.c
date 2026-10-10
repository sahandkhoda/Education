#include <stdio.h>
int main(void){
    int r1;
    int r2;
    int rx;

    printf("Parallel Resistor Calculator (PRC) 0.1 AC.\n");    
    printf("First resistor [ohm]");
    scanf("%d", &r1);
    printf("Second resistor [ohm]");
    scanf("%d", &r2);

    rx = (r1*r2)/(r1+r2);
    printf("Replace with a %d ohm resistor.\n", rx);

    printf("PRC done!\n");
    return 0;
}


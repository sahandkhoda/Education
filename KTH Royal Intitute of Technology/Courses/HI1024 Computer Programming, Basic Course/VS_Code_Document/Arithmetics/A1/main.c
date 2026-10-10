#include <stdio.h>

int main(void)
{
    int r1=6, r2=4, rx, ry;
    
    rx = r1 / r2;                       /* int / int = int ger att rx = 6 / 4 = 1 */
    ry = r1 % r2;                       /* Resten är 2*/

    rx = rx + 5;

    printf("rx = %d\n", rx);
    printf("ry = %d\n", ry);
    
    printf("%d\n", r1);
    printf("%d\n", r1++);               /* Höjer ursprungsvärdet (r1 = 6) i uttrycket med ett. */
    printf("%d\n", r1);
    printf("%d\n", ++r1);               /* Höjer det uppdaterade värdet (r1 = 7) i uttrycket med ett. */

    rx += 5;                            /* Kortare form för (rx = rx + 5). UNDVIK DETTA SKRIVSÄTT! */

    printf("%d\n", rx);

    return 0;

}
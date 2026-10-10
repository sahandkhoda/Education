#include <stdio.h>
#define SYSMAX 160
#define SYSMIN 90
#define DIAMAX 90
#define DIAMIN 60

int main(void)
{
    int SYS, DIA;

    printf("Blood Pressure Alarm (BPA). Enter blodpressure (SYS/DIA) [mmHg]:   ");
    scanf("%d/%d", &SYS, &DIA);

    if(SYS>=SYSMIN && SYS<=SYSMAX) printf("Systolic pressure is ok!\n");
        else
        {
            if(SYS<SYSMIN) printf("ALARM! Systolic pressure is below %d mmHg!\n", SYSMIN); 
                else printf("ALARM! Systolic pressure is above %d mmHg!\n", SYSMAX);
        }
    
    if(DIA>=DIAMIN && DIA<=DIAMAX) printf("Diastolic pressure is ok!\n");
        else
        {
            if(DIA>DIAMAX) printf("ALARM! Diastolic pressure is above %d mmHg!\n", DIAMAX);
                else printf("ALARM! Diastolic pressure is below %d mmHg!\n", DIAMIN);
        }

    printf("BPA DONE!\n");
    return 0;
}


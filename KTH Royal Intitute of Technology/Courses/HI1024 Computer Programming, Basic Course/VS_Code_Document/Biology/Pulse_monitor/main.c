#include <stdio.h>
#define MIN 40
#define MAX 80

int main(void)
{
    int BEAT, ALARM;                                                        /* Variabler */

    printf("\nPulse Monitor Alarm (PMA). Enter heartbeat [bpm]:  ");        /* Fråga efter BEAT */
    scanf("%d", &BEAT);                                                     /* Läs in BEAT */

    if(BEAT>=MIN && BEAT<=MAX)                                              /* Om BEAT inom intervallet 40-80 [bpm] ... */
    {   ALARM = 0;
        printf("Alarm (%d) deactivated! 40-80 bpm.\n", ALARM);
    }   else                                                                /* Annars ... */ 
        {   ALARM = 1; 
            if(BEAT<MIN)    printf("Alarm (%d) activated! Heartbeat is below %d bpm!\n", ALARM, MIN);
            else            printf("Alarm (%d) activated! Heartbeat is above %d bpm!\n", ALARM, MAX);
        }
    
    printf("PMA DONE!\n\n");
    
    return 0;
}
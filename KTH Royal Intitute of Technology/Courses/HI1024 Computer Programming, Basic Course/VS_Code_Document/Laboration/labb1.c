#include <stdio.h>

// Constants
#define K 0.1       // Efficiency
#define G 1.5       // Gravity

// Start of the main-function
int main(void)
{
    // Greeting phrase
    {   
        printf("\n");
        printf("Lunar decent challenge.\n");
        printf("You will pilot a lunar decent the last 250 meters.\n");
        printf("Each turn represents 1-second decent time.\n");
        printf("Set the throttle for each turn: 1,..., 100 [percent].\n\n");
    }

    // Declaration of variables
    int TIME = 0;               // Seconds              [s]
    float HEIGHT = 250.0;       // Meters               [m]
    float VELOCITY = -25;       // Meters per second    [m/s]
    float FUEL = 500.0;         // Kilograms            [kg]
    int THROTTLE;               // Percent              [%]

    int HOURS, MINUTES, SECONDS;

    // Enter time of simulation start
    {
        printf("Please enter time of simulation initialization.\n");
            printf("    Hour(s)     [0-23]  : "); scanf("%d", &HOURS);
            printf("    Minute(s)   [0-59]  : "); scanf("%d", &MINUTES);
            printf("    Second(s)   [0-59]  : "); scanf("%d", &SECONDS);
        printf("The simulation is set to start at %02dh %02dmin %02dsec.\n\n", HOURS, MINUTES, SECONDS);
    }

    // Simulation (initialization, loop, and completion)
    {
    printf("                -- Simulation started --\n");
    printf("Time   |   Height   |   Velocity   |   Fuel   |   Throttle\n");
    }

    do
    {
        printf("  %.1d        %.1f          %.1f        %.1f         ", TIME, HEIGHT, VELOCITY, FUEL);    
        scanf("%d", &THROTTLE);
        
        TIME++;
        VELOCITY    =   VELOCITY + ((THROTTLE*K) - G);
        HEIGHT      =   HEIGHT + VELOCITY - (((THROTTLE*K) - G) / 2);
        FUEL        =   FUEL - THROTTLE;

    } while(HEIGHT > 0);
    printf("                -- Simulation finished --\n\n");

    // Condition: safe landing or not?
    {
    if (VELOCITY > -2.5)
        printf("SUCCESS! Safe landning at %.1f m/s.\n", VELOCITY);
    else
        printf("FAILURE! Failed landing at %.1f m/s.\n", VELOCITY);    
    }
    
    // Time of initialization
    printf("Time of initialization  : %02dh %02dmin %02dsec\n", HOURS, MINUTES, SECONDS);

    // Time of impact
    if ((SECONDS+TIME) >= 60)
    {
        MINUTES++;
        if (MINUTES >= 60)
        {
            HOURS++;
            if (HOURS >=24)
            {
                HOURS = 0;
                printf("Time of impact          : %02dh %02dmin %02dsec\n\n", HOURS, MINUTES-60, SECONDS+TIME-60);

            } else printf("Time of impact          : %02dh %02dmin %02dsec\n\n", HOURS, MINUTES-60, SECONDS+TIME-60);

        } else printf("Time of impact          : %02dh %02dmin %02dsec\n\n", HOURS, MINUTES, SECONDS+TIME-60);

    } else printf("Time of impact          : %02dh %02dmin %02dsec\n\n", HOURS, MINUTES, SECONDS+TIME);
     

    printf("Lundar decent challenge - DONE!\n\n");
    return 0;
}
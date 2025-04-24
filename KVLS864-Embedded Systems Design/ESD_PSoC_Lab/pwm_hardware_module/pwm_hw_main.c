/* ========================================
 *
 * Copyright YOUR COMPANY, THE YEAR
 * All Rights Reserved
 * UNPUBLISHED, LICENSED SOFTWARE.
 *
 * CONFIDENTIAL AND PROPRIETARY INFORMATION
 * WHICH IS THE PROPERTY OF your company.
 *
 * ========================================
*/
#include "project.h"

int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    PWM_1_Start();                // Start the PWM component

    PWM_1_WritePeriod(4000);      // Set period to 2000 counts (2 seconds at 1 kHz clock)
    PWM_1_WriteCompare(1000);     // Set compare to 1000 counts (50% duty cycle)

    for(;;)
    {
        // PWM runs in hardware, no code needed here
    }
}
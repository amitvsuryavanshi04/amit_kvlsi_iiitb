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
#include <project.h>
#include <stdio.h>

int main(void) {
    ADC_DelSig_1_Start();
    UART_1_Start();

    char uartBuffer[16];
    int16 adcResult;

    for(;;) {
        ADC_DelSig_1_StartConvert();
        ADC_DelSig_1_IsEndConversion(ADC_DelSig_1_WAIT_FOR_RESULT);
        adcResult = ADC_DelSig_1_GetResult16();

        // Send only the ADC result as decimal, followed by newline
        sprintf(uartBuffer, "%d\r\n", adcResult);
        UART_1_PutString(uartBuffer);

        CyDelay(100);  // 0.1 second delay
    }
}



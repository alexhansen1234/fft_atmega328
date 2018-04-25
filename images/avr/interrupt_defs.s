/*
 *  Interrupt Definitions must be assembled, but may be linked in any order
 *  besides first (Interrupt Table must be linked first). 
 */

RESET:
ldi r16,  lo8(RAMEND)
out SPL,  r16
ldi r16,  hi8(RAMEND)
out SPH,  r16
ldi r16,  0xFF
out DDRD, r16
jmp main

USART_RXC:
        reti
INT0:
        reti
INT1:
        reti
PCINT0:
        reti
PCINT1:
        reti
PCINT2:
        reti
WDT:
        reti
TIMER2_COMPA:
        reti
TIMER2_COMPB:
        reti
TIMER2_OVF:
        reti
TIMER1_CAPT:
        reti
TIMER1_COMPA:
        reti
TIMER1_COMPB:
        reti
TIMER1_OVF:
        reti
TIMER0_COMPA:
        reti
TIMER0_COMPB:
        reti
TIMER0_OVF:
        reti
SPI_STC:
        reti
USART_UDRE:
        reti
USART_TXC:
        reti
ADC:
        reti
EE_READY:
        reti
ANALOG_COMP:
        reti
TWI:
        reti
SPM_READY:
        reti

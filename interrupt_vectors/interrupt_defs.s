.include "./interrupt_vectors/interrupt_vector_table.s"
.include "./interrupt_vectors/memory_map.s"

/*
    This file contains all the definitions for the various interrupts
    which occur within an atmega328p. For this particular application,
    we will initialize a variable on the stack used to count the number
    of ADC conversions. After 64 samples, we will turn off the ADC and
    proceed to transform the samples to frequency space, calculate
    magnitudes, convert to 10bit ints, shift to 8bit ints, multiply our
    8bit ints by the 8bit int triplets used to describe the 32 unique
    colors available for display.

    RAMEND purposely set below actual end of ram, due to graphical debugger
    not showing ram addresses above 0x07F7
*/

RAMEND = 0x07F7
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

.text
RESET:
ldi r16,  lo8(RAMEND-3)
out SPL,  r16
ldi r16,  hi8(RAMEND-3)
out SPH,  r16

ldi r16,  0x00
sts RAMEND, r16
sts RAMEND-1, r16
sts RAMEND-2, r16

/* Set ADCSRA Prescaler to /128 */
ldi r16,  1 << ADPS0 | 1 << ADPS1 | 1 << ADPS2
sts ADCSRA, r16

/* Set ADMUX Internal Ref to AVCC */
ldi r16,  1 << REFS0
sts ADMUX,  r16



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

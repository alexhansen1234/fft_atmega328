.include "./interrupt_vectors/interrupt_vector_table.s"
.include "./interrupt_vectors/memory_map.s"
RAMEND = 0x07F7

RESET:
        ldi r16,  lo8(RAMEND)
        out SPL,  r16
        ldi r16,  hi8(RAMEND)
        out SPH,  r16

        ldi r16, 0xFF
        out DDRB, r16
        out PORTB,  r16

        call init_timer0
        call init_adc
        sei

        jmp main

main:
rjmp main

init_timer0:
        ldi r16,  1 << WGM01 | 0 << WGM00
        out TCCR0A, r16

        ldi r16,  0 << WGM02 | 0 << CS02 | 1 << CS01 | 0 << CS00
        out TCCR0B, r16

        ldi r16,  49
        out OCR0A, r16

        ldi r16,  0 << OCIEB | 1 << OCIEA | 0 << TOIE
        sts TIMSK0, r16

        ret

init_adc:
        ldi r16,  1 << ADEN | 1 << ADSC | 1 << ADATE | 1 << ADIF | 1 << ADIE
        sts ADCSRA, r16

        ldi r16,  3 << ADTS0
        sts ADCSRB, r16

        ldi r16,  ~(1 << ADC0D)
        sts DIDR0,  r16

        ret


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
push  r16
push  r17
in    r16,  SREG
push  r16

lds   _temp_reg_, ADCL
lds   _temp_reg_, ADCH
eor   _temp_reg_, _temp_reg_

in    r16,  PORTB
ldi   r17,  3
eor   r16,  r17
out   PORTB,  r16

pop   r16
out   SREG, r16
pop   r17
pop   r16

        reti

EE_READY:
        reti

ANALOG_COMP:
        reti

TWI:
        reti

SPM_READY:
        reti

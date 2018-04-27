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

.TEXT
.ORG 0x0000           ;; Interrupts, highest priority first
jmp RESET             ;; 3  Reset Handler
jmp INT0              ;; 3  External Interrupt Request 0
jmp INT1              ;; 3  External Interrupt Request 1
jmp PCINT0            ;; 3  Pin Change Interrupt Request 0
jmp PCINT1            ;; 3  Pin Change Interrupt Request 1
jmp PCINT2            ;; 3  Pin Change Interrupt Request 2
jmp WDT               ;; 3  Watchdog Time-out Interrupt
jmp TIMER2_COMPA      ;; 3  Timer2 Compare A Handler
jmp TIMER2_COMPB      ;; 3  Timer2 Compare B Handler
jmp TIMER2_OVF        ;; 3  Timer2 Overflow Handler
jmp TIMER1_CAPT       ;; 3  Timer1 Capture Handler
jmp TIMER1_COMPA      ;; 3  Timer1 Compare A Handler
jmp TIMER1_COMPB      ;; 3  Timer1 Compare B Handler
jmp TIMER1_OVF        ;; 3  Timer1 Overflow Handler
jmp TIMER0_COMPA      ;; 3  Timer0 Compare A Handler
jmp TIMER0_COMPB      ;; 3  Timer0 Compare B Handler
jmp TIMER0_OVF        ;; 3  Timer0 Overflow Handler
jmp SPI_STC           ;; 3  SPI Transfer Complete Handler
jmp USART_RXC         ;; 3  USART, RX Complete Handler
jmp USART_UDRE        ;; 3  USART, UDR Empty Handler
jmp USART_TXC         ;; 3  USART, TX Complete Handler
jmp ADC               ;; 3  ADC Conversion Complete Handler
jmp EE_READY          ;; 3  EEPROM Ready Handler
jmp ANALOG_COMP       ;; 3  Analog Comparator Handler
jmp TWI               ;; 3  2-wire Serial Interface Handler
jmp SPM_READY         ;; 3  Store Program Memory Ready Handler

RAMEND = 0x07F7
COMPLEX16_ARRAY_ADDR = RAMEND - 1
ADC_CONVERSIONS = RAMEND - 2
COLOR_ARRAY_ADDR = RAMEND - 4
SPL = 0x3d
SPH = 0x3e
SREG = 0x3f
_temp_reg_ = 0x00
_zero_reg_ = 0x01

.text
RESET:
ldi r16,  lo8(RAMEND-5)
out SPL,  r16
ldi r16,  hi8(RAMEND-5)
out SPH,  r16

ldi r16,  0xFF
out DDRB,  r16

ldi r16,  0xFF
out DDRD, r16

ldi r25,  0
ldi r24,  145
call init_ws2812

call init_timer0
call init_adc

jmp main

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
        ldi r16,  1 << ADEN | 1 << ADSC | 1 << ADATE | 1 << ADIF | 1 << ADIE | 5 << ADPS0
        sts ADCSRA, r16

        ldi r16,  3 << ADTS0
        sts ADCSRB, r16

        ldi r16,  1 << REFS0 | 1 << ADLAR
        sts ADMUX,  r16

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
    push  r18
    push  r19
    push  r30
    push  r31
    in    r16,  SREG
    push  r16

    lds   r16,  ADCH
    lds   r18,  ADC_CONVERSIONS
    mov   r19,  r18
    lds   r30,  COMPLEX16_ARRAY_ADDR
    lds   r31,  COMPLEX16_ARRAY_ADDR+1
    lsl   r18
    lsl   r18
    add   r30,  r18
    adc   r31,  _zero_reg_
    st    Z,    r16
    std   Z+1,  0
    std   Z+2,  0
    std   Z+3,  0
    inc   r19
    sts   ADC_CONVERSIONS,  r19

    cpi   r19,  64
    brne  continue_timer

    ldi   r16,  0
    out   TCCR0B, r16

    continue_timer:

    pop   r16
    out   SREG, r16
    pop   r31
    pop   r30
    pop   r19
    pop   r18
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

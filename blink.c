#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    uint8_t pin = 3;
    uint8_t pinMask = (1 << pin);
    DDRB |= 8;

    for (int i = 0; i < 40; ++i)
    {
        PORTB ^= pinMask;
        _delay_ms(100);
    }

    while (1)
    {
        _delay_ms(2000);
        PORTB ^= pinMask;
        _delay_ms(100);
        PORTB ^= pinMask;
    }
}

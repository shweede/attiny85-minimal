#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB |= 8;
    while (1)
    {
        _delay_ms(5000);
        PORTB ^= 2;
        _delay_ms(100);
        PORTB ^= 2;
    }
}

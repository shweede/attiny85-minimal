all:
	avr-gcc -Os -DF_CPU=8000000 -mmcu=attiny85 -c blink.c
	avr-gcc -DF_CPU=8000000 -mmcu=attiny85 -o blink.elf blink.o
	avr-objcopy -O ihex blink.elf blink.hex
	avrdude -c stk500v1 -p attiny85 -P /dev/ttyUSB0 -b 19200 -U flash:w:blink.hex

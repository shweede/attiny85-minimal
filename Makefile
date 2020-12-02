compiler = avr-gcc
obj_copy = avr-objcopy
flash_tool = avrdude

target = blink

# Output format (can be srec, ihex, binary)
format = ihex

programmer = stk500v1

all:
	$(compiler) -Os -DF_CPU=8000000 -mmcu=attiny85 -c blink.c
	$(compiler) -DF_CPU=8000000 -mmcu=attiny85 -o $(target).elf blink.o
	$(obj_copy) -O $(format) $(target).elf $(target).hex
	$(flash_tool) -c $(programmer) -p attiny85 -P /dev/ttyUSB0 -b 19200 -U flash:w:$(target).hex

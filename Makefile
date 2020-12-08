target = blink

# Compiler and linker params
compiler = avr-gcc

## Macros
cpu_speed = F_CPU=8000000

macros = -D$(cpu_speed)

optimize = s

compiler_flags = -O$(optimize)

# Object copy params
obj_copy = avr-objcopy
## Output format (can be srec, ihex, binary)
format = ihex

# Flash tool params
flash_tool = avrdude

partno = t85
baudrate = 19200
programmer-id = stk500v1
port = /dev/ttyUSB0

avrdude_flags = -p $(partno)
avrdude_flags += -b $(baudrate)
avrdude_flags += -c $(programmer-id)
avrdude_flags += -P $(port)

all:
	$(compiler) $(compiler_flags) $(macros) -mmcu=attiny85 -c blink.c
	$(compiler) $(macros) -mmcu=attiny85 -o $(target).elf blink.o
	$(obj_copy) -O $(format) $(target).elf $(target).hex
	$(flash_tool) $(avrdude_flags) -U flash:w:$(target).hex

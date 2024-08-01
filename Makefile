# Define the compiler and the flags
CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m4 -mthumb -O2 -Wall -Wextra -DCPU_S32K144HFT0VLLT
# Define the source files
SRCS = src/main.c \
       Project_Settings/Startup_Code/startup.c \
       Project_Settings/Startup_Code/system_S32K144.c \
       Project_Settings/Startup_Code/syscalls.c
#Project_Settings/Startup_Code/system_S32SK144.c

# Define the include directories
INCLUDES = -Iinclude

# Define the output binary name
OUTPUT = S32K144_Project_Hello

# Define the object files
OBJS = $(SRCS:.c=.o)

# Define the linker script
# Use the RAM linker script for development
LDSCRIPT = Project_Settings/Linker_Files/S32K1xx_flash.ld

# Build the target
all: $(OUTPUT).elf

$(OUTPUT).elf: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -T $(LDSCRIPT) -o $@

# Compile the source files into object files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(OUTPUT).elf

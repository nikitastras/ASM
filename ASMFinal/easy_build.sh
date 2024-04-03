#!/bin/bash

# Define variables for the source and output file names
SOURCE="adventure.asm"
OUTPUT="adventure"
OBJECT="${OUTPUT}.o"

# Step 1: Assemble the NASM source code into an object file
echo "Assembling $SOURCE..."
nasm -f elf64 $SOURCE -o $OBJECT

# Check if the assembly was successful
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

# Step 2: Link the object file to create the ELF executable
echo "Linking $OBJECT to create $OUTPUT..."
ld $OBJECT -o $OUTPUT

# Check if the linking was successful
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

# Step 3: Run the ELF executable
echo "Running $OUTPUT..."
./$OUTPUT

# Optionally, you can remove the object file after execution
# echo "Cleaning up..."
# rm $OBJECT

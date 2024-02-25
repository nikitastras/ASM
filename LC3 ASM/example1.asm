        .ORIG   x3000           ; Start of the program
        GETC                    ; Wait for and read a character from the keyboard into R0
        LD      R1, ASCII_A     ; Load ASCII value of 'a' into R1
        NOT     R1, R1          ; Invert R1
        ADD     R1, R1, #1      ; Add 1 to R1 to get the two's complement (negative of ASCII 'a')
        ADD     R2, R0, R1      ; Subtract ASCII 'a' from the input character
        BRnp    DONE            ; If result is not zero (positive or negative), branch to DONE

        ; If input is 'a', print the string
        LEA     R0, STRING      ; Load address of the string into R0
        PUTS                    ; Print the string located at the address in R0

DONE    HALT                    ; Stop the program

ASCII_A .FILL   #97             ; ASCII value for 'a'
STRING  .STRINGZ "Hello, World!" ; The string to print if the input is 'a'
        .END                    ; End of the program

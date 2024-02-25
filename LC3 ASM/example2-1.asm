    .ORIG x3000
    LEA R0, PROMPT1
    PUTS
    GETC
    OUT
    LD R2, OFFSET
    ADD R1, R0, R2

    LEA R0, PROMPT2
    PUTS
    GETC
    OUT
    LD R2, OFFSET
    ADD R3, R0, R2

    ADD R4, R1, R3
    OUT
    HALT

PROMPT1 .STRINGZ "Enter a number: "
PROMPT2 .STRINGZ "Enter another number: "
OFFSET .FILL x30
    .END
.ORIG x3000
    LD R0, number1      ; Load the value at label number1 into R0
    LD R1, number2      ; Load the value at label number2 into R1
    ST R2, SaveR2       ; Store R2 temporarily
    JSR SUB             ; Jump to the subroutine labeled SUB
    LD R2, SaveR2       ; Restore R2's original value
    ST R3, result       ; Store the result from R3 into the memory location labeled result
    HALT                ; Halt the program
    
number1 .FILL #10
number2 .FILL #-8
SaveR2 .BLKW 1
result .BLKW 1

SUB NOT R1, R1         ; Logical NOT operation on R1
    ADD R1, R1, #1     ; Increment R1 by 1
    ADD R2, R1, #1     ; Add 1 to R1, result in R2
    ADD R3, R0, R2     ; Add R0 and R2, result in R3
    RET                ; Return from subroutine
    
.END

        .ORIG   x3000           ; Start of the program
START   LEA     R1, ARRAY       ; Load the address of the array into R1
        LD      R2, LENGTH      ; Load the length of the array into R2
        AND     R3, R3, #0      ; Clear R3 to use as the sum accumulator
LOOP    BRz     DONE            ; If R2 is 0, we've summed all elements, jump to DONE
        LDR     R4, R1, #0      ; Load the next array element into R4
        ADD     R3, R3, R4      ; Add the value of R4 to the accumulator R3
        ADD     R1, R1, #1      ; Move to the next element in the array
        ADD     R2, R2, #-1     ; Decrement the length/count
        BR      LOOP            ; Repeat the loop until all elements are summed
DONE    ST      R3, RESULT      ; Store the sum result in the RESULT location
        HALT                    ; Stop the program

; Data section
ARRAY   .FILL   #1
        .FILL   #2
        .FILL   #3
        .FILL   #4              ; Example array with 4 elements (1+2+3+4=10)
LENGTH  .FILL   #4              ; Length of the array
RESULT  .BLKW   #1              ; Reserved space to store the result of the sum
        .END                    ; End of the program

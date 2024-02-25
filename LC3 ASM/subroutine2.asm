.ORIG x3000
    LD R0, number1
    LD R1, number2
    ST R2, SaveR2
    
    NOT R1, R1
    ADD R1, R1, #1
    ADD R2, R0, R1
    
    JSR ABS_DIFF
    
    LD R2, SaveR2
    ST R3, absResult
    
    HALT
    
number1   .FILL #10
number2   .FILL #-8
SaveR2    .BLKW 1
absResult .BLKW 1

ABS_DIFF NOT R2, R2
         ADD R2, R2, #1
         BRnp SKIP_INVERT
         NOT R2, R2
         ADD R2, R2, #1

SKIP_INVERT STR R2, R0, #0
            RET
            
.end

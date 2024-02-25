.ORIG x3000

; Initial setup
    LEA R0, intro          ; Load the address of the introduction text
    PUTS                   ; Print the introduction text
    LEA R0, choicePrompt   ; Load the address of the choice prompt text
    PUTS                   ; Print the choice prompt text

; Wait for player input
    GETC                   ; Get character from keyboard (blocking)
    OUT                    ; Echo the character
        BRp choice2            ; Branch to choice 2 if '2' or greater was pressed (simplification)
    BRz choice1            ; Branch to choice 1 if '1' was pressed


choice1
    LEA R0, outcome1       ; Load the address of the outcome1 text
    PUTS                   ; Print the outcome1 text
    BRnzp endGame          ; Unconditional jump to endGame

choice2
    LEA R0, outcome2       ; Load the address of the outcome2 text
    PUTS                   ; Print the outcome2 text
    BRnzp endGame          ; Unconditional jump to endGame

endGame
    HALT                   ; Halt the program

; Data section
intro .STRINGZ "You are standing at a crossroads. Will you go left or right?\n"
choicePrompt .STRINGZ "Press 1 to go left, 2 to go right: "
outcome1 .STRINGZ "\nYou chose to go left and found a treasure!\n"
outcome2 .STRINGZ "\nYou chose to go right and fell into a pit!\n"

.END

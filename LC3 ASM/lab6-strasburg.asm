; Set starting point
.ORIG   x3000

;declare stringz
Intro        .STRINGZ "Welcome to LC3 hero, the land of wonder.\n"
playerAbility .STRINGZ "Do you choose a Warrior, or a Wizard? "
playerName    .STRINGZ "What should we call you? "
playerStats   .STRINGZ "Level 1 "

displayPlayerName    .BLKW #25 ; Allocate space for up to 25 characters
displayPlayerAbility .BLKW #25

Start:
    LEA     R0, Intro
    PUTS
    LEA     R0, playerName
    PUTS
    LEA     R1, displayPlayerName

playerClass:
    GETC
    OUT
    STR     R0, R1, #0      ; Store character at index 0 in `displayPlayerName` buffer
    ADD     R1, R1, #1      ; Increment pointer
    ADD     R2, R0, #-10    ; Check if input is 'w' or 'W'
                             ; Subtracting 10 ensures that only these two letters will be considered positive
    BRnp    playerClass     ; If not 'w' or 'W', continue looping until valid input
    AND     R0, R0, #0      ; Clear R0 since it now contains the ASCII value of either 'w' or 'W'
    STR     R0, R1, #0      ; Store the selected class ('w') at index 0 in `displayPlayerName` buffer

    LEA     R0, playerAbility
    PUTS

StartGamePrompt:
    GETC
    OUT
    STR     R0, R1, #0
    ADD     R1, R1, #1
    ADD     R2, R0, #-10
    BRnp    StartGamePrompt

    LEA     R0, displayPlayerName
    PUTS
    LEA     R0, playerStats
    PUTS
    

    HALT
            .END
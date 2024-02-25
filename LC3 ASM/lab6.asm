    .ORIG       x3000
    BR          Start
    question    .STRINGZ "What's your name?\n"
    question2   .STRINGZ "Where do you live?\n"
    greeting    .STRINGZ "Hi, "
    location    .STRINGZ "Location: "

    firstName   .BLKW    #25
    address     .BLKW    #50

Start:
    LEA     R0, question
    PUTS
    LEA     R1, firstName

inputName:
    GETC
    OUT
    STR     R0, R1, #0
    ADD     R1, R1, #1
    ADD     R2, R0, #-10
    BRnp    inputName
    AND     R0, R0, #0
    STR     R0, R1, #0

    LEA     R0, question2
    PUTS
    LEA     R1, address

inputAddress:
    GETC
    OUT
    STR     R0, R1, #0
    ADD     R1, R1, #1
    ADD     R2, R0, #-10
    BRnp    inputAddress

    LEA     R0, greeting
    PUTS
    LEA     R0, firstName
    PUTS
    LEA     R0, location
    PUTS
    LEA     R0, address
    PUTS

    HALT
            .END

	.ORIG	x3000 ; Starting point
	
	; Prompt for user input
	LEA	R0, PROMPT	; Load address of input
	PUTS			; Display user input
	
	; Read single digit input from user
	GETC			; Get digit
	OUT			; Output char
	LD	R2, ZERO	; Load ASCII value 0
	NOT	R2, R2
	ADD	R2, R2, #1	; Add 1 to get twos complement
	ADD	R1, R0, R2	; Subtract value of 0 to convert to num
	
	; Add 1 to our user input number
	ADD	R1, R1, #1	; R1 = R1 + 1

	; Check if number is greater than 10
	ADD 	R2, R1, #-10	; Subtract
	BRp	NUM_CEILING

	; If not greater store 0 in RESULT
	AND	R0, R0, #0	; Clear R0
	ST	R0, RESULT	; Store 0 at RESULT
	BR	END_PROGRAM 

NUM_CEILING
	; If greater store 1 in RESULT
	AND	R0, R0, #0	; Clear R0
	ADD	R0, R0, #1	; Set R0 to 1
	ST	R0, RESULT	; Store 1 at RESULT

END_PROGRAM
	HALT

PROMPT	.STRINGZ "Enter single digit number: "
RESULT	.BLKW	1		; Memory location store result
ZERO	.FILL x0030		; ASCII value 0
	.END
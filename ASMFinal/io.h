; standard file descriptors
STDIN 			equ 		0
STDOUT 			equ 		1

; system calls
SYS_exit 		equ			60
SYS_read 		equ	 		0
SYS_write 		equ 		1
SYS_open 		equ	 		2
SYS_creat		equ			85
SYS_close 		equ	 		3

; file open modes
O_RDONLY 		equ 		0
O_WRONLY 		equ 		1
O_RDWR 			equ			2

; misc
NEWLINE			equ			0xA
ENDLINE			equ			0
GOOD_PERMISSION equ			0666o

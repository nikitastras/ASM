%include "io_macros.mac"
%include "io.h"

SECTION .bss
input resb 2

SECTION .data
; Game dialogue
introText db NEWLINE, 'You are a distant traveler in seek of treasure.', NEWLINE, \
           'On your path you will find treasure.', NEWLINE, \
           'Your objective is to navigate the dungeon until you get to the treasure room.', NEWLINE, \
           'Where you will find riches beyond your wildest dreams!', NEWLINE, NEWLINE, \
           'The game ends when you find treasure.', NEWLINE, \
           'The game resets if you hit a pitfall.', NEWLINE, \
           'You win the game once you discover the treasure room.', ENDLINE

           
introLen equ $ - introText

;Left room choices
leftChoice1 db 'You went left and found a treasure! Do you take it or leave it? (L or R or S): ', ENDLINE
leftLen equ $ - leftChoice1
;End left room choices

;Right room choices
rightChoice1 db 'You went right and fell into a pit! Do you climb out or rest? (L or R or S): ', ENDLINE
rightLen equ $ - rightChoice1
;End right room choices

gameIntro db NEWLINE, NEWLINE, 'You are at the start of the cave, do you venture left, or right?', NEWLINE, \
           'Type Option (L or R): ', ENDLINE
gameIntroLen equ $ - gameIntro

sayPitfall db 'You hit a pitfall, game reset.', ENDLINE
pitfallLen equ $ - sayPitfall

filename db 'congratulations.txt', 0

newRoomMessage db 'You entered a new room.', ENDLINE
newRoomMessageLen equ $ - newRoomMessage

winMessage db 'Congratulations, you won all the treasure!', ENDLINE
winMessageLen equ $ - winMessage

takeTreasure db 'You took the treasure and became rich!', ENDLINE
takeLen equ $ - takeTreasure

leaveTreasure db 'You left the treasure and remained humble.', ENDLINE
leaveLen equ $ - leaveTreasure

climbOut db 'You climbed out of the pit and escaped danger.', ENDLINE
climbLen equ $ - climbOut

restInPit db 'You rested in the pit and found a hidden exit.', ENDLINE
restLen equ $ - restInPit

invalidChoice db 'Invalid choice. Please choose again.', ENDLINE
invalidLen equ $ - invalidChoice
; End game dialogue

SECTION .text
global _start
_start:
    ; Display the introductory text
    print introText, introLen
    ; Jump to the game start logic
    jmp gameStart
    
gameStart:
    ; Print the initial game choice prompt
    print gameIntro, gameIntroLen
    ; Read the player's choice
    readInput input
    ; Compare the input and jump based on the choice
    cmp byte [input], 'L'
    je leftRoom1
    cmp byte [input], 'R'
    je rightRoom1
    ; If input is not recognized, inform the player and restart the game
    print invalidChoice, invalidLen
    jmp gameStart


treasureRoom:
	print winMessage, winMessageLen
	readInput input
	jmp gameEnd
take:
    print takeTreasure, takeLen
    jmp gameEnd

leave:
    print leaveTreasure, leaveLen
    jmp restart

climb:
    print climbOut, climbLen
    jmp gameEnd

rest:
    print restInPit, restLen
    jmp gameEnd

restart:
    jmp _start
  
pitfall:
	print sayPitfall, pitfallLen
	jmp gameStart


; Left Option paths
leftRoom1:
    print leftChoice1, leftLen
    readInput input
    cmp byte [input], 'L'
    je take
    cmp byte [input], 'R'
    je leave
    cmp byte [input], 'S'
    je leftRoom2
    print invalidChoice, invalidLen
    jmp leftRoom1


leftRoom2:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je leftRoom3
    print invalidChoice, invalidLen
    jmp leftRoom2

leftRoom3:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je take
    cmp byte [input], 'L'
    je leftRoom4
    cmp byte [input], 'S'
    je pitfall
    print invalidChoice, invalidLen
    jmp leftRoom3

leftRoom4:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je leftRoom5
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je pitfall
    print invalidChoice, invalidLen
    jmp leftRoom4
    
leftRoom5:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je leftRoom6
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je take
    print invalidChoice, invalidLen
    jmp leftRoom5

leftRoom6:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je pitfall
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je leftRoom7
    print invalidChoice, invalidLen
    jmp leftRoom6

leftRoom7:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je pitfall
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je treasureRoom
    print invalidChoice, invalidLen
    jmp leftRoom7

; Right Option paths
rightRoom1:
    print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je pitfall
    cmp byte [input], 'S'
    je rightRoom2
    print invalidChoice, invalidLen
    jmp rightRoom1

rightRoom2:
	print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je take
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je rightRoom3
    print invalidChoice, invalidLen
    jmp rightRoom2

rightRoom3:
	print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je pitfall
    cmp byte [input], 'L'
    je rightRoom4
    cmp byte [input], 'S'
    je take
    print invalidChoice, invalidLen
    jmp rightRoom3

rightRoom4:
	print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'L'
    je pitfall
    cmp byte [input], 'S'
    je rightRoom5
    print invalidChoice, invalidLen
    jmp rightRoom4

rightRoom5:
	print newRoomMessage, newRoomMessageLen
    readInput input
    cmp byte [input], 'R'
    je treasureRoom
    cmp byte [input], 'L'
    je take
    cmp byte [input], 'S'
    je pitfall
    print invalidChoice, invalidLen
    jmp rightRoom5


gameEnd:
    exit

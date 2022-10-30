.model small
.stack
.data
msg1 db 10,13,"Mouse driver present: $"
.code
disp macro xx
mov ah,09
lea dx,xx
int 21h
endm
.startup
;;ALL MOUSE ROUTINES ARE WITH 33H

mov ax,0000;mouse driver check ;RESET THE MOUSE
int 33h

cmp ax,00h
je last
disp msg1

;MOUSE CURSOR POSITION 0004
mov ax,0004
;CX MOUSE POSITONS 
mov cx,0 
;DX MOUSE POSITONS
mov dx,0 
int 33h

;SET HORIZONTAL LIMIT 0007
mov ax, 0007 
mov cx,0010
mov dx,055h
int 33h

;SET VERTICAL LIMIT 0008
mov ax, 0008
mov cx,0010
mov dx,055h
int 33h

pixel:
;DISPLAY MOUSE CUURSOR 0001
mov ax,0001 
int 33h

;READ THE CURSOR 0003
mov ax,0003
int 33h

;AS SOON AS LEFT BUTTON CLICKED JUMP
cmp bx,01 ;when left button clicked bx becomes 01
je left
jmp right

left:
;SET GRAPHICS MODE
mov bx,0011h 
int 10h

;DISPLAY PIXEL ON SCREEN
mov ah,0ch 
int 10h

right:
;DISPLAY MOUSE CURSOR
mov ax,0001
int 33h

;AS SOON AS RIGHT BUTTON CLICKED JUMP
cmp bx,02;when right button clicked bx becomes 02
je last
jmp pixel

last:
;SET TEXT MODE
mov ax,00 
int 10h

.exit

end
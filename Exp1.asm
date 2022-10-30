.model small
.data
    msg1 db 10,13,"Enter 8 bit nos : $"
    msg2 db 10,13,"8 bit nos is : $"

.code
.startup

;print msg 1
mov ah,09h
lea dx,msg1
int 21h

;input single character
mov ah,01h
int 21h


sub al,30h
mov cl,04h
shl al,cl
mov bl,al

;input single character
mov ah,01h
int 21h


sub al,30h
add al,bl
mov bh,al

;print msg 1
mov ah,09h
lea dx,msg2
int 21h


;print msb digit
mov bl,bh
and bl,0f0h
shr bl,cl
add bl,30h

;print single character
mov dl,bl
mov ah,02h
int 21h


mov bl,bh
and bl,0fh
add bl,30h

;print single character
mov dl,bl
mov ah,02h
int 21h
.exit
end
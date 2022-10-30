.model small
.data
    msg1 db 10,13,"Result of addition is: $"
    num1 dw 1234h
    num2 dw 1111h
    res dw ?

.code

print macro XX
mov ah,09h
lea dx,XX
int 21h
endm

.startup

print msg1

call addproc

mov bx, res


mov ch,bh
and ch,0f0h
mov cl,04h
shr ch,cl
add ch,30h
mov dl,ch
mov ah,02h
int 21h


mov ch,bh
and ch,0fh
add ch,30h
mov dl,ch
mov ah,02h
int 21h


mov dh,bl
and dh,0f0h
mov cl,04h
shr dh,cl
add dh,30h
mov dl,dh
mov ah,02h
int 21h


mov dh,bl
and dh,0fh
add dh,30h
mov dl,dh
mov ah,02h
int 21h

mov ah, 4ch
int 21h


addproc proc xx
    mov ax, num1
    add ax, num2
    mov res, ax
    ret
endp


.exit
end
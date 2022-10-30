.model small
.data
hex dw 0ACh     
counter db 0
.code
mov ax, @data
mov ds,ax
mov ax,hex
mov bx, 000Ah

L:
inc counter
div bx
push dx
cmp ax,0
mov dx,00
je exit
jmp L

exit:
mov cl, counter
mov ch,00h

L1:
pop dx
add dl,30h 
mov ah,02h
int 21h 
LOOP L1
mov ah,4ch
int 21h
ret
ends
End
.model small
.stack
.data
m1 db 10,13,"Enter 1st string:$"
m2 db 10,13,"Length of 1st string:$"
m3 db 10,13,"Display 1st string:$"
m4 db 10,13,"Enter 2nd string:$"
m5 db 10,13,"Length of 2nd string:$"
m6 db 10,13,"Display 2nd string:$"
m7 db 10,13,"Comparison : $ &"
m8 db 10,13,"Strings are Equal$"
m9 db 10,13," Strings are not Equal$"
m10 db 10,13,"Concatenatd String is : $"

str1 db 80,?,80 DUP(?)
str2 db 80,?,80 DUP(?)
str3 db 80,?,80 DUP(?)

.code
Disp macro xx
mov ah,09h
lea dx,xx
int 21h
endm

.startup
Disp m1 ;Enter 1st string
mov ah,0Ah ;Read a string from the keyboard into buffer addressed by DX
lea dx,str1
int 21h

Disp m2 ;Length of 1st string
lea si,str1+1
mov dl,[si]
mov cl,dl
add dl,30h
mov ah,02h
int 21h

Disp m3 ;Display 1st string
lea si,str1+2



Back:
mov dl,[si]     ;
mov ah,02h      ;printing single char 1 by 1
int 21h         ;
inc si          ;
dec cl          ;
jnz Back        ;

Disp m4 ;Enter 2nd string
mov ah,0Ah
lea dx,str2
int 21h

Disp m5 ;Length of 2nd string
lea si,str2+1
mov dl,[si]
mov cl,dl
add dl,30h
mov ah,02h
int 21h

Disp m6 ;Display 2nd string
lea si,str2+2
Back1:
mov dl,[si]
mov ah,02h
int 21h
inc si
dec cl
jnz Back1

Disp m7 ; Comparison
lea si,str1+1

mov cl,[si]
lea di,str2+1
mov ch,[di]
cmp cl,ch
jnz AA
lea si,str1+2
lea di,str2+2

Back2:
mov dl,[si]
mov dh,[di]
cmp dl,dh
jnz AA
inc si
inc di
dec cl
jnz Back2

Disp m8 ;Strings are Equal
jmp con

AA:
Disp m9 ; Strings are not Equal

con:
Disp m10 ;Concatenatd String is

lea si,str1+1
mov cl,[si]
mov bl,cl

lea di,str2+1
mov ch,[di]
mov bh,ch
add bl,bh

lea si,str1+2
lea di,str3+2

Back3:
mov dl,[si]
mov [di],dl
inc si
inc di
dec cl
jnz back3

lea si,str2+2

Back4:
mov dl,[si]
mov [di],dl
inc si
inc di
dec ch
jnz Back4

lea di,str3+2

Back5:
mov dl,[di]
mov ah,02h
int 21h
inc di
dec bl
jnz Back5

Exit:
.exit
end
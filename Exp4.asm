.model small
.data
m1 db 10,13,"Negative numbers are: $"
m2 db 10,13," $"
arr1 db 50h,0FAh,25h,98h,0F3h
arr2 db 5 dup(0)

.code
disp macro XX
mov ah,09h
lea dx,XX
int 21h
endm

.startup
mov ch,0
mov cl,5
lea SI,arr1
lea DI,arr2

back:
mov dl,[SI]
and dl,80h
jz positive
mov bl,[SI]
mov [DI],bl
inc DI
inc ch

positive:
inc SI
dec cl
jnz back

disp m1
lea DI,arr2

back1:
mov bh,[DI]
mov cl,04
shr bh,cl
cmp bh,09
jbe step1
add bh,37h
jmp print1


step1:
add bh,30h

print1:
mov dl,bh
mov ah,02h
int 21h

mov bh,[DI]
and bh,0fh
cmp bh,09
jbe step2
add bh,37h
jmp print2

step2:
add bh,30h

print2:
mov dl,bh
mov ah,02h
int 21h

disp m2

inc DI
dec ch
JNZ back1

mov ah,4ch
int 21

.exit
end

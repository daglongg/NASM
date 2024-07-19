.model tiny
.stack 100h
.data
tb1 db 'Enter 2 number positive integer: $'
tb2 db 13,10, '$',13,10
tb3 db 13,10,'Sum of 2 entered number: $'

so1 dw 0
so2 dw  0
tong dw 0
.code
main proc
mov ax,@data
mov ds,ax
;in thong bao nhap so thu nhat
lea dx,tb1
mov ah,9
int 21h 
lea dx,tb2
mov ah,9
int 21h
nhap1:
mov ah,1
int 21h
cmp al,13
je nhap2 
sub al,30h 
mov ah,0 
mov cx,ax 
mov ax,so1 
mov bx,10 
mul bx
add ax,cx 
mov so1,ax 
jmp nhap1
nhap2:
lea dx,tb2
mov ah,9
int 21h
nhap: mov ah,1 
int 21h
cmp al,13
je tinhtong 
sub al,30h 
mov ah,0 
mov cx,ax 
mov ax,so2 
mov bx,10 
mul bx 
add ax,cx 
mov so2,ax 
jmp nhap
tinhtong:
mov dx,tong
mov ax,so1 
mov bx,so2 
add ax,bx 
mov tong,ax 
inso: mov ah,9
lea dx,tb3
int 21h
mov ax,tong 
mov dx,0 
mov bx,10 
mov cx,0 
chia: div bx 
push dx 
inc cx 
cmp ax,0 
je hienkq 
xor dx,dx 
jmp chia
hienkq: pop dx 
add dl,30h 
mov ah,2 
int 21h
loop hienkq
ra: mov ah,4ch
int 21h
Main endp
End main
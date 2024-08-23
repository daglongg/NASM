section .data ; Khai bao data khong thay doi theo thoi gia
    helloWord db 'Hello,Word!', 0Ah ; 0Ah la ki tu xuong dong
    lenString equ $-helloWord
    ; db la defind byte. 
section .bss ; khai bao bien

section .text ; 
    global _start
        _start:
            ;In ra sau ki tu helloWord
            mov eax, 4
            mov ebx, 1
            mov ecx, helloWord
            mov edx, lenString
            int 80h

            mov eax, 1
            int 80h







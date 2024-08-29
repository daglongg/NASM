section .data
    msg1 db 'Enter the number 1: '
    lenNum1 equ $-msg1
    
    msg2 db 'Enter the number 2: '
    lenNum2 equ $-msg2
    
    msgSum db 'Sum of num1 and num2 is: '
    lenSum equ $-msgSum
    

section .bss
    num1 resb 2

    num2 resb 2

    sum resb 2
section .text

    global _start

_start:

        ;Hien thi sau ki tu num1
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, lenNum1
        int 80h

        ; Nguoi dung nhap tu ban phim vao num 1

        mov eax, 3
        mov ebx, 0
        mov ecx, num1
        mov edx, 32
        int 80h

        ;Hien thi sau ki tu num 2

        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, lenNum2
        int 80h

        ; Nguoi dung nhap tu ban phim vao num 2

        mov eax, 3
        mov ebx, 0
        mov ecx, num2
        mov edx, 32
        int 80h


        mov eax, 4
        mov ebx, 1
        mov ecx, msgSum
        mov edx, lenSum
        int 80h

        mov eax, [num1]
        sub eax, '0'

        mov ebx, [num2]
        sub ebx, '0'

        add eax, ebx
        mov [sum], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, sum
        mov edx, 2
        int 80h

        mov eax, 1
        int 80h



        





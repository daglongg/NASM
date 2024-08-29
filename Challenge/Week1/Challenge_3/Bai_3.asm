section .data
    msg db 'Enter the text: '
    lenMsg equ $-msg

    Noti db 'This is a string of flowers: '
    lenNoti equ $-Noti

    space db 0x0A
    lenSpace equ $-space

section .bss

    text resb 32

section .text
    global _start
        _start:

            mov eax, 4
            mov ebx, 1
            mov ecx, msg
            mov edx, lenMsg
            int 80h

            mov eax, 3
            mov ebx, 0
            mov ecx, text
            mov edx, 32
            int 80h

            mov eax, 4
            mov ebx, 1
            mov ecx, Noti
            mov edx, lenNoti
            int 80h


            call inHoa

            mov eax,4
            mov ebx, 1
            mov ecx, space
            mov edx, lenSpace
            int 80h

            mov eax, 1
            int 80h
        
        ;Logic chính ở đây là ta sẽ so sanh kí tự đó trong khoảng từ A => Z. Nếu k nằm trong khoảng đó thì ta sẽ trừ đi 32


        inHoa:
            lea esi, text+0
            lap1:
                mov al, [esi] ; esi là địa chỉ ô nhớ của text, và nó sẽ gián giá trị đầu tiên cho ô nhớ al
                cmp al, 'a'
                jl In
                cmp al, 'z'
                jg In
                sub al, 32
            In:
                mov [esi], al
                mov eax, 4
                mov ebx, 1
                lea ecx, [esi] ; đoạn này dùng lea thay vì mov và bả chất ecx cần địa chỉ để in.
                mov edx, 1
                int 80h
                inc esi
                cmp byte [esi], 0x0A
                jne lap1

            ret





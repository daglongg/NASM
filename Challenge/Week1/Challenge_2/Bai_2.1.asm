section .data
    msg db 0

section .bss

    userEnter resb 32

section .text
    global _start
        _start:

            mov eax, 3
            mov ebx, 0
            mov ecx, userEnter
            mov edx, 32
            int 80h

            push eax
            mov eax, userEnter    
            call len
            mov ecx, eax
            pop eax

            mov eax, ecx
            add eax, '0'
            mov [msg], eax


            mov eax, 4
            mov ebx, 0
            mov ecx, msg
            mov edx, 1
            int 80h

            mov eax ,1
            int 80h

            len:
                push ebx
                mov ebx, eax
            nextIndex:
                cmp byte [eax], 0x0A ; So sanh voi \n de ket thuc dem
                jz finished
                inc eax
                jmp nextIndex
            finished:
                sub eax, ebx
                pop ebx
                ret

            

            

            






        




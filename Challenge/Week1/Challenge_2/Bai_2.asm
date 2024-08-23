section .data
    mess db 'Enter the text: '
    lenMess equ $-mess 

    printMess db 'Text your enter is: '
    lenPrint equ $-printMess
section .bss
    userEnter resb 32; resb la 10 byte, tam 2^79
section .text
    global _start
        _start:
            ; Display mess ask user enter text    
            mov eax, 4
            mov ebx, 1
            mov ecx, mess
            mov edx, lenMess
            int 80h

            ; user enter
            mov eax, 3
            mov ebx, 1
            mov ecx, userEnter   
            mov edx, 32
            int 80h

            ; Print mess display
            mov eax, 4
            mov ebx, 1
            mov ecx, printMess
            mov edx, lenPrint
            int 80h

            ; Print user enter
            mov eax, 4
            mov ebx, 1
            mov ecx, userEnter
            mov edx, 32
            int 80h
            
            ;Exit program
            mov eax, 1
            int 80h






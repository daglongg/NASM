.model small
.stack 100h
.data
    str db 256 dup('$')
    tb1 db 'Input anything here: $'
    tb2 db 10, 13,'Your string entered: $' 
    tb3 db 10, 13,'Your string entered does not contain lower case or This is not text', 10, 13, '$'
    
.code
main proc 
    
    mov ax, @data
    mov ds, ax   
    
    enterText:
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 10
    lea dx, str
    int 21h
     
    lea si, str + 2 
    mov bl, 0 
    checkInput:
    mov dl, [si] 
    cmp dl, '$'
    je checkFinal
    cmp dl, 'A'
    jl checkLowercase
    cmp dl, 'Z'
    jg checkLowercase  
    inc bl
    
    checkLowercase: 
    inc si
    cmp al, ' '
    je skipSpace
    jmp checkInput
    
    skipSpace:
    inc si
    jmp checkInput
    
    checkFinal:
    cmp bl, 0
    je thongbao1 
    
    mov ah, 9
    lea dx, tb2
    int 21h
    mov cx, 0
    mov cl, [str + 1] 
    lea si, str + 2 
    changeCase:
    mov dl, [si]
    cmp dl, 'a'
    jl inra
    cmp dl, 'z'
    jg inra
    sub dl, 32 
    inra:
    mov ah, 2
    int 21h
    inc si
    cmp [si], '$'
    jne changeCase
    call done
    
    thongbao1:
    mov ah, 9
    lea dx, tb3
    int 21h
    call enterText
    
    done:
    mov ah, 4ch
    int 21h


main endp
end main

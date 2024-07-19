.MODEL SMALL
.STACK 100H
.DATA 
    str db 10 dup('$')   
    tb1 db 'Enter a number: $' 
    tb2 db 10,13,'This is not number ',10,13,'$' 
    tb3 db 10,13,'This is even number $' 
    tb4 db 10,13,'This is odd number $'
 
.CODE   

MAIN PROC
    
    mov ax, @data
    mov ds, ax 
      
      
    enterNumber:    
    mov ah, 9
    lea dx, tb1
    int 21h   
    
    mov ah, 10
    lea dx, str
    int 21h 
    mov cx, 0
    mov cl, [str + 1]
    lea si, str + 2                           11
         
    checkInput:  
    mov dl, [si]
    cmp dl, '0'
    jl thongbao1
    cmp dl, '9'             
    jg thongbao1
    inc si
    loop checkInput 
    
    mov cl, [str + 1]
    lea si, str + 2 
    mov ax, 0
    mov bx, 10
    changeToNumber: 
        mul bx
        mov dl, [si]
        sub dl , '0'
        add ax,dx
        inc si
        loop changeToNumber 
    mov cx,2
    div cx
    
    
    cmp ah, 0
    JZ thongbao2
    cmp ah, 0
    JNE thongbao3   
    call done
    
    thongbao1: 
    mov ah, 9
    lea dx, tb2
    int 21h
    call enterNumber 
    
    thongbao2:
    mov ah, 9
    lea dx, tb3
    int 21h
    call done
    
    thongbao3: 
    mov ah, 9
    lea dx, tb4
    int 21h
    call done
    
    done:
    mov ah, 4ch
    int 21h

    
           
Main endp
end main 


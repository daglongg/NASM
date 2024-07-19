.model small
.stack 100h
.data
  str db 10 dup('$') 
  tb1 db 'Enter the number: $'
  tb2 db 10, 13,'Sum of $'
  tb3 db ' sequences is: $' 
  tb4 db 10,13,'This is not number ', 10,13,'$'  
 
  

.code
main proc
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
    lea si, str + 2 
         
    checkInput:  
    mov dl, [si]
    cmp dl, '0'
    jl thongbao1
    cmp dl, '9'             
    jg thongbao1
    inc si
    loop checkInput 
   mov cx, 0
   mov cl,[str + 1]
   lea si, str + 2
   mov ax, 0
   mov bx, 10    
   changeToNumber: 
       mul bx 
       mov dl, [si]
       sub dl, '0'
       add ax, dx
       inc si
       loop changeToNumber  
   mov cx, ax
   mov al, 0
   mov bl,1
   total:
        add al, bl
        inc bl
        loop total    
      
   mov ah, 2                        
   mov dl, al
   int 21h
   call done 

   thongbao1:
   mov ah, 9
   lea dx, tb4
   int 21h  
   call enterNumber 
   
   done:
   mov ah, 4ch
   int 21h
   
   
   
   
    
main endp
end main

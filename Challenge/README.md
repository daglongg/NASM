# NASM

## Compiling and Linking an Assembly Program in NASM ( Cú pháp biên dịch 1 file NASM)

```
nasm -f elf helloworld.asm
```
```
ld -m elf_i386 helloworld.o -o helloworld
```
## Structure of simple assembly program ( Cấu trúc của 1 chương trình ASM )

- The data section: Đây là phần khai báo các dữ liệu mà nó sẽ không thay đổi trong suốt quá trình chạy của chương trình.

          Syntax: section.data

- The bss section:  Đây là nơi sẽ khai báo các biến

          Syntax: section.bss

- The text section: Đây là nơi code sẽ được thực thi. Và ta sẽ bắt buộc phải khai báo `global_start` để kernel biết nơi bắt đầu thực thi chương trình

          Syntax: section.text
  
          global_start
          _start:

          code
## Registers ( Thanh ghi ) 32 bit

`32 bit: EAX, EBX, ECX, EDX`

`16 bit: AX, BX, CX, DX`

`8 bit: AH, AL, BH, BL, CX, CL, DX, DL`

- AX: Đây là thanh ghi được sử dụng trong các phép toán số học. Đặc biệt là phép nhân

- BX: Đây là thanh ghi cơ sở, sử dụng trong việc đánh địa chỉ theo chỉ số

- CX: Đây là thanh ghi sẽ lưu trữ số vòng lặp trong các hoạt động lặp
  
- DX: Thanh ghi dữ liệu, thanh ghi này là nơi lưu kết quả của phép toán số học với các giá trị lớn. Kết hợp với AX để lưu

### Pointer Registers ( Thanh ghi con trỏ )

- Intruction Pointer (IP): Con trỏ này lưu trữ địa chỉ offset của câu lệnh tiếp theo. Xem địa chỉ của câu lệnh hiện tại [CS:IP]

- Stack Pointer (SP): Cung cấp giá trị offset trong ngăn xếp chương trình

- Base Pointer (BP): Tham chiếu các biến tham số được truyển cho chương trình con

## System call ( Gọi hệ thống, là các hàm cơ bản để tương tác với hệ điều hành ) 

`https://rbmj.github.io/iwg/exploit/x86_table.html`

- Các bước để gọi hệ thống LINUX trong chương trình của mình: 

  + Thiết lập giá trị cho EAX
      
  + Thiết lập các đối số cho EBX, ECX, EDX

    * EDX: Độ dài của mes
   
    * ECX: Mess
   
    * EBX:

  + INT 80h
 
  + Kết quả sẽ ở trong ghi EAX
 
  ![image](https://github.com/user-attachments/assets/2136ce22-17b1-4a29-99c2-0e24e8325b34)

  ## Variables (Biến)

  





          
        

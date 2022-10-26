data segment para public 'data'
data ends

stk segment stack

db 256 dup ('?')

stk ends
code segment para 'code'
main proc

assume cs:code,ds:data,ss:stk

mov ax, 1000100110100110b
mov bx, 0111100101000100b
mov dx, 0000010001000110b
mov cx, 1100000000101010b
add ax, bx
adc dx, cx

xor ax,ax
xor bx,bx
xor cx,cx
xor dx,dx

mov ax, 1100100011000001b
mov bx, 0000101110001101b
mov cx, 1100001111100000b
mov dx, 1111000000000010b

sub ax, bx
sbb dx, cx
mov ax, 4c00h
int 21h

main endp
code ends
end main

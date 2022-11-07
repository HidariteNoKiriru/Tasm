data segment para public 'data'
data ends

stk segment stack

db 256 dup ('?')

stk ends
code segment para 'code'
main proc

assume cs:code,ds:data,ss:stk
                    ; exit - close programm
mov al, 2
mov dl,al
mov bl, 2
imul bl             ; x*y
cmp ax,0
jl Less             ; x*y < 0
cmp ax,5
jg Greater          ; x*y > 5
jmp Middle          ; 0 < x*y < 5

Less:
add dl,bl           ; x + y
mov cl,dl
jmp exit

Greater:
mov cl,bl           ; z = y
jmp exit

Middle:
sub dl,bl           ; x- y
mov cl,dl

exit:
mov ah, 4ch
int 21h

main endp
code ends
end main

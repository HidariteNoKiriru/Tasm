data segment para public 'data'
data ends

stk segment stack

db 256 dup ('?')

stk ends
code segment para 'code'
main proc

assume cs:code,ds:data,ss:stk
mov cx, 0FFE6h
xor cx,cx
mov ax, 0FFE6h
xor ah,ah
mov bx, 0FFE4h
xor bl,bl
nop;Обнуление регистров

mov ax, 1111011111100010b
and ax, 1111111100000000b
nop; Оставить значащие биты старшей части

xor ax,ax

or ah, 11111111b
nop; Заполнить все единицами

xor ax,ax

mov bx,7
or bx,30h
nop; число 7 в ASCII-код символа 7

mov bl,34h
xor bl,30h
nop; Значение ASCII-кода в числовом формате

and al,0h; Установить флаг ZF

mov ah, 9
stc
or ah,ah
nop; Сбросить флаги CF и ZF

mov ah, 4ch
int 21h
main endp
code ends
end main

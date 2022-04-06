[bits 16]
clear_screen:
    push ax
    push bx
    push dx

    mov bx, 50

.loop:
    mov ax, 0xA
    call print_char
    dec bx
    jnz .loop

    mov ah, 2
    mov dl, 0
    mov ah, 0
    mov bh, 0
    int 0x10

    pop dx
    pop bx
    pop ax
    ret
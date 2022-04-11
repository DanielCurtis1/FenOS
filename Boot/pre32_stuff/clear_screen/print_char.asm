[bits 16]
print_char:
    push ax
    mov ah, 0x0e
    int 0x10
    pop ax
    ret
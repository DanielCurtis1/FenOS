[bits 16]
load_sectors:
    push ax
    push bx
    push cx
    push dx
    push ax

.reset:
    mov ah, 0
    int 0x13
    jc .reset

    mov ah, 0x02
    int 0x13

    jc read_error

    pop cx
    cmp al, cl
    jne read_error

    pop dx
    pop cx
    pop bx
    pop ax
    ret

read_error:
    cli
    hlt
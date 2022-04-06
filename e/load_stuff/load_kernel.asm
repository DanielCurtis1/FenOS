[bits 16]
load_kernel:
    pusha

    mov bx, KERNEL_OFFSET
    mov al, 50
    mov dl, [BOOT_DRV]
    mov ch, 0
    mov cl, 2
    mov dh, 0
    call load_sectors

    popa
    ret
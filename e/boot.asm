[bits 16]
[org 0x7c00]


start: ;bullshit pointer shit I hate pointers
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, STACK
    mov sp, bp
    jmp 0:main

main:
    sti
    mov [BOOT_DRV], dl

    call clear_screen

    call load_kernel
    call pm_switch

    hlt

KERNEL_OFFSET equ 0x1000
STACK equ 0x9000

BOOT_DRV db 0

%include "pre32_stuff/pm_switch.asm"
%include "load_stuff/load_kernel.asm"
%include "pre32_stuff/gdt.asm"
%include "load_stuff/load_sectors.asm"
%include "pre32_stuff/clear_screen/clear_screen.asm"
%include "pre32_stuff/clear_screen/print_char.asm"

[bits 32]
BEGIN_PM:

    call KERNEL_OFFSET
    hlt

times 510-($-$$) db 0 ;magic
dw 0xaa55
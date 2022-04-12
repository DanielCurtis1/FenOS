[bits 32]

[global start]
[extern _main]

start:
    call _main
    jmp $
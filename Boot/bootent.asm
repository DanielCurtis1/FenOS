[bits 32]

[global start]
[extern main]

start:
    call main
    cli
    htl
::boot
nasm "Boot/boot.asm" -f bin -o "Bin/boot.bin" -i Boot

nasm "Boot/zeroes.asm" -f bin -o "Bin/zeroes.bin"

::kernel
g++ -ffreestanding -m32 -g -c "Kernel/kernel.cpp" -o "Bin/kernel.o" -I Kernel

nasm "Boot/kernelent.asm" -f elf -o "Bin/kernelent.o" -i Kernel

::broken::
ld -o "Bin/kernel.bin" -Ttext 0x1000 "Bin/kernelent.o" "Bin/kernel.o" --oformat binary
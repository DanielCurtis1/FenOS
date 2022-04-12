::boot
nasm "Boot/boot.asm" -f bin -o "Bin/boot.bin" -i Boot

nasm "Kernel/zeroes.asm" -f bin -o "Bin/zeroes.bin"

::kernel
g++ -ffreestanding -m32 -g -c "Kernel/kernel.cpp" -o "Bin/kernel.o" -I Kernel

nasm "Kernel/kernelent.asm" -f elf -o "Bin/kernelent.o" -i Kernel

::linker (temporary fix)
ld -o "Bin/fullkernel.tmp" -Ttext 0x1000 "Bin/kernelent.o" "Bin/kernel.o"
objcopy -O binary -j .text "Bin/fullkernel.tmp" "Bin/fullkernel.bin" 

::final

cd Bin

copy /b boot.bin + /b fullkernel.bin + /b zeroes.bin OS.bin

del boot.bin, fullkernel.bin, kernel.o, kernelent.o, zeroes.bin, fullkernel.tmp

pause
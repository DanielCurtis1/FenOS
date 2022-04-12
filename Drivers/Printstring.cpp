#include "Printstring.h"

void puts(int color, const char *str){
    volatile char *VID = (volatile char*)0xb8000;
    while(*str != 0){
        *VID++ = *str++;
        *VID++ = color;
    }
}


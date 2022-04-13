#include "Printstring.h"
#include "../Util/Typedef.h"
uint8_t* VID = (uint8_t*)0xb8000;
void putc(int color, uint8_t chr){

    *VID = chr;
    VID++;
    *VID = color;
    VID++;
}

void puts(const uint8_t* str, int color){
    for (int i = 0; str[i] != '\0'; i++){
        putc(color, (uint8_t)str[i]);
    }
}

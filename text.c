#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location
void drawChar(int row, int col, char ch, unsigned short color) {
    // TODO 1.0: Complete this function
    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[OFFSET(r, c, 6) + ch * 48]) {
                setPixel3(row+r, col+c, color);
            }
        }
    }

}

// Draws the specified string at the specified location
void drawString(int row, int col, char *str, unsigned short color) {
    // TODO 2.0: Complete this function
    while(*str != '\0') {
        drawChar(row, col, *str, color);
        col += 6;
        str++;
    }
}

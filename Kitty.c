//adds graphics.h and stdio.h to file
#include <graphics.h>
#include <stdio.h>

//function to draw circle
void draw_red_circle(void) {
    
    //searches for a graphics driver
    int i, j = 0, gd = DETECT, gm;
    
    //passes three arguments to initgraph
    initgraph(&gd, &gm, "");
        
    circle(0, 0, 50);
    //I do not know the purpose of this
    getch();
    //or this
    closegraph();
    
}

int main() {
 //calls the function that draws the circle
    draw_red_circle();
    
    return 0
}

//adds graphics.h and stdio.h to file
#include <graphics.h>
#include <stdio.h>

//function to draw circle
void draw_red_circle(void) {
    
    //searches for a graphics driver
    int i, j = 0, gd = DETECT, gm;
    
    //passes three arguments to initgraph
    initgraph(&gd, &gm, "");
        
    circle(%d, %d, 10, rand());
    //I do not know the purpose of this
    getch();
    //or this
    closegraph();
    
}

int main() {
    //defines x and y as two random intengers
    int x = rand()
    int y = rand()
    //passes three arguments to initgraph
    initgraph(&gd, &gm, "");
        
    circle(x, y, 10);
    //I do not know the purpose of this
    getch();
    //or this
    closegraph();
    
    
    
    return 0
}

// Compile as "Kitty"

int levels;
color bg, fg;

void setup() {
  size(800, 600);
  levels = 0;
}

/*Create Pascal's Gasket (google an image of this)
 The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
 levels:
 0 = regular triangle
 1 = triforce (looks like 3 triangles)
 2 = each of the 3 triangles will be cut into 3 triangles.
 etc.
 */

void draw() { 
  background(50);  

  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels", 20, 20);
  
  triangle(0, height-10, width, height-10, width/2, 10);
  //fill(255);
  fill(255, 0, 0);
  gasket(levels, 0, height-10, width, height-10, width/2, 10);

  //koch(levels,width-10, height/2,10, height/3 ); 
  //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void gasket(int lvl, float x1, float y1, float x2, float y2, float x3, float y3) {
    if(lvl<1) {
      triangle(x1, y1, x2, y2, x3, y3);
    }
    else{
     gasket(lvl-1, (x1+x2)/2, (y1+y2)/2, x2, y2, (x2+x3)/2, (y2+y3)/2);
     gasket(lvl-1, x1, y1, (x1+x3)/2, (y1+y3)/2, (x2+x1)/2, (y2+y1)/2);
     gasket(lvl-1, (x2+x3)/2, (y2+y3)/2, (x1+x3)/2, (y1+y3)/2, x3, y3);
    }
    
  
  //triangle(x1, y1, x2, y2, x3, y3);
}

void mouseClicked() { 
  levels ++;
}

void keyPressed() {
  levels --;
}

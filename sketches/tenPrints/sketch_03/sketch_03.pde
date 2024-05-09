// Based on 10 Prints
// https://10print.org/
import processing.svg.*;
PGraphics p;
PShape print;

void setup() {
  size(600, 800);
  noLoop();
}

void draw() {
  p = createGraphics(600, 800, SVG, "print.svg");
  p.beginDraw();

  // Rules
  int size = 15;
  p.strokeCap(SQUARE); // ROUND, SQUARE, PROJECT
  p.strokeJoin(MITER); // MITER, BEVEL, ROUND

  // Create
  p.background(255);
  p.stroke(0);  
  for (int x=0; x<width; x+=size) {
    for (int y=0; y<height; y+=size) {
      int motivo = (int) random(0, 100) % 2;
      if ( motivo == 0 ) { 
        p.strokeWeight(1);
        p.line(x, y, x+size, y+size);
      } else { 
        p.strokeWeight(5);
        p.line(x+size, y, x, y+size);
      }
    }
  }
  p.dispose();
  p.endDraw();
  print = loadShape("print.svg");
  
  // Print
  shape(print, 0, 0);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("print-######.png");
  } else {
    redraw();
  }
}
// Based on 10 Prints
// https://10print.org/
import processing.svg.*;
PGraphics p;
PShape print;

void setup() {
  size(600, 800);
  noLoop();
  smooth();
}

void draw() {
  p = createGraphics(600, 800, SVG, "print.svg");
  p.beginDraw();

  // Rules
  int size = 15;
  p.strokeCap(SQUARE); // ROUND, SQUARE, PROJECT
  p.strokeJoin(MITER); // MITER, BEVEL, ROUND
  p.ellipseMode(CENTER);

  // Create
  p.background(255);
  for (int x=0; x<width; x+=size) {
    for (int y=0; y<height; y+=size) {
      int motivo = (int) random(0, 100) % 2;
      if ( motivo == 0 ) {
        p.noStroke();
        p.fill(0);
      } else { 
        p.noFill();
        p.stroke(0);
      }
      p.ellipse(x+size*0.5, y+size*0.5, size*0.8, size*0.8);
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
    saveFrame("print-"+random(0, 1000)+".png");
  } else {
    redraw();
  }
}
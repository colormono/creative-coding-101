// Based on 10 Prints
// https://10print.org/

void setup() {
  size(600, 800);
  noLoop();
}

void draw() {

  // Rules
  int size = 15;
  strokeWeight(3);
  strokeCap(SQUARE); // ROUND, SQUARE, PROJECT
  strokeJoin(MITER); // MITER, BEVEL, ROUND
  stroke(0);
  background(255);

  // Print grid
  for (int x=0; x<width; x+=size) {
    for (int y=0; y<height; y+=size) {
      int motivo = (int) random(0, 100) % 2;
      if ( motivo == 0 ) { 
        strokeWeight(1);
        line(x, y, x+size, y+size);
      } else { 
        strokeWeight(5);
        line(x+size, y, x, y+size);
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("print-######.png");
  } else {
    redraw();
  }
}
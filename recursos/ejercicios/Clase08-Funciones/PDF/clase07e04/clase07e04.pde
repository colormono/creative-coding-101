void setup() { 
  size(300, 300);
  pixelDensity(2);
  noStroke(); 
  smooth(); 
  noLoop();
}

void draw() { 
  for (int x=60; x<width; x+=60) {
    for (int y=60; y<height; y+=60) {
      eye(x, y);
    }
  }
}

void eye(int x, int y) {
  fill(255);
  ellipse(x, y, 60, 60);
  fill(0);
  ellipse(x+10, y, 30, 30);
  fill(255);
  ellipse(x+16, y-5, 6, 6);
}

void setup() { 
  size(600, 340); 
  pixelDensity(2);
  smooth(); 
  noLoop();
}

void draw() {
  // Dibujar 100 X random
  for (int i = 0; i < 100; i++) {
    drawX(int(random(255)), int(random(30)), 
      int(random(width)), int(random(height)), 100);
  }
}

void drawX(int gray, int weight, int x, int y, int size) {
  stroke(gray);
  strokeWeight(weight);
  line(x, y, x+size, y+size);
  line(x+size, y, x, y+size);
}

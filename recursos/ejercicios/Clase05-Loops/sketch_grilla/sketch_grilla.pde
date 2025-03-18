int celda = 50;

void setup() {
  size(500, 500);
}

void draw() {
  background(200);

  for (int x = 0; x < width; x = x + celda) {
    for (int y = 0; y < height; y = y + celda) {
      rect(x, y, celda, celda);
    }
  }
}

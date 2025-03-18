class Comida {
  float x, y;
  int size = 10;

  Comida() {
    x = random(width);
    y = random(height);
  }

  void display() {
    fill(0, 0, 200);
    ellipse(x, y, size, size);
  }
}

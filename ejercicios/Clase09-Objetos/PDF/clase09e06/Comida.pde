class Comida {
  float x, y;
  boolean live;
  int size = 10;
  color c;

  Comida() {
    x = random(width);
    y = random(height);
    live = true;
    c = color(random(255), random(255), random(255));
  }

  void display() {
    if (live) {
      fill(c);
      ellipse(x, y, size, size);
    }
  }
}

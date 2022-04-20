boolean dibujar = true;

void setup() {
  size(500, 500);
}

void draw() {
  if (dibujar) {
    background(#F0EEE3);

    float d = (width - 100) / 26;

    for (int c = 50; c <= (26 * d) + 50; c += d) {
      stroke(0, 100);
      point(c, 10);
      line(c, 20+random(-5, 5), c, height-20+random(-5, 5));
      point(c, height-10);
    }

    for (int r = 30; r < height-30; r += 3) {
      float e = random(2);       
      line(random(10, 40), r+e, width - random(10, 40), r+e);
    }

    dibujar = false;
  }
}

void mousePressed() {
  dibujar = true;
}

int vidas = 7;

void setup() {
  size(300, 300);
  noStroke();
}

void draw() {
  if (vidas > 0) {
    background(255);
  } else {
    background(0);
  }

  for (int v = 1; v <= vidas; v++) {
    fill(255, 0, 0);
    ellipse(v*20, 20, 18, 18);
  }
}

void mouseReleased() {
  vidas = vidas - 1;
}

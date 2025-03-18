void setup() {
  size(100, 100);
  noStroke();
  fill(0);
}

void draw() {
  background(204);
  if ((mouseX <= 50) && (mouseY <= 50)) {
    rect(0, 0, 50, 50); // Arriba-izquierda
  } else if ((mouseX <= 50) && (mouseY > 50)) {
    rect(0, 50, 50, 50); // Abajo-izquierda
  } else if ((mouseX > 50) && (mouseY <= 50)) {
    rect(50, 0, 50, 50); // Arriba-derecha
  } else {
    rect(50, 50, 50, 50); // Abajo-derecha
  }
}

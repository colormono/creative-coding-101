void setup() {
  size(100, 100);
  strokeWeight(4);
}

void draw() {
  background(204);
  // Si la tecla 'A' es presionada dibujar linea
  if ((keyPressed == true) && (key == 'A')) {
    line(50, 25, 50, 75);
  } else { // Si no, dibujar una elipse
    ellipse(50, 50, 50, 50);
  }
}

void setup() {
  size(100, 100);
  strokeWeight(4);
}

void draw() {
  background(204);
  if (keyPressed == true) { // Si la tecla esta presionada,
    line(20, 20, 80, 80); // dibujar una linea
  } else { // si no,
    rect(40, 40, 20, 20); // dibujar un rectangulo
  }
}

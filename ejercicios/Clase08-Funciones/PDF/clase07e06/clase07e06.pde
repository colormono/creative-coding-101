void setup() { 
  size(100, 100); 
  smooth(); 
  noLoop();
}

void draw() {
  drawX(0); // Pasar 0 a drawX()
}

void drawX(int gray) { // Declarar y asignar gray
  stroke(gray); // Usar el valor de gray para el color de linea
  strokeWeight(20);
  line(0, 5, 60, 65);
  line(60, 5, 0, 65);
}

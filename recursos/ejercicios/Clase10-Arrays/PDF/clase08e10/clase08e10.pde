int num = 50;
int[] x = new int[num];
int[] y = new int[num];

void setup() { 
  size(200, 200);
  noStroke();
  fill(255, 102);
}

void draw() {
  background(0);
  // Mover valores a la derecha
  for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  // Agregar valores nuevos al comienzo de la matriz
  x[0] = mouseX;
  y[0] = mouseY;
  // Dibujar los circulos
  for (int i = 0; i < num; i++) {
    ellipse(x[i], y[i], i/2.0, i/2.0);
  }
}

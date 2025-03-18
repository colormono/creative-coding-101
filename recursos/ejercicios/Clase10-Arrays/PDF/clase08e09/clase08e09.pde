int[] y;

void setup() {
  size(200, 200);
  y = new int[width];
}

void draw() {
  background(204); 
  // Leer la matriz desde el final hacia el 
  // principio para evitar sobreescribir datos
  for (int i = y.length-1; i > 0; i--) {
    y[i] = y[i-1];
  }
  // Agregar nuevos valores al inicio
  y[0] = mouseY;
  // Dibujar cada par de valores como una linea
  for (int i = 1; i < y.length; i++) {
    line(i, y[i], i-1, y[i-1]);
  }
}

size(300, 300);
int cols = width;
int rows = height;
int[][] myArray = new int[cols][rows]; // Declarar

// Inicializar
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    myArray[i][j] = int(random(255));
  }
}

// Dibujar
for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++) {
    stroke(myArray[i][j]);
    point(i, j);
  }
}

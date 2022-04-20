// Matriz 2D de Objetos
Cell[][] grid;

// Número de columnas y filas en la cuadrícula
int cols = 10;
int rows = 10;

void setup() {
  size(200, 200);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Inicializa cada objeto
      grid[i][j] = new Cell(i*20, j*20, 20, 20, i+j);
    }
  }
}

void draw() {
  background(0);
  // Las variables de contador i y j son también los números de columna y fila y
  // se utilizan como argumentos para el constructor para cada objeto en la cuadrícula.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

// Objeto Cell
class Cell {
  // Un objeto de celda sabe acerca de su ubicación en la cuadrícula
  // así como su tamaño con las variables x, y, w, h
  float x, y;   // x,y location
  float w, h;   // width and height
  float angle; // angle for oscillating brightness

  // Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 

  // Oscilación significa aumentar el ángulo
  void oscillate() {
    angle += 0.02;
  }

  void display() {
    stroke(255);
    // Color calculado usando onda sinusoidal
    fill(127+127*sin(angle));
    rect(x, y, w, h);
  }
}

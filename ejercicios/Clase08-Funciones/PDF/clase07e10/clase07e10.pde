void setup() { 
  size(100, 100); 
  smooth(); 
  noLoop();
}

void draw() {
  drawX(255);
  drawX(5.5);
  drawX(0, 2, 44, 48, 36);
}

// Dibuja una X con el valor de gris pasado por parametro
void drawX(int gray) {
  stroke(gray);
  strokeWeight(20);
  line(0, 5, 60, 65);
  line(60, 5, 0, 65);
}

// Dibuja una X negra con el grosor pasado por parametro
void drawX(float weight) {
  stroke(0);
  strokeWeight(weight);
  line(0, 5, 60, 65);
  line(60, 5, 0, 65);
}

// Dibuja una X con los valores de gris, grosor,
// posicion y tamanio pasador por parametro
void drawX(int gray, int weight, int x, int y, int s) {
  stroke(gray);
  strokeWeight(weight);
  line(x, y, x+s, y+s);
  line(x+s, y, x, y+s);
}

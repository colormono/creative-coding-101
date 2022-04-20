void setup() { 
  size(100, 100); 
  smooth(); 
  noLoop();
}

void draw() {
  drawX(160, 20, 0, 5, 60); // X gruesa en gris
  drawX(0, 10, 30, 20, 60); // X media en negro
  drawX(255, 2, 20, 38, 60); // X fina en blanco
}

void drawX(int gray, int weight, int x, int y, int size) {
  stroke(gray);
  strokeWeight(weight);
  line(x, y, x+size, y+size);
  line(x+size, y, x, y+size);
}

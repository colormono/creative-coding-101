void setup() { 
  size(100, 100); 
  smooth(); 
  noLoop();
}

void draw() {
  drawX(0, 30);
}

void drawX(int gray, int weight) {
  stroke(gray);
  strokeWeight(weight);
  line(0, 5, 60, 65);
  line(60, 5, 0, 65);
}

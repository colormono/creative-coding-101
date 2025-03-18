void setup() {
  size(150, 150);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX; // X inversa
  float iy = height - mouseY; // Y inversa
  background(126);
  fill(255, 150);
  ellipse(x, height/2, y, y);
  fill(0, 159);
  ellipse(ix, height/2, iy, iy);
}

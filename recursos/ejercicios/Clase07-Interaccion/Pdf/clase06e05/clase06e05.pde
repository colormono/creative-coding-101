void setup() {
  size(150, 150);
  strokeWeight(8);
}

void draw() {
  background(204);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void setup() {
  size(100, 100);
} 

void draw() {
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      fill(0); // Negro
    } else if (mouseButton == RIGHT) { 
      fill(255); // Blanco
    }
  } else {
    fill(126); // Gris
  }
  rect(25, 25, 50, 50);
}

// "Improvisación 26" de Kandinsky

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  noFill();
  strokeWeight(4);
  
  // Círculo central
  stroke(38, 22, 129);
  ellipse(width/2, height/2, 400, 400);
  
  // Figuras geométricas
  stroke(15, 170, 220);
  rect(200, 200, 200, 200);
  
  stroke(238, 122, 22);
  triangle(100, 100, 200, 300, 300, 100);
  
  stroke(249, 235, 45);
  arc(400, 400, 200, 200, radians(45), radians(135));
  
  stroke(128, 10, 60);
  line(0, height/2, width, height/2);
  
  stroke(57, 181, 74);
  line(width/2, 0, width/2, height);
}

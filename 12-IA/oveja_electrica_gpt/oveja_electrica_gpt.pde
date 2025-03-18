void setup() {
  size(400, 400);
}

void draw() {
  background(220);
  
  // Cuerpo
  rect(100, 150, 200, 100);
  rect(120, 100, 160, 50);
  
  // Cabeza
  rect(250, 135, 50, 50);
  ellipse(300, 160, 70, 70);
  
  // Ojos
  fill(255);
  ellipse(280, 150, 20, 20);
  ellipse(320, 150, 20, 20);
  fill(0);
  ellipse(280, 150, 10, 10);
  ellipse(320, 150, 10, 10);
  
  // Orejas
  rect(240, 135, 10, 30);
  rect(310, 135, 10, 30);
  
  // Piernas
  rect(120, 250, 50, 100);
  rect(230, 250, 50, 100);
  rect(170, 250, 50, 50);
  rect(190, 200, 10, 50);
  rect(210, 200, 10, 50);
  
  // Cola
  rect(70, 185, 50, 20);
}

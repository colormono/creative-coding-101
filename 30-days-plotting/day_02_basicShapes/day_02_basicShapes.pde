import processing.svg.*;

boolean record;

void setup() {
  size(500, 200); // tamaño del lienzo
  background(255); // color de base
  stroke(0); // color del trazo
  strokeWeight(2); // grosor del trazo
}

void draw() {
  if (record) {
    beginRecord(SVG, "output.svg");
  }

  // dibujar punto
  point(50, 100);

  // dibujar línea
  line(100, 100, 150, 100);

  // dibujar elipse
  ellipse(210, 100, 50, 50);

  // dibujar rectángulo
  rect(275, 75, 50, 50);

  // dibujar triángulo
  triangle(370, 125, 398, 75, 426, 125);

  if (record) {
    endRecord();
    record = false;
  }
}


void mousePressed() {
  record = true;
}

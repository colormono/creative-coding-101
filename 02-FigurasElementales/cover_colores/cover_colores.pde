String title = "figuras_cover";

int canvasWidth = 1920;
int canvasHeight = 1080;

void setup() {
  size(1920, 1080);
  generate();
}

void draw() {
  // Vacio porque vamos a redibujar bajo demanda
}

void generate() {
  color c1 = color(210); // gris
  color c2 = color(0, 0, 0); // negro
  color c3 = color(0, 0, 255); // azul
  color c4 = color(255, 0, 0); // rojo
  color c5 = color(255, 255, 0); // amarillo

  background(c1);
    
  pushMatrix();
  translate(width/2 - 250, height/2 - 100);

  stroke(c2); // color del trazo
  strokeWeight(2); // grosor del trazo

  // dibujar un punto
  point(50, 100);

  // dibujar una línea
  line(100, 100, 150, 100);
  
  noStroke(); // sin trazos

  // dibujar una elipse
  fill(c3); // color del relleno
  ellipse(210, 100, 50, 50);

  // dibujar un rectángulo
  fill(c4); // color del relleno
  rect(275, 75, 50, 50);

  // dibujar un triángulo
  fill(c5); // color del relleno
  triangle(370, 125, 398, 75, 426, 125);
  
  popMatrix();

  println("Generated");
}

void mousePressed() {
  generate();
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    // Guardar el dibujo
    String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    save(title + "_" + timestamp + ".png");
    println("Guardado como " + title + "_" + timestamp + ".png");
  } else {
    generate();
  }
}

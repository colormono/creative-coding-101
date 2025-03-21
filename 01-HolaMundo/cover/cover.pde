String title = "hello_cover";

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
  color c1 = color(0, 0, 255); // azul

  background(c1);
  
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

// Creamos variables para el color de la línea y su tamaño
color lineColor = color(0);
int lineSize = 5;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  strokeWeight(lineSize); // Establecemos el tamaño de la línea
  stroke(lineColor); // Establecemos el color de la línea
  if (mousePressed) { // Si el mouse está presionado, dibujamos una línea
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  drawColorPicker(); // Dibujamos el selector de color
}

void mouseClicked() {
  if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 70) {
    // Si el usuario hace clic en el botón de selección de color
    lineColor = color(random(255),random(255),random(255)); // Obtenemos el color de la selección
  }
}

void keyPressed() {
  if (key == '1') { // Si el usuario presiona la tecla 1
    lineSize = 5; // Establecemos el tamaño de la línea en 5
  } else if (key == '2') { // Si el usuario presiona la tecla 2
    lineSize = 10; // Establecemos el tamaño de la línea en 10
  } else if (key == '3') { // Si el usuario presiona la tecla 3
    lineSize = 20; // Establecemos el tamaño de la línea en 20
  }
}

void drawColorPicker() {
  // Dibujamos un botón de selección de color en la esquina superior izquierda
  noStroke();
  fill(255);
  rect(20, 20, 50, 50);
  fill(lineColor);
  rect(25, 25, 40, 40);
}

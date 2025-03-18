int frame = 0;

void setup() {
  size(100, 100);
}

void draw() {
   // Si pasaron 120 frames desde que se presiono el mouse
  if (frame > 120) {
    noLoop(); // detener el programa
    background(0); // y pintar fondo negro
  } else { // sino
    background(204); // pintar fondo gris y dibujar lineas
    line(mouseX, 0, mouseX, 100); // en la posicion del mouse
    line(0, mouseY, 100, mouseY);
    frame++;
  }
}

void mousePressed() {
  loop();
  frame = 0;
}

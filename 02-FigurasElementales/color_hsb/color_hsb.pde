void setup() {
  size(500, 500); // Tamaño cuadrado
  colorMode(HSB, 360, 100, 100, 100); // Escala HSB (360,100,100,100)

  background(0); // Fondo negro
}

void draw() {
  noCursor(); // Oculta el puntero del mouse

  // Mapear la posición del mouse a valores HSB
  float hue = 180;
  float sat = map(mouseY, 0, height, 0, 100); // de 50 a 100 según Y (puede variar)
  float bri = map(mouseX, 0, width, 0, 360); // de 0 a 360 según X
  float alp = 100;
  
  fill(hue, sat, bri, alp); // Relleno con HSB y opacidad
  noStroke();
  
  ellipse(mouseX, mouseY, 50, 50); // Dibuja la elipse siguiendo el mouse
}

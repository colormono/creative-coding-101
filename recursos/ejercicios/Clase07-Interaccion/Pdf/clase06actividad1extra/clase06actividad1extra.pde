float puntoX, puntoY;
int puntoSize = 10;

float rectX, rectY;
int rectSize = 30;
int rectSpeed = 2;

int vidas = 10;
int puntos = 0;

void setup() {
  size(600, 300);
  noStroke();
  pixelDensity(2);
  ellipseMode(CENTER);
  rectMode(CENTER);

  // posiciones iniciales
  rectX = width/2;
  rectY = height/2;
  puntoX = random(width);
  puntoY = random(height);
}

void draw() {
  background(230);

  // UI
  text("VIDAS: " + vidas, 10, 20);
  text("PUNTOS: " + puntos, 10, 40);

  // punto
  fill(0, 0, 200);
  ellipse(puntoX, puntoY, puntoSize, puntoSize);

  // cuadrado
  fill(200, 0, 0);
  rect(rectX, rectY, rectSize, rectSize);

  // moverse
  if (keyPressed) {
    if (keyCode == UP) rectY -= rectSpeed;
    if (keyCode == DOWN) rectY += rectSpeed;
    if (keyCode == LEFT) rectX -= rectSpeed;
    if (keyCode == RIGHT) rectX += rectSpeed;
  }

  // comer
  // otra manera de calcular la distancia
  // si, processing maneja pitagoras
  if ( dist(rectX, rectY, puntoX, puntoY) < puntoSize) {
    // incrementar puntos
    puntos = puntos + 1;

    // mover punto
    puntoX = random(width);
    puntoY = random(height);
  }
}

boolean _up = false;
boolean _down = false;
boolean _left = false;
boolean _right = false;

float puntoX, puntoY;
int puntoSize = 10;

float rectX, rectY;
int rectSize = 30;
int rectSpeed = 2;

void setup() {
  size(600, 300);
  noStroke();
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

  // punto
  fill(0, 0, 200);
  ellipse(puntoX, puntoY, puntoSize, puntoSize);

  // cuadrado
  fill(200, 0, 0);
  rect(rectX, rectY, rectSize, rectSize);

  // moverse
  moverPersonaje();

  // comer
  // otra manera de calcular la distancia
  // si, processing maneja pitagoras
  if ( dist(rectX, rectY, puntoX, puntoY) < puntoSize) {
    puntoX = random(width);
    puntoY = random(height);
  }
}

void keyPressed() {
  if (keyCode == UP) _up = true;
  if (keyCode == DOWN) _down = true;
  if (keyCode == LEFT) _left = true;
  if (keyCode == RIGHT) _right = true;
}

void keyReleased() {
  if (keyCode == UP) _up = false;
  if (keyCode == DOWN) _down = false;
  if (keyCode == LEFT) _left = false;
  if (keyCode == RIGHT) _right = false;
}

void moverPersonaje() {
  if (_up) rectY -= rectSpeed;
  if (_down) rectY += rectSpeed;
  if (_left) rectX -= rectSpeed;
  if (_right) rectX += rectSpeed;
}

void comer(){
}

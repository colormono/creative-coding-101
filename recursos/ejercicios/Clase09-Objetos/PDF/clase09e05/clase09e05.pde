int vidas = 10;
int puntos = 0;

Hero hero;
Comida punto;

void setup() {
  size(600, 300);
  noStroke();
  pixelDensity(2);
  ellipseMode(CENTER);
  rectMode(CENTER);

  // Instanciar objetos
  hero = new Hero(width/2, height/2);  
  punto = new Comida();
}

void draw() {
  background(230);

  // UI
  text("VIDAS: " + vidas, 10, 20);
  text("PUNTOS: " + puntos, 10, 40);

  // Comida
  punto.display();

  // Hero
  hero.display();
  hero.move();

  // si hero esta tocando el punto
  if ( hero.isTouching(punto.x, punto.y) ) {
    // incrementar puntos
    puntos = puntos + 1;

    // cambiar punto de lugar
    punto.x = random(width);
    punto.y = random(height);
  }
}

Hero hero;
int canidadDeComida = 100;
ArrayList<Comida> puntos = new ArrayList<Comida>();

int vidas = 10;
int puntaje = 0;

void setup() {
  size(600, 300);
  noStroke();
  pixelDensity(2);
  ellipseMode(CENTER);
  rectMode(CENTER);

  // Instanciar objetos
  hero = new Hero(width/2, height/2);  
  for (int i = 0; i<canidadDeComida; i++) {
    puntos.add( new Comida() );
  }
}

void draw() {
  background(230);

  // UI
  text("VIDAS: " + vidas, 10, 20);
  text("PUNTAJE: " + puntaje, 10, 40);

  // Hero
  hero.display();
  hero.move();

  // Comida
  // para cada objeto dentro del array de comidas
  for (int i = 0; i<canidadDeComida; i++) {
    // tomamos el elemento de la lista
    // y lo guardamos en la variable temporal "punto"
    Comida punto = puntos.get(i);
    punto.display();

    // si hero esta tocando el punto
    if ( hero.isTouching(punto.x, punto.y) && punto.live ) {
      // incrementar puntos
      puntaje = puntaje + 1;
  
      // matar punto
      punto.live = false;
    }
  }
}

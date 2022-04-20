int celda = 32;
PImage img;

boolean dibujar = true;

void setup() {
  size(500, 500);

  img = loadImage("hero.png");
  
  noSmooth(); // para que se mantenga el pixelado
}

void draw() {
  if (dibujar) {
    background(0);

    for (int x = 0; x < width; x = x + celda) {
      for (int y = 0; y < height; y = y + celda) {

        if ( random(100) < 10 ) {
          image(img, x, y, celda, celda);
        }
      }
    }
    
    dibujar = false;
  }
}

void mousePressed(){
  dibujar = true;
}

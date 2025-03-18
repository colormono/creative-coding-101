boolean debug = true;

int celda = 32;
PImage dulce;
int dulceX;
int dulceY;

PImage hero;
int heroX = 0;
int heroY = 0;

boolean dibujar = true;

void setup() {
  size(512, 512);

  dulce = loadImage("hero.png");
  dulceX = celda*10;
  dulceY = celda*7;

  hero = loadImage("tini.png");

  noSmooth(); // para que se mantenga el pixelado
}

void draw() {
  //  if (dibujar) {
  background(0);

  // Grilla
  for (int x = 0; x < width; x = x + celda) {
    for (int y = 0; y < height; y = y + celda) {
      if (debug) {
        fill(0);
        stroke(150);
        rect(x, y, celda, celda);
      }

      /*
        if ( random(100) < 10 ) {
       image(dulce, x, y, celda, celda);
       }
       */
    }
  }

  image(hero, heroX, heroY, celda, celda);

  image(dulce, dulceX, dulceY, celda, celda);
  
  float dPremio = dist(heroX, heroY, dulceX, dulceY);
  println(dPremio);
  
  if(dPremio < celda){
    dulceX = celda * floor(random(0, width/celda));
    dulceY = celda * floor(random(0, height/celda));
  }

  //dibujar = false;
  //}
}

void mousePressed() {
  dibujar = true;
}

void keyReleased() {
  if (key == 'd' || key == 'D') debug = !debug;
  
  if(keyCode == LEFT) heroX -= celda;
  if(keyCode == RIGHT) heroX += celda;
  if(keyCode == UP) heroY -= celda;
  if(keyCode == DOWN) heroY += celda;
}

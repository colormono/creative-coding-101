int vidas = 5;
int x = 100;

void setup() {
  size(400, 400);
}

void draw() {
  background(100);
  
  text(vidas, 20, 20);
  
  rect(x, 100, 10, 10);
  
  if(x > width){
    quitarVida();
  }
}

int quitarVida() {
  vidas = vidas - 1;
  reiniciarX();
  return vidas;
}

float reiniciarX() {
  x = (int) random(width);
  return x;
}

PVector randomPosition(){
  PVector p = new PVector(random(width), random(height));
  return p;
}


void keyPressed(){
  x += 10;
}

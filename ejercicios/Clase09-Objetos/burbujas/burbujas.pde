Burbuja b;

void setup(){
  size(800, 600);
  
  b = new Burbuja();
}

void draw(){
  background(0);
  
  b.dibujar();
  b.mover();
}

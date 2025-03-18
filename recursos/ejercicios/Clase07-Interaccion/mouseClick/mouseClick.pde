int x;
int y;

void setup(){
  size(500, 500);
}

void draw(){
}

void mousePressed(){
  println("Hola");
  x = mouseX;
  y = mouseY;
}

void mouseReleased(){
  println("Chau");
  
  line(x, y, mouseX, mouseY);
}

int celda = 10;
boolean crear = true;

void setup() {
  size(600, 600);
}

void draw() {  
  // si hay que crear...
  if (crear) {
    background(255);
    stroke(0);

    for (int y=0; y<height; y=y+celda) {
      for (int x=0; x<width; x=x+celda) {

        if (random(100) < 50) {
          line(x, y, x+celda, y+celda);
        } else {
          line(x+celda, y, x, y+celda);
        }
      }
    }
    
    // exportar la imagen
    saveFrame("miObra-"+random(100)+".jpg"); 
    
    // terminar de crear
    crear = false;
  }
}

// al presionar el mouse
// activar otra creacion
void mousePressed(){
  crear = true;
}

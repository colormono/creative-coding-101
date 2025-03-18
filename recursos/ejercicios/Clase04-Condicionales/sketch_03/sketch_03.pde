int puntos;
String estado = "MENU";
int tiempo = 0;

void setup() {
  size(400, 400);
  
  frameRate(30);

  textSize(24);
  textAlign(CENTER);
}

void draw() {

  // para cada estado en particular
  if ( estado.equals("MENU") ) {
    background(30);
  } else if ( estado.equals("JUEGO") ) {
    background(0, 0, 255);
    
    // incrementar contador de tiempo
    tiempo += 1;
    
    // evaluar el tiempo
    if(tiempo > 120){
      if(puntos > 10){
        estado = "GANASTE";
      } else {
        estado = "PERDISTE";
      }
    }
  } else if ( estado.equals("GANASTE") ) {
    background(0, 255, 0);
  } else if ( estado.equals("PERDISTE") ) {
    background(255, 0, 0);
  }

  // para todos
  text("PUNTOS: " + puntos, 200, 100);
  text("ESTADO: " + estado, 200, 300);
}

void mousePressed() {
  if ( estado.equals("MENU") ) {
    estado = "JUEGO";
  }

  if ( estado.equals("GANASTE") || estado.equals("PERDISTE") ) {
    puntos = 0;
    tiempo = 0;
    estado = "MENU";
  }

  if ( estado.equals("JUEGO") ) {
    puntos += 1; // puntos = puntos + 1
  }
}

int botonX = 200;
int botonY = 200;
int botonR = 25;

int boton2X = 400;
int boton2Y = 400;
int boton2R = 50;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  // Boton 1
  if ( mouseDentro(botonX, botonY, botonR) ) {
    fill(255, 0, 0);
    cursor(HAND);
  } else {
    fill(255);
    cursor(ARROW);
  }
  ellipse(botonX, botonY, botonR*2, botonR*2);


 // Boton 2
  if ( mouseDentro(boton2X, boton2Y, boton2R) ) {
    fill(255, 0, 0);
    cursor(HAND);
  } else {
    fill(255);
    cursor(ARROW);
  }
  ellipse(boton2X, boton2Y, boton2R*2, boton2R*2);
}

void mouseReleased() {
  if (mouseDentro(botonX, botonY, botonR)) {
    println("CLICK BOTON 1");
  }

  if (mouseDentro(boton2X, boton2Y, boton2R)) {
    println("CLICK BOTON 2");
  }
}

boolean mouseDentro(int x, int y, int r) {
  float d = dist(x, y, mouseX, mouseY);
  if (d < r) {
    return true;
  }  
  return false;
}

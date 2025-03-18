void setup() {
  size(480, 270);
}

void draw() {
  background(0);

  // Siempre comenzar con i en 0
  int i = 0;

  // Mientras i es menor al ancho de la ventana
  while (i < width) {
    noStroke();
    // La distancia entre el rectangulo actual 
    // y el mouse es igual al valor absoluto 
    // de la diferencia entre i y mouseX.
    float distance = abs(mouseX - i); 
    
    // Esa diferencia es usada para el relleno 
    // de un rectangulo en la posicion horizontal i.
    fill(distance);
    rect(i, 0, 10, height);
    
    // Incrementar i en 10
    i += 10;
  }
}

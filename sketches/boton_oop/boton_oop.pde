Boton miBoton, miBoton2;

void setup() {
  size(400, 400);
  miBoton = new Boton(50, 50, 100, 50, color(255), color(200), color(150), "Boton 1");
  miBoton2 = new Boton(200, 50, 100, 50, color(255), color(200), color(150), "Boton 2");
}

void draw() {
  background(255);
  miBoton.pintar();
  miBoton2.pintar();
  
  if (miBoton.ratonClic()) {
    println("Haz hecho clic en el botón");
  }
}

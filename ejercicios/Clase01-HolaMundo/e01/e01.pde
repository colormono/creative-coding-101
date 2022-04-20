/*
 Hola Mundo!
 por Mariano Rivas
 */

void setup() {
  size(600, 600); // tamanio del lienzo  
  background(255); // fondo blanco
}

// para cada frame
void draw() {
  // si el mouse esta presionado
  if (mousePressed) {
    // dibujar una ellipse en la posicion del mouse
    // no dibujar la linea de contorno
    noStroke();
    // usar un color de relleno R,G,B aleatorio
    fill(random(255), random(255), random(255));
    ellipse(mouseX, mouseY, 10, 10);
  }
}

// si llegaste hasta acá:

// 1) podes leer mas sobre la funcion fill en
// https://processing.org/reference/fill_.html

// 2) podes probar de cambiar los valores de fill() con alguno de estos
// fill(random(255), 0, 0);
// fill(0, random(255), 0);
// fill(0, 0, random(255));
// fill(random(255));

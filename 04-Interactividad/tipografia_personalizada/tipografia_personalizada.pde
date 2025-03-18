PFont miTipografia; // Variable para almacenar la tipografía

void setup() {
  size(400, 200);
  
  // Carga tu archivo de fuente (.ttf o .otf) en la carpeta del proyecto
  miTipografia = createFont("AcademyEngravedLetPlain", 48); // Reemplaza "AcademyEngravedLetPlain" con el nombre de tu archivo de fuente y ajusta el tamaño
}

void draw() {
  background(255);
  
  textFont(miTipografia); // Establece la tipografía para el texto
  textSize(48); // Tamaño del texto
  fill(0); // Color del texto
  
  String miTexto = "Hola Mundo"; // Texto a imprimir
  float x = width / 2 - textWidth(miTexto) / 2; // Posición x centrada
  float y = height / 2; // Posición y centrada
  
  text(miTexto, x, y); // Imprime el texto en la pantalla
}

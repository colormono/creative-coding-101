color[] paleta = {
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255)
}; // lista de colores
int indiceAleatorio = int(random(paleta.length)); // seleccionar un índice aleatorio
color c = paleta[indiceAleatorio]; // obtener el color correspondiente al índice aleatorio

background(c);

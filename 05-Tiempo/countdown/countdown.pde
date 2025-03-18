int tiempoInicial = 5 * 60;  // Tiempo inicial en segundos (5 minutos)
int tiempoRestante = tiempoInicial;  // Inicializar el tiempo restante

void setup() {
  size(400, 400);
  textSize(64);  // Tamaño del texto
  textAlign(CENTER, CENTER);  // Alineación del texto al centro
}

void draw() {
  background(0);  // Fondo blanco
  
  // Calcula los minutos y segundos restantes
  int minutos = tiempoRestante / 60;
  int segundos = tiempoRestante % 60;
  
  // Dibuja el tiempo restante en el centro
  text(nf(minutos, 2) + ":" + nf(segundos, 2), width/2, height/2);
  
  // Actualiza el tiempo restante
  if (frameCount % 60 == 0 && tiempoRestante > 0) {
    tiempoRestante--;
  }
}

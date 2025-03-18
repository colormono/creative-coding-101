Anillo[] anillos; // Declarar matriz
int numRings = 50;
int currentRing = 0; 

void setup() {
  size(200, 200);
  anillos = new Anillo[numRings]; // Crear matriz
  for (int i = 0; i < anillos.length; i++) {
    anillos[i] = new Anillo(); // Crear cada objeto
  }
}
void draw() {
  background(0);
  for (int i = 0; i < anillos.length; i++) {
    anillos[i].grow();
    anillos[i].display();
  }
}

// Click para crear un Ring nuevo
void mousePressed() {
  anillos[currentRing].start(mouseX, mouseY);
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
}

class Anillo {
  float x, y;          // Coordenadas x e y
  float diameter;      // Diametro del anillo
  boolean on = false;  // Enciende y apaga el dibujo

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos; 

    diameter = 1;
    on = true;
  }

  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > 400) {
        on = false;
        diameter = 1;
      }
    }
  }

  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(204, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}

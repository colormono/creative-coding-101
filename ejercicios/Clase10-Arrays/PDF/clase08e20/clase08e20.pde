int cantidadPelotitas = 100;

PVector[] pelotitas;
int colores[] = {#f2f4f6, #1ee3cf, #6b48ff, #0d3f67};

void setup() {
  size(600, 400);
  pelotitas = new PVector[cantidadPelotitas];

  for (int i = 0; i < cantidadPelotitas; i++) {
    float posicionX = random(0, width);
    float posicionY = random(0, height);
    pelotitas[i] = new PVector(posicionX, posicionY);
  }
}

void draw() {
  background(0);
  fill(255);
  noStroke();

  for (int i = 0; i < cantidadPelotitas; i++) {
    fill(rcol());
    ellipse(pelotitas[i].x, pelotitas[i].y, 10, 10);
  }
}

int rcol() {
  return colores[int(random(colores.length))];
};

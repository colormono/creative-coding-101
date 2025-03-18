int botonX = 20;
int botonY = 400;
int botonW = 460;
int botonH = 80;
String botonTXT = "Click para continuar";

void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  if (
    mouseX > botonX && mouseX < botonX+botonW &&
    mouseY > botonY && mouseY < botonY+botonH
    ) {
    fill(0);
    cursor(HAND);
  } else {
    fill(0, 0, 255);
    cursor(ARROW);
  }
  rect(botonX, botonY, botonW, botonH);
  fill(255);
  textAlign(CENTER, CENTER);
  text(botonTXT, botonX, botonY, botonW, botonH);
}

void mouseReleased() {
  if (
    mouseX > botonX && mouseX < botonX+botonW &&
    mouseY > botonY && mouseY < botonY+botonH
    ) {
    println("CLICK");
  }
}

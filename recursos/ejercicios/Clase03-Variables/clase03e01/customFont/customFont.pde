PFont miFuente;
String saludo = "Hola, Strings!";

void setup() {
  size(300, 300);
  miFuente = loadFont("data/pixelmix-20.vlw");
}

void draw() {
  background(255);
  fill(0, 0, 200);
  textAlign(CENTER);
  textFont(miFuente, 20);
  text(saludo, width/2, height/2);
}

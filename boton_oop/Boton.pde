class Boton {
  color colorNormal, colorSobre, colorClic;
  int ancho, alto, posX, posY;
  String etiqueta;
  
  Boton(int posX, int posY, int ancho, int alto, color colorNormal, color colorSobre, color colorClic, String etiqueta) {
    this.posX = posX;
    this.posY = posY;
    this.ancho = ancho;
    this.alto = alto;
    this.colorNormal = colorNormal;
    this.colorSobre = colorSobre;
    this.colorClic = colorClic;
    this.etiqueta = etiqueta;
  }
  
  void pintar() {
    if (ratonSobre()) {
      fill(colorSobre);
    } else {
      fill(colorNormal);
    }
    stroke(0);
    rect(posX, posY, ancho, alto);
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(etiqueta, posX + (ancho/2), posY + (alto/2));
  }
  
  boolean ratonSobre() {
    if (mouseX > posX && mouseX < posX+ancho && mouseY > posY && mouseY < posY+alto) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean ratonClic() {
    if (ratonSobre() && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean ratonSuelto() {
    if (ratonSobre() && mousePressed == false) {
      return true;
    } else {
      return false;
    }
  }
}

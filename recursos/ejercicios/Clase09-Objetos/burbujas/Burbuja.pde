class Burbuja {
  float x, y;
  float d;

  Burbuja() {
    x = random(width);
    y = random(height);
    d = random(5, 100);
  }

  void dibujar() {
    noStroke();
    fill(43, 186, 250, 100);
    ellipse(x, y, d, d);
  }
  
  void mover(){
    x += random(-2, 2);
    y -= random(0, 2);
    
    if(y < 0){
       y = height - d * 2;
       x = random(width);
    }
  }
}

class Burbuja {
  float x, y;
  float d;
  color c;

  Burbuja() {
    x = random(width);
    y = random(height);
    d = random(5, 100);
    c = color(random(255), random(255), random(255), random(50,150));
  }

  void dibujar() {
    noStroke();
    fill(c);
    ellipse(x, y, d, d);
  }
  
  void mover(){
    x += random(-2, 2);
    y -= random(0, 2);
    
    if(y < 0){
       y = height + d * 2;
       x = random(width);
    }
  }
}

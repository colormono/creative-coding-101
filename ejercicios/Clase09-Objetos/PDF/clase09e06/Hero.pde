class Hero {
  float x, y;
  int size;
  int speed;

  Hero(float _x, float _y) {
    // valores iniciales tomados de los argumentos
    x = _x;
    y = _y;

    // valores iniciales definidos manualmente
    size = 30;
    speed = 2;
  }

  // dibujar
  void display() {
    fill(200, 0, 0);
    rect(x, y, size, size);
  }

  // calculamos si esta tocando "otra cosa"
  // basandonos en la distancia entre Hero
  // y una posicion x,y pasada como argumento
  boolean isTouching(float _x, float _y) {
    if ( dist(x, y, _x, _y) < size * 0.9) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    if (keyPressed) {
      if (keyCode == UP) y -= speed;
      if (keyCode == DOWN) y += speed;
      if (keyCode == LEFT) x -= speed;
      if (keyCode == RIGHT) x += speed;
      
      // toroide
      if(y < 0) y = height;
      if(y > height) y = 0;
      if(x < 0) x = width;
      if(x > width) x = 0;
    }
  }
}

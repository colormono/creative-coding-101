Car myCar;

void setup() {    
  size(200, 200);
  myCar = new Car();
}    

void draw() {    
  background(255);   
  myCar.drive();   
  myCar.display();
}

class Car {
  color c = color(0);
  float x = 0;
  float y = 100;
  float speed = 1;

  void drive() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }

  void display() {
    fill(c);
    rect(x, y, 30, 10);
  }
}

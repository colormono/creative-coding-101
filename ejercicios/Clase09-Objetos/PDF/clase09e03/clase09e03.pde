// Ejemplo con dos objetos
Car myCar1;
Car myCar2;

void setup() {    
  size(200, 200);

  // Argumentos del constructor
  myCar1 = new Car(color(255, 0, 0), 0, 100, 2); 
  myCar2 = new Car(color(0, 0, 255), 0, 10, 1);
}    

void draw() {    
  background(255);   
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
}

class Car {
  color c;
  float x;
  float y;
  float speed;

  Car (color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    x = tempXpos;
    y = tempYpos;
    speed = tempXspeed;
  }

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

int x = 250;
int y = 250;
int paso = 10;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  fill(255);
}

void draw() {
  //background(0);
  fill(0, 5);
  rect(0, 0, width, height);
  
  // dibujo
  fill(random(30, 255));
  ellipse(x, y, 10, 10);

  // elegimos hacia donde camina
  int choice = int( random(4) );
  switch(choice) {
  case 0:
    x = x + paso;
    break;
  case 1:
    x = x - paso;
    break;
  case 2:
    y = y + paso;
    break;
  case 3:
    y = y - paso;
    break;
  }
  
  // toroide
  if( x > width) x = 0;
  if( x < 0 ) x = width;
  if( y < 0 ) y = height;
  if( y > height ) y = 0;
}

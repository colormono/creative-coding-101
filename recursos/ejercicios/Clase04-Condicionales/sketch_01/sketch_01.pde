
int x = 250;

void setup() {
  size(500, 500);
}

void draw() {
  if (x > width/2 ) {
    background(0, 0, 255);
  } else {
    background(30);
  }

  noStroke();
  fill(255);

  ellipse(x, 250, 10, 10);

  x = x + 2;

  if (x > width) {
    x = 0;
  }
}

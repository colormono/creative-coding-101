float speed = 30;
int diameter = 60;
float x;
float y;

void setup() {
  size (700,700);
x = width/2;
y = height/2;

}

void draw() {
  x += random(-speed, speed);;
  y += random(-speed, speed);
  ellipse(x, y, diameter, diameter);

   noStroke();
    float r = random(20, 200);
  float g = random(20, 200);

  fill(r, g, 150);
  float d = random(20);
  ellipse(random(width), random(height), d, d);
  if( x > width) x = 0;
  if( x < 0 ) x = width;
   if( y < 0 ) y = height;
   if( y >  height ) y = 0;

}

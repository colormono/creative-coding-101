void setup(){
  size(150,100);
  noStroke();
}

void draw(){
  background(126);
  ellipse(mouseX, 16, 33, 33);
  ellipse(mouseX/2, 50, 33, 33);
  ellipse(mouseX*2, 84, 33, 33);
}

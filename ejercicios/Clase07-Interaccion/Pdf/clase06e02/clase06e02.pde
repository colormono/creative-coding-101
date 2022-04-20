void setup(){
  size(150,100);
  noStroke();
}

void draw(){
  background(126);
  ellipse(mouseX, 16, 33, 33);
  ellipse(mouseX+20, 50, 33, 33);
  ellipse(mouseX-20, 84, 33, 33);
}

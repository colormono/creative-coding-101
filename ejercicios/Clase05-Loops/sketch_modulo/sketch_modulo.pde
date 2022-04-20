void setup(){
  size(500, 500);
  background(150);
}

void draw(){
  noStroke();
  
  if( millis()/1000 % 10 == 0 ){
      background(150);
  } 
  
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 10, 10);
}

void setup(){
  size(500, 500);
}

void draw(){
  noStroke();
  fill(255, 10);
  rect(0,0, width, height);
  
  
  if(mousePressed){
    stroke(0);    
  }
  line(pmouseX, pmouseY, mouseX, mouseY);
}

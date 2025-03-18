
int x = 200;
int y = 200;

void setup() {
  size(400, 400);
}

void draw() {
  if(mouseX < 200 && mouseY < 200){
    background(30);
    x = 100;
    y = 100;
  }
  
  if(mouseX < 200 && mouseY > 200){
    background(0,0,255);
    x = 100;
    y = 300;
  }
  
  if(mouseX > 200 && mouseY < 200){
    background(0,255,0);
    x = 300;
    y = 100;
  }
  
  if(mouseX > 200 && mouseY > 200){
    background(255,0,0);
    x = 300;
    y = 300;
  }
  
  ellipse(x, y, 10, 10);
}

boolean _up = false;  
boolean _down = false;  
boolean _left = false;  
boolean _right = false;  

Player player;

void setup() {  
  size(640, 480);  
  player = new Player(width/2, height/2, 5, 5);
}

void draw() {  
  background(0);  

  updatePositions();  
  player.show();
}

void keyPressed() {  
  if (key == 'w') _up = true;
  if (key == 's') _down = true;
  if (key == 'a') _left = true;
  if (key == 'd') _right = true;
}     

void keyReleased() {  
  if (key == 'w') _up = false;
  if (key == 's') _down = false;
  if (key == 'a') _left = false;
  if (key == 'd') _right = false;
}

void updatePositions() {  
  if (_up) player.move(0, -player.speed);
  if (_down) player.move(0, player.speed);
  if (_left) player.move(-player.speed, 0);
  if (_right) player.move(player.speed, 0);
}

class Player {  
  float xpos;  
  float ypos;  
  float radius;  
  float speed;  

  Player(float x, float y, float r, float s) {  
    xpos = x;  
    ypos = y;  
    radius = r;  
    speed = s;
  }  

  void show() {  
    ellipse(xpos, ypos, radius*2, radius*2);
  }  

  void move(float dx, float dy) {  
    xpos = xpos + dx;  
    ypos = ypos + dy;
  }
}  

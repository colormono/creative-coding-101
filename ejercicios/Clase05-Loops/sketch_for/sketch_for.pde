void setup(){
  size(500, 500);
}

void draw(){
  background(200);
  
  for(int y = 10; y < 100; y = y + 10){
    line(10, y, 490, y);
  }
  
  // continua con el resto del programa
}

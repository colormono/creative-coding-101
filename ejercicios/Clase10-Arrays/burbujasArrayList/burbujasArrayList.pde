ArrayList<Burbuja> burbujas;

void setup(){
  size(800, 600);
  
  burbujas = new ArrayList<Burbuja>();
  for(int i=0; i < 20; i++){
    Burbuja b = new Burbuja();
    burbujas.add(b);
  }
}

void draw(){
  background(0);
  
  for(int i =0; i < burbujas.size(); i++){
    Burbuja b = burbujas.get(i);
    
    b.dibujar();
    b.mover();
  }
}

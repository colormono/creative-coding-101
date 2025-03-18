// Random walker
float x;
float y;
int step = 3;
void setup() {
size(1000, 800);
pixelDensity(2);
background(#E8AF10);//fondo amarillo
x = width/2; // posicion x inicial
y = height/2; // posicion y inicial
}
void draw() {
 
ellipseMode(RADIUS); 
fill(#9719BF);  // violeta
ellipse(x, y, 40, 40);

ellipseMode(CORNER);
fill(255);  // blanco
ellipse(y/0.5,x/2,30, 30);

fill(#1678DE); //azul
ellipse(y/0.7,x/1.5,40,40);

fill(#DE1631); //rojo
ellipse(x/1.5,y/0.7,50,50);

// actualizar posicion
int choice = int( random(4) );
if (choice == 0) {
x = x + step;
} else if (choice == 1) {
x = x - step;
} else if (choice == 2) {
y = y -step;
} else {
y = y + step;
}
}

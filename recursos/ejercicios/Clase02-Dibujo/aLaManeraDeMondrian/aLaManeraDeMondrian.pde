size(400, 400);
background(240);
noStroke();

// rojos
fill(232, 66, 66);
rect(50, 50, 200, 200);
rect(375, 300, 25, 100);

// amarillos
fill(#F2DB2C);
rect(250, 0, 125, 150);
rect(0, 300, 50, 100);

// azules
fill(#1323AA);
rect(250, 300, 125, 75);

// negro
fill(40);
rect(50, 250, 100, 100);
rect(150, 350, 100, 25);

// estilos de lineas
stroke(0);
strokeWeight(8);
strokeCap(SQUARE);

// lineas horizontales
line(10, 50, 375, 50);
line(14, 150, 50, 150);
line(250, 150, 375, 150);
line(50, 250, 375, 250);
line(10, 300, 400, 300);
line(50, 350, 250, 350);
line(150, 375, 375, 375);

// lineas verticales
line(50, 50, 50, 385);
line(100, 250, 100, 350);
line(150, 250, 150, 390);
line(250, 10, 250, 375);
line(312.5, 150, 312.5, 250);
line(375, 10, 375, 390);

// exportar imagen
saveFrame("render.png");

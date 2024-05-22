// Wall Drawing 118
size(700,700);
background(255);
strokeWeight(0.1);
stroke(0,100);

// Fifty randomly placed points
float[][] points = new float[50][2];
for(int x=0; x<points.length; x++){
  for(int y=0; y<2; y++){
    points[x][y] = random(width);
  }
}

// Connected by straight lines
for(int i=0; i<points.length; i++){
  for(int j=0; j<points.length; j++){
    line(points[i][0], points[i][1], points[j][0], points[j][1]);
  }
}

// Sol LeWitt
// 1971
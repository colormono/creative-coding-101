ArrayList<PVector> points = new ArrayList<PVector>();

int rows = 20;
int cols = 25;
int distance = 20;

void setup() {
  size(500, 500);
  noLoop();

  for (int x=0; x < rows; x++) {
    for (int y=0; y < cols; y++) {
      float px = x * distance + random(15);
      float py = y * distance + random(10);
      points.add(new PVector(px, py));
    }
  }

  int total = points.size();
  println("The total number of points is: " + total);
}

void draw() {
  for (int i = 0; i < points.size(); i++) {
    if (i-1 > 0) {
      PVector pa = points.get(i-1);
      PVector p = points.get(i);
      line(pa.x, pa.y, p.x, p.y);
    }
  }
}

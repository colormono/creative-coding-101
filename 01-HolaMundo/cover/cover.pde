String title = "hello_cover";

int canvasWidth = 1920;
int canvasHeight = 1080;

void setup() {
  size(1920, 1080);
  generate();
}

void draw() {
  // This is now empty since we'll redraw on demand
}

void generate() {
  //color c1 = color(0, 100);
  color c2 = color(0, 0, 255);

  background(c2);
  
  println("Generated");
}

void mousePressed() {
  generate();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    // Generate with the same click position
    generate();
  } else if (key == 's' || key == 'S') {
    // Save the current artwork
    String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "_" + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    save(title + "_" + timestamp + ".png");
    println("Saved as " + title + "_" + timestamp + ".png");
  } else if (key == 'c' || key == 'C') {
    generate();
  }
}

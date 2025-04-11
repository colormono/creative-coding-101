String title = "valt_banner_image";

int canvasWidth = 1128;
int canvasHeight = 190;

color[] colors = {
  // valt
  //#f1f8fe, #e1effd, #bcdffb, #81c6f8, #3faaf1, #1486d2, #0972c0, #085a9c, #0b4d81, #0f416b, #0a2a47

  // assuredam
  #f2f5fc, #e3e8f6, #cdd8f0, #aabde6, #819bd9, #5973ca, #5062c0, #4651af, #3d4590, #353c73, #242747
};

float pixelW;
float pixelH;

float lastClickX = -1;
float lastClickY = -1;
boolean hasClicked = false;
boolean drawClick = false;

void setup() {
  size(1128, 191);
  lastClickX = width / 2;
  lastClickY = height / 2;
  hasClicked = true;
  background(0);
  generate();
}

void draw() {
  // This is now empty since we'll redraw on demand
}

void generate() {
  pixelW = width/8;
  pixelH = height/10;

  background(getColorByIndex(9));

  float maxDistance = dist(0, 0, canvasHeight, canvasHeight); // Maximum possible distance in canvas

  for (float x = 0; x < canvasWidth; x += pixelW) {
    for (float y = 0; y < canvasHeight - pixelH; y += pixelH) {
      // Calculate distance from cell center to last click
      float cellCenterX = x + pixelW / 2;
      float cellCenterY = y + pixelH / 2;
      float distance = dist(cellCenterX, cellCenterY, lastClickX, lastClickY);

      // Normalize distance (0 to 1)
      float normalizedDistance = distance / maxDistance;

      // Invert the normalized distance (closer = higher value)
      float influenceFactor = 1 - normalizedDistance;

      // Adjust probability based on distance (closer to click = more likely to be white)
      float threshold = 120 - (influenceFactor * 100);
      float g = random(100) > threshold ? 255 : 0;
      //float g = random(100) > 50 ? 255 : 0;

      noStroke();

      // Dibujar el puntero del mouse
      //float pointerSize = pixelSize * 8;
      //if (distance < g) {
      //fill(c3);
      //} else {
      fill(getRandomColor());
      //}

      rect(x, y, pixelW, pixelH);
    }
  }

  println("Generated with click point at: " + lastClickX + ", " + lastClickY);
}

void mousePressed() {
  // Update last click position
  lastClickX = mouseX;
  lastClickY = mouseY;
  hasClicked = true;

  // Generate new pattern
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
    // Clear click position and generate new pattern with random distribution
    hasClicked = false;
    generate();
  }
}

// Obtener un color por índice (con seguridad)
color getColorByIndex(int index) {
  index = constrain(index, 0, colors.length - 1);
  return colors[index];
}

// Obtener un color al azar
color getRandomColor() {
  int randomIndex = int(random(colors.length));
  return colors[randomIndex];
}

String title = "noise_wallpaper";

int canvasWidth = 1920;
int canvasHeight = 1080;

int pixelSize = 10;

// Variables to track mouse click position
float lastClickX = -1;
float lastClickY = -1;
boolean hasClicked = false;
boolean drawClick = false;

void setup() {
  size(1920, 1080);
  // Initialize with a centered click
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
  color c1 = color(0, 100);
  color c2 = color(0, 0, 255);

  background(c1);

  float maxDistance = dist(0, 0, canvasHeight, canvasHeight); // Maximum possible distance in canvas

  for (int x = 0; x < canvasWidth; x += pixelSize) {
    for (int y = 0; y < canvasHeight; y += pixelSize) {
      // Calculate distance from cell center to last click
      float cellCenterX = x + pixelSize / 2;
      float cellCenterY = y + pixelSize / 2;
      float distance = dist(cellCenterX, cellCenterY, lastClickX, lastClickY);

      // Normalize distance (0 to 1)
      float normalizedDistance = distance / maxDistance;

      // Invert the normalized distance (closer = higher value)
      float influenceFactor = 1 - normalizedDistance;

      // Adjust probability based on distance (closer to click = more likely to be white)
      float threshold = 120 - (influenceFactor * 100);
      float g = random(100) > threshold ? 255 : 0;

      fill(g == 0 ? c1 : c2);
      noStroke();
      rect(x, y, pixelSize, pixelSize);
    }
  }

  // Draw a small indicator at the click position
  if (hasClicked && drawClick) {
    fill(255, 0, 0, 150);
    noStroke();
    ellipse(lastClickX, lastClickY, pixelSize * 2, pixelSize * 2);
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

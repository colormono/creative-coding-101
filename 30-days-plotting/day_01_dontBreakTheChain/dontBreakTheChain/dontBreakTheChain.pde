import processing.svg.*;

int cellSize = 72; // Size of each cell in the grid
int marginX = 20; // Margin around the grid
int marginY = 120; // Margin around the grid
int gutterSize = 10; // Size of the gutter
int lineOffset = 14;
String goal = "Plottering";
int daysGoal = 30;
int currentMonth, currentYear;
int currentDay = 1;
boolean[][] completedDays;

boolean record;

void setup() {
  size(606, 606, P3D);
  currentMonth = month();
  currentYear = year();
  completedDays = new boolean[daysGoal][1];
}

void draw() {
  if (record) {
    beginRaw(SVG, "output.svg");
  }

  background(255);
  drawCalendar();

  if (record) {
    endRaw();
    record = false;
  }
}

void drawCalendar() {
  textSize(14);

  // Draw month and year
  fill(0);
  textAlign(RIGHT, CENTER);
  text(monthName(currentMonth) + " " + currentYear, width - marginX, marginY / 2);
  stroke(0);
  line(width-marginX, marginY / 2 + lineOffset, width-marginX-cellSize, marginY / 2 + lineOffset);

  // Draw goal
  fill(0);
  textAlign(LEFT, CENTER);
  text(daysGoal + " day challenge: " + goal, marginX, marginY / 2);
  stroke(0);
  line(marginX, marginY / 2 + lineOffset, marginX + cellSize*3 + gutterSize*2, marginY / 2 + lineOffset);


  // Draw grid
  for (int i = 0; i < daysGoal; i++) {
    int x = i % 7;
    int y = floor(i / 7);
    int xPos = marginX + x * (cellSize + gutterSize);
    int yPos = marginY + y * (cellSize + gutterSize);

    fill(220, 0);
    stroke(0);
    rect(xPos, yPos, cellSize, cellSize);

    if (completedDays[i][0]) {
      fill(0, 255, 0, 150);
      rect(xPos, yPos, cellSize, cellSize);
    }
  }
}

void mousePressed() {
  int x = mouseX - marginX;
  int y = mouseY - marginY;

  int col = floor(x / (cellSize + gutterSize));
  int row = floor(y / (cellSize + gutterSize));

  if (col >= 0 && col < 7 && row >= 0 && row < ceil(daysGoal / 7.0)) {
    int dayIndex = row * 7 + col;
    if (dayIndex < daysGoal) {
      completedDays[dayIndex][0] = !completedDays[dayIndex][0];
    }
  }
}


// Hit 'r' to record a single frame
void keyPressed() {
  if (key == 'r') {
    record = true;
  }
}

String monthName(int m) {
  switch (m) {
  case 1:
    return "January";
  case 2:
    return "February";
  case 3:
    return "March";
  case 4:
    return "April";
  case 5:
    return "May";
  case 6:
    return "June";
  case 7:
    return "July";
  case 8:
    return "August";
  case 9:
    return "September";
  case 10:
    return "October";
  case 11:
    return "November";
  case 12:
    return "December";
  default:
    return "";
  }
}

int cellSize = 30; // Size of each cell in the grid
int margin = 20; // Margin around the grid
int currentMonth, currentYear;
int daysInMonth = 30;
int currentDay = 1;
boolean[][] completedDays;

void setup() {
  size(800, 600);
  currentMonth = month();
  currentYear = year();
  //daysInMonth = daysInMonth(currentYear, currentMonth);
  completedDays = new boolean[daysInMonth][1];
}

void draw() {
  background(255);
  drawCalendar();
}

void drawCalendar() {
  textSize(14);
  textAlign(CENTER, CENTER);

  // Draw month and year
  fill(0);
  text(monthName(currentMonth) + " " + currentYear, width / 2, margin / 2);

  // Draw grid
  for (int i = 0; i < daysInMonth; i++) {
    int x = i % 7;
    int y = floor(i / 7);
    int xPos = margin + x * cellSize;
    int yPos = margin * 2 + y * cellSize;
    
    fill(220);
    stroke(0);
    rect(xPos, yPos, cellSize, cellSize);
    
    fill(0);
    text(i + 1, xPos + cellSize / 2, yPos + cellSize / 2);
    
    if (completedDays[i][0]) {
      fill(0, 255, 0, 150);
      rect(xPos, yPos, cellSize, cellSize);
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    if (currentMonth == 1) {
      currentMonth = 12;
      currentYear--;
    } else {
      currentMonth--;
    }
    //daysInMonth = daysInMonth(currentYear, currentMonth);
    completedDays = new boolean[daysInMonth][1];
  } else if (keyCode == RIGHT) {
    if (currentMonth == 12) {
      currentMonth = 1;
      currentYear++;
    } else {
      currentMonth++;
    }
    //daysInMonth = daysInMonth(currentYear, currentMonth);
    completedDays = new boolean[daysInMonth][1];
  }
}

void mousePressed() {
  int x = mouseX - margin;
  int y = mouseY - margin * 2;
  
  int col = floor(x / cellSize);
  int row = floor(y / cellSize);
  
  if (col >= 0 && col < 7 && row >= 0 && row < ceil(daysInMonth / 7.0)) {
    int dayIndex = row * 7 + col;
    if (dayIndex < daysInMonth) {
      completedDays[dayIndex][0] = !completedDays[dayIndex][0];
    }
  }
}

String monthName(int m) {
  switch (m) {
    case 1: return "January";
    case 2: return "February";
    case 3: return "March";
    case 4: return "April";
    case 5: return "May";
    case 6: return "June";
    case 7: return "July";
    case 8: return "August";
    case 9: return "September";
    case 10: return "October";
    case 11: return "November";
    case 12: return "December";
    default: return "";
  }
}

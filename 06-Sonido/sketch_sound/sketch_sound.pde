import processing.sound.*;

// Sound variables
SoundFile click;

// Metronome variables
int bpm = 120;             // Beats per minute (adjustable)
float interval;            // Time interval between beats in milliseconds
float lastBeatTime = 0;    // Last time a beat occurred
boolean isPlaying = false; // Metronome state
int beatCount = 0;         // Counter for beats
int beatsPerMeasure = 4;   // Time signature numerator

// Visual pendulum variables
float angle = 0;           // Current angle of the pendulum
float maxAngle = PI/6;     // Maximum pendulum swing angle
float pendulumLength = 150;

// UI elements
Button playButton;
Button plusButton;
Button minusButton;

void setup() {
  size(400, 500);
  
  // Calculate interval in milliseconds
  interval = 60000 / bpm;
  
  // Load sound file (you'll need to add a sound file to your data folder)
  // Create a 'data' folder in your sketch folder and add a short .wav file named 'click.wav'
  try {
    click = new SoundFile(this, "click.wav");
  } catch (Exception e) {
    println("Couldn't load sound file. Make sure you have a 'click.wav' file in your data folder.");
  }
  
  // Create UI buttons
  playButton = new Button(width/2, height - 100, 80, 40, "Play");
  plusButton = new Button(width/2 + 60, height - 50, 40, 30, "+");
  minusButton = new Button(width/2 - 60, height - 50, 40, 30, "-");
}

void draw() {
  background(240);
  
  // Draw metronome body
  fill(200, 180, 150);
  rect(width/2 - 40, 100, 80, 300, 5);
  
  // Calculate and update pendulum if playing
  if (isPlaying) {
    float progress = (millis() - lastBeatTime) / interval;
    if (progress >= 1) {
      // Time for a new beat
      lastBeatTime = millis();
      beatCount = (beatCount + 1) % beatsPerMeasure;
      
      // Play sound
      if (click != null) {
        click.play();
      }
      
      // Reset pendulum direction
      angle = (angle > 0) ? -maxAngle : maxAngle;
    } else {
      // Pendulum animation - smooth sine-like motion
      angle = maxAngle * sin(PI * progress);
    }
  }
  
  // Draw pendulum
  pushMatrix();
  translate(width/2, 120);
  rotate(angle);
  stroke(50);
  strokeWeight(3);
  line(0, 0, 0, pendulumLength);
  fill(255, 0, 0);
  ellipse(0, pendulumLength, 20, 20);
  popMatrix();
  
  // Draw tempo text
  fill(0);
  textAlign(CENTER);
  textSize(24);
  text(bpm + " BPM", width/2, 60);
  
  // Display beat counter
  textSize(16);
  text("Beat: " + (beatCount + 1) + " / " + beatsPerMeasure, width/2, height - 150);
  
  // Draw buttons
  playButton.display();
  plusButton.display();
  minusButton.display();
}

void mousePressed() {
  if (playButton.isOver(mouseX, mouseY)) {
    isPlaying = !isPlaying;
    if (isPlaying) {
      lastBeatTime = millis();
      playButton.label = "Stop";
    } else {
      playButton.label = "Play";
    }
  }
  
  if (plusButton.isOver(mouseX, mouseY)) {
    bpm = min(bpm + 5, 300);
    interval = 60000 / bpm;
  }
  
  if (minusButton.isOver(mouseX, mouseY)) {
    bpm = max(bpm - 5, 30);
    interval = 60000 / bpm;
  }
}

// Simple button class
class Button {
  float x, y, w, h;
  String label;
  color btnColor, textColor, hoverColor;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x - w/2;  // Center the button
    this.y = y - h/2;
    this.w = w;
    this.h = h;
    this.label = label;
    this.btnColor = color(100, 100, 200);
    this.textColor = color(255);
    this.hoverColor = color(120, 120, 220);
  }
  
  void display() {
    if (isOver(mouseX, mouseY)) {
      fill(hoverColor);
    } else {
      fill(btnColor);
    }
    
    noStroke();
    rect(x, y, w, h, 5);
    
    fill(textColor);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(label, x + w/2, y + h/2);
  }
  
  boolean isOver(float px, float py) {
    return px > x && px < x + w && py > y && py < y + h;
  }
}

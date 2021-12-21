// Bobby the line
Line bobby;

// Line's Properties
PVector point0 = new PVector(0.05, 0.01);
PVector point1 = new PVector(0.01, 0.05);

float col = 0;
float colIncrement = 0.5;
float stepMultiplyer = 0.75;

boolean randomPointValuesOnSetup = true;
boolean randomPointValuesOnDraw = false;
boolean changeColors = true;
boolean changeColorWithDepth = true;

int renderSpeed = 1;

void setup() {
  // Display Settings
  //size(600, 400);
  fullScreen();
  frameRate(60);
  colorMode(HSB, 360, 255, 255);
  
  // Makes the line and apply the settings to it
  if (randomPointValuesOnSetup) {
    point0 = new PVector(random(0.01, 0.05), random(0.01, 0.05));
    point1 = new PVector(random(0.01, 0.05), random(0.01, 0.05));
    
    point0.mult(stepMultiplyer);
    point1.mult(stepMultiplyer);
  }
  bobby = new Line(point0, point1);
  
  // Sets the background color
  background(0);
}

void draw() {
  // A for loop that makes rendering faster if needed
  for (int i = 0; i < renderSpeed; i++) {
    // Adds a rectangle to the whole screen to make a fading effect for the lines
    addBackgroundFade();
    
    // Updates the line position
    if (randomPointValuesOnDraw) {
      bobby.valueIncrement0 = new PVector(random(0.01, 0.05) * stepMultiplyer, random(0.01, 0.05) * stepMultiplyer);
      bobby.valueIncrement1 = new PVector(random(0.01, 0.05) * stepMultiplyer, random(0.01, 0.05) * stepMultiplyer);
    }
    bobby.update();
    
    // Renders the line with color
    if (changeColors) {
      updateColor();
    } else {
      fill(225);
      stroke(225);
    }
    bobby.render();
  }
}

// Updates the color of the line and then calls the stroke function
void updateColor() {
  col = col >= 360 ? 0 : col + colIncrement;
  
  if (changeColorWithDepth) {
    stroke(map(bobby.depth, 0, max(width, height), 0, 360), 255, 255 - map(bobby.depth, 0, max(width, height), 192, 0));
  } else {
    stroke(col, 255, 255 - map(bobby.depth, 0, max(width, height), 192, 0));
  }
}

// Simple function to add fade effect to the lines
void addBackgroundFade() {
  noStroke();
  fill(0, 0, 0, 15);
  rect(0, 0, width, height);
}

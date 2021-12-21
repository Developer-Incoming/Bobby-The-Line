// funny function... It's just a fixed map function with some fixed values
float gixedMap(float val, float min, float max) {
  return map(val, min, max, 0, 1);
}

// Line's Class
class Line {
  // Line's Variables
  PVector value0;
  PVector value1;
  PVector valueIncrement0;
  PVector valueIncrement1;
  PVector position0;
  PVector position1;
  
  float depth;
  
  // Setups the Line's variables
  Line(PVector val1, PVector val2) {
    value0 = new PVector(0, 0);
    value1 = new PVector(0, 0);
    valueIncrement0 = val1;
    valueIncrement1 = val2;
    
    position0 = new PVector(width / 2, height / 2);
    position1 = new PVector(width / 2, height / 2);
  }
  
  // Updates the Line's position and calculates the depth
  void update() {
    position0 = new PVector(
      gixedMap(sin(value0.x), -1, 1) * width,
      gixedMap(sin(value0.y), -1, 1) * height
    );
    position1 = new PVector(
      gixedMap(sin(value1.x), -1, 1) * width,
      gixedMap(sin(value1.y), -1, 1) * height
    );
    
    value0.add(valueIncrement0);
    value1.add(valueIncrement1);
    
    depth = abs(position0.x - position1.x) + abs(position0.y - position1.y);
  }
  
  // Simply renders the line on screen
  void render() {
    line(position0.x, position0.y, position1.x, position1.y);
  }
}

/**
 * Storing Input. 
 * 
 * Move the mouse across the screen to change the position
 * of the circles. The positions of the mouse are recorded
 * into an array and played back every frame. Between each
 * frame, the newest value are added to the end of each array
 * and the oldest value is deleted. 
 */
 
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(1000, 1000);
  noStroke();
  fill(255, 153); 
}

void draw() {
  background(51); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    //star(0, 0, 30, 70, 5);
    star(mx[index], my[index], 30, i, 5);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  // how to make a star kinda shape
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

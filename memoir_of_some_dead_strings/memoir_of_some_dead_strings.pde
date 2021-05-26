// Memoirs of Some Dead Strings
// Rakib Ahsan
// Dinajpur, Bangladesh
// 26/05/2021
//
// Some free form shapes created using midpoint displacement which I found pleasing

PVector pos, pPos;
color c;
color bgcolor;

void setup()
{  
  size(1060, 1060);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  bgcolor = color(225, 50, 10);
  background(bgcolor);
  pPos = new PVector(0, 0);
  pos = new PVector(0, 0);
  stroke(c);
  strokeWeight(1);
  makeGrid();
  //singleLoop();
}

void draw() {
  ;
}

// A bunch of small dead strings
void makeGrid()
{
  int c = 6, r = 5;
  int distX = width/c, distY = height/r;
  int offsetY = distY/5;
  for (int i=0; i<c; i++)
  {
    for (int j=0; j<r; j++)
    {
      int x = i*distX+distX/2;
      int y1 = j*distY+offsetY;
      int y2 = (j+1)*distY-offsetY;
      int num = 2;
      for (int k=0; k<num; k++) {
        subdivision(x, y1, x, y2);
        fill(0, 100, 100);
      }
    }
  }
}

// A big dead string
void singleLoop()
{
  int x = width/2;
  int offsetY = height/7;
  int y1 = offsetY;
  int y2 = height - offsetY;
  subdivision(x, y1, x, y2);
  subdivision(x, y1, x, y2);
}

void subdivision(float x1, float y1, float x2, float y2)
{ 
  float d = dist(x1, y1, x2, y2);
  if (d <= .7)
    return;

  float x = d/2;
  float x3 = (x1+x2)/2.0 + random(-x, x);
  float y3 = (y1+y2)/2.0 + random(-x, x);

  //225, 67, 75
  //208, 55, 75
  fill(225, 67, 65, 10);
  noStroke();
  beginShape();
  vertex(x1, y1);
  vertex(x2, y2);  
  vertex(x3, y3);
  vertex(x1, y1);
  endShape(CLOSE);
  
  //316, 50, 100
  //169, 56, 100
  stroke(169, 56, 85, 10);
  if (d<20)
    line(x1, y1, x2, y2);
  subdivision(x1, y1, x3, y3);
  subdivision(x3, y3, x2, y2);
}

void keyPressed()
{
  if (key == 'r') {
    background(bgcolor);
    //singleLoop();
    makeGrid();
  }
  if (key == ' ')
    saveFrame("####.jpg");
}

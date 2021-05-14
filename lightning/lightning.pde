// Lightning
// Rakib Ahsan
// Dinajpur, Bangladesh
// 14/05/2020
//
// Algorithm used to create Lightning pattern was taken from Jared Tarbell's Self-dividing Line { http://www.complexification.net/gallery/machines/selfdividingline/ }
// click and drag to make lightning pattern

PVector pos, pPos;
color c;
color bgcolor;

void setup()
{  
  size(900, 900);
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  bgcolor = color(224, 45, 10);
  c = color(293, 21, 83);
  background(bgcolor);
  pPos = new PVector(0, 0);
  pos = new PVector(0, 0);
  stroke(c, 10);
  strokeWeight(1);
}

void draw() {
  ;
}

void mousePressed()
{
  //background(bgcolor);
  pPos.x = mouseX;
  pPos.y = mouseY;
}

void mouseReleased()
{
  pos.x = mouseX;
  pos.y = mouseY;
  float d = dist(pPos.x, pPos.y, pos.x, pos.y);
  float angle = atan2(pos.y-pPos.y, pos.x-pPos.x);
  int num = /*(int)random(1, 3)*/ 1;
  for (int i=0; i<num; i++) {
    lightning(1, pPos.x, pPos.y, pos.x, pos.y, angle, d, 4);
  }
}

// gen = branch generation, angle = branch angle, len = branch length, strWght = strokeWeight
void lightning(int gen, float x1, float y1, float x2, float y2, float angle, float len, float strWght)
{ 
  // adjust the lightning stroke and color
  strokeWeight(strWght);
  float alpha = map(strWght, 1, 4, 40, 60);
  stroke(c, alpha);
  float d = dist(x1, y1, x2, y2);
  if (d<20)
    line(x1, y1, x2, y2); 
    
  // base case
  if (d <= 10)
  {
    line(x1, y1, x2, y2);
    return;
  }

  float x = d/5;
  float x3 = (x1+x2)/2.0 + random(-x, x);
  float y3 = (y1+y2)/2.0 + random(-x, x);

  // adjust the behaviour of next generation branches and spawn a branch with given probability
  if (random(100)<5 && gen != 3)
  {
    float angle_p, dist_p, strwght_;
    if (gen==1)
    {
      angle_p = angle + ((random(1)<.5) ? PI/4 : -PI/4);
      dist_p = random(len/7, len/3);
      strwght_ = 2;
    } else
    {
      angle_p = angle + ((random(1)<.5) ? PI/4 : -PI/4);
      dist_p = random(len/8, len/5);
      strwght_ = 1;
    }
    float x4 = x3 + dist_p*cos(angle_p);
    float y4 = y3 + dist_p*sin(angle_p);
    lightning(gen+1, x3, y3, x4, y4, angle_p, dist_p, strwght_);
  }
  // recursive call
  lightning(gen, x1, y1, x3, y3, angle, len, strWght);
  lightning(gen, x3, y3, x2, y2, angle, len, strWght);
}

void keyPressed()
{
  if (key == 'r')
    background(bgcolor);
  if (key == ' ')
    saveFrame("####.jpg");
}

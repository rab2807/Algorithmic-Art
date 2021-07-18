// Lightning
// Rakib Ahsan
// Dinajpur, Bangladesh
// 19/07/2021
//
// Perlin noise based flow field

int num = 2000;
float xInc=.01, yInc=.01, zf = random(100);
int unit=1;
PVector t = new PVector(0, 0);
Particle[] p;

void setup()
{
  noiseDetail(10);
  smooth();
  strokeWeight(.5);
  colorMode(HSB, 360, 100, 100);
  size(1080, 1080);
  background(0, 0, 100);
  p = new Particle[num];
  for (int i=0; i<num; i++)
    p[i] = new Particle(0, random(height));
}

void setVector(int i, int j)
{
  float angle = noise(i*xInc, j*yInc, zf)*4*PI;
  t.x = cos(angle);
  t.y = sin(angle);
}

void draw()
{
  for (int i = 0; i<num; i++) {
    setVector((int)(p[i].pos.x/unit)*unit, (int)(p[i].pos.y/unit)*unit);
    p[i].setAcc(t);
    p[i].update();
    p[i].display();
  }
  zf += .003;
}

void keyPressed()
{
  if (keyCode == ENTER)
    saveFrame("####.jpg");
}

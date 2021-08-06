ArrayList<particle> p;
int num=1700;
float nScale=10, nInc=.001, angle;
int unit=5, i, j;

void setup()
{
  colorMode(HSB, 360, 100, 100);
  blendMode(SCREEN);
  smooth();
  size(1080, 1080);
  background(210, 90, 5);
  
  p = new ArrayList<particle>();
  for (int i=0; i<num; i++)
    p.add(new particle(random(width), random(height)));
}

void setVector(particle a)
{
  i = (int) (a.pos.x/unit);
  j = (int) (a.pos.y/unit);

  angle = noise(i*nInc, j*nInc) * 2 * PI * nScale;
  a.acc.x = cos(angle);
  a.acc.y = sin(angle);
}

void draw()
{    
  for (int i=0; i<num; i++) {
    setVector(p.get(i));
    p.get(i).update();
    p.get(i).display();
  }
}

void keyPressed() 
{
  if (keyCode == ENTER)
    save("####.jpg");
}

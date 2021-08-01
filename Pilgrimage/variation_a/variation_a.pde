float[][] angles;
int unit = 10;
int num = 500;
ArrayList<Particle> p;
float timer = 0;
color bgcol;

void setup()
{
  size(800, 800);
  bgcol = color(0);
  background(bgcol);
  strokeWeight(.5);

  angles = new float[width/unit][height/unit];
  setAngle();
  p = new ArrayList<Particle>();
  for (int i=0; i<num; i++)
    p.add(new Particle(random(100), random(100), random(15)));
}

void setAngle()
{
  float a;
  for (int i=0; i<angles.length; i++) {
    for (int j=0; j<angles[i].length; j++) {
      a = random(2*PI);
      angles[i][j] = a;
    }
  }
}

void draw()
{
  //background(bgcol);
  for (int i=0; i<p.size(); i++) {
    float a = angles[int(p.get(i).pos.x/unit)][int(p.get(i).pos.y/unit)];
    p.get(i).getDir(a);
    p.get(i).update();
    //p.get(i).show();
    if (!p.get(i).isInBound())
      p.remove(i);
  }

  for (int i=0; i<p.size(); i++)
    for (int j=0; j<p.size(); j++) {
      float overlapVal = p.get(i).isOverlapped(p.get(j));
      if (overlapVal <= 1) {
        stroke(map(overlapVal, 0, 1, 250, 0));
        line(p.get(i).pos.x, p.get(i).pos.y, p.get(j).pos.x, p.get(j).pos.y);
      }
    }

  if (timer>150) {
    setAngle();
    timer = 0;
  }
  timer++;
}

void keyPressed() {
  if (key == 'q')
    println(p.size());

  if (keyCode == ENTER)
    saveFrame("####.jpg");
}

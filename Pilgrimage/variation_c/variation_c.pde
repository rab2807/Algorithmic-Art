// Pilgrimage, variation C
// Rakib Ahsan
// Dinajpur, Bangladesh
// 02/08/2021


float[][] angles;
int unit = 10;
int num = 1000;
ArrayList<Particle> p;
float timer = 0;
color bgcol;

void setup()
{
  size(800, 800);
  bgcol = color(0);
  background(bgcol);
  strokeWeight(.5);
  noLoop();

  angles = new float[width/unit][height/unit];
  setAngle();
  p = new ArrayList<Particle>();
  for (int i=0; i<num; i++)
    p.add(new Particle(random(width), random(height), random(15)));
}

void setAngle()
{
  float xf=0, yf;
  for (int i=0; i<angles.length; i++) {
    yf = 0;
    for (int j=0; j<angles[i].length; j++) {
      float a = noise(xf, yf, noise(xf, yf)) * 4 * PI;
      angles[i][j] = a;
      yf += .2;
    }
    xf += .2;
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
        //stroke(255);
        line(p.get(i).pos.x, p.get(i).pos.y, p.get(j).pos.x, p.get(j).pos.y);
      }
    }

  setAngle();
}

void keyPressed() {
  if (key == 'q')
    println(p.size());
  if (keyCode == ENTER)
    saveFrame("####.jpg");
}

class Particle
{
  PVector pos, pPos, vel, acc;
  float baseColor = 200;
  color c;

  Particle(float x, float y)
  {
    pos = pPos = new PVector(x, y);
    vel = acc = new PVector(0, 0);

    //complimentary
    //baseColor = random(100) < 70 ? baseColor : (baseColor+180)%360;
  }

  void update()
  {
    vel.add(acc);
    vel.limit(5);
    pPos = pos.copy();
    pos.add(vel);
    acc.mult(0);
    wrap();
  }

  void wrap()
  {
    if (pos.x<0)
      pos.x = pPos.x = 0;
    if (pos.x>width)
      pos.x = pPos.x = width;
    if (pos.y<0)
      pos.y = pPos.y = height;
    if (pos.y>height)
      pos.y = pPos.y = 0;
  }

  void setAcc(PVector a)
  {
    acc = a.copy();
    acc.limit(1);
    //vel = a.copy();
    //vel.setMag(20);
  }

  void display()
  {
    stroke(baseColor+pos.x/width*60, 20, 80, 80);
    line(pos.x, pos.y, pPos.x, pPos.y);
  }
}

class particle
{
  PVector pos, pPos;
  PVector vel, acc;
  float speed = 3;
  float h = 15;

  particle(float x, float y)
  {
    pos = pPos = new PVector(x, y);
    vel = acc = new PVector(0, 0);
  }

  void update()
  {
    vel.add(acc);
    vel.limit(1);
    pPos = pos.copy();
    pos.add(vel);
    wrap();
  }

  void wrap()
  {
    if (pos.x>width || pos.x<0) {
      pos.x = pPos.x = random(0, width);
      pos.y = pPos.y = random(0, height);
    }
    if (pos.y>height || pos.y<0) {
      pos.x = pPos.x = random(0, width);
      pos.y = pPos.y = random(0, height);
    }
  }

  void display()
  {
    noFill();
    stroke(h, 100, 100, 90);
    strokeWeight(.8);
    line(pos.x, pos.y, pPos.x, pPos.y);
    if (h<30)
      h += .03;
  }
}

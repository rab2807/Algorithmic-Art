class Particle {
  PVector pos, vel, acc;
  float radius;

  Particle(float x, float y, float radius)
  {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    this.radius = radius;
  }

  void getDir(float angle)
  {
    float mag = .1;
    acc.x = mag*cos(angle);
    acc.y = mag*sin(angle);
  }

  void update()
  {
    vel.add(acc);
    vel.limit(1);
    pos.add(vel);
    //clamp();
  }

  void clamp()
  {
    if (pos.x<0) pos.x = width-1;
    if (pos.x>=width) pos.x = 0;
    if (pos.y<0) pos.y = height-1;
    if (pos.y>=height) pos.y = 0;
  }

  boolean isInBound() {
    if (pos.x<0 || pos.x>=width || pos.y<0 || pos.y>=height) return false;
    return true;
  }

  float isOverlapped(Particle p) {
    float d = (pos.x - p.pos.x)*(pos.x - p.pos.x) + (pos.y - p.pos.y)*(pos.y - p.pos.y);
    return d / ((p.radius + radius)*(p.radius + radius));
  }

  void show()
  {
    fill(255);
    circle(pos.x, pos.y, 1);
    //point(pos.x, pos.y);
  }
}

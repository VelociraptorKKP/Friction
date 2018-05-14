class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float c;

  Mover() {
    loc = new PVector(50, height - height/3);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = random(1, 2);
    c = -0.1;
  }

  void friction() {
    if (loc.x > width - width / 3) {
      PVector friction = m.vel.get();
      friction.normalize();
      friction.mult(c);
      applyForce(friction);
    }
  }

  void render() {
    fill(255);
    ellipse(loc.x, loc.y, mass*25, mass*25);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }

  void edge() {
    if (loc.x >width) {
      loc.x = width;
      vel.x *= -1;
    }
    if (loc.y > (height - height/3) - (mass * 25) / 2) {
      loc.y =  (height - height/3) - (mass * 25) / 2;
      vel.y *= -1;
    }
    if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }
    if (loc.y < 0) {
      loc.y = 0;
      vel.y *= -1;
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
}

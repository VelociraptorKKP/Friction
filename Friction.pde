Mover m;

void setup() {
  size(640, 480);
  m = new Mover();
}

void draw() {
  background(0);
  fill(200);
  rect(0, height - height/3, width, height/3);
  noStroke();
  for (int i = 15; i <= 300; i += 15) {
    ellipse(width - (width/3) + (i), height - height/3, 15, 15);
  }
  PVector gravity = new PVector(0, 0.1);
  gravity.mult(m.mass);
  m.applyForce(gravity);
  PVector move = new PVector(0.5, 0);
  if (mousePressed) {
    m.applyForce(move);
  }
  m.update();
  m.friction();
  m.edge();
  m.render();
}

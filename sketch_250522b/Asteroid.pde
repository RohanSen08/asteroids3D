class Asteroid {
  PVector position;
  PVector velocity;
  //AsteroidSize size;
  float rotate;
  Model3D model;
  int tick;
  int size;
  public Asteroid(PShape object) {
    model = new Model3D(object);
    position = new PVector(random(600)+100,random(600)+100,random(100)+200);
    velocity = new PVector((500-position.x)/50, (575-position.y)/50, (700-position.z)/50);
    rotate = 0;
    tick = 0;
    size = (int) random(25) + 10;
  }
  public void render() {
    if (tick % 5 == 0) {
      rotate += PI/8;
      position.x += velocity.x;
      position.y += velocity.y;
      position.z += velocity.z;
    }
    model.render((int) position.x, (int) position.y, (int) position.z, rotate, -rotate, rotate);
    tick++;
  }
  public boolean inBounds() {
    if (position.x > 500 && position.y > 575 && position.z > 700) return false;
    return true;
  }
}

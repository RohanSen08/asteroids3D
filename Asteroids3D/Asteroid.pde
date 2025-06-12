class Asteroid {
  private PVector position;
  private PVector velocity;
  private float rotate;
  private Model3D model;
  private int tick;
  
  public Asteroid(PShape object) {
    model = new Model3D(object);
    position = new PVector(random(600)+100,random(600)+100,random(100)+200);
    velocity = new PVector((500-position.x)/50, (575-position.y)/50, (700-position.z)/50);
    rotate = 0;
    tick = 0;
  }
  public void render() {
    if (tick % 5 == 0) {
      position.x += velocity.x;
      position.y += velocity.y;
      position.z += velocity.z;
    }
    rotate += PI/16;
    model.render((int) position.x, (int) position.y, (int) position.z, rotate, -rotate, rotate);
    tick++;
  }
  public boolean inBounds() {
    if (position.x > 500 && position.y > 575 && position.z > 700) return false;
    return true;
  }
  public PVector getPosition() {
    return position;
  }
}

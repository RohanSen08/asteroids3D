class Asteroid {
  PVector position;
  PVector velocity;
  //AsteroidSize size;
  float rotate;
  Model3D model;
  public Asteroid(String name) {
    model = new Model3D(name);
    position = new PVector(random(100),random(100),random(100));
    float minDist = min(position.x, position.y, position.z);
    velocity = new PVector((500-position.x)/minDist, (575-position.y)/minDist, (700-position.z)/minDist);
    rotate = 0;
  }
  public void render() {
    rotate += PI/8;
    model.render((int) (position.x + velocity.x), (int) (position.y + velocity.y), (int) (position.z + velocity.z), rotate, -rotate, rotate);
  }
}

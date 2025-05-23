class SpaceShip {
  PVector position;
  float rotation;
  Model3D model;
  public SpaceShip(String path) {
    rotation = PI/2;
    model = new Model3D(path);
    position = new PVector(0,0,0);
  }
  public void rotate(float dir) {
    rotation += dir;
  }
  public void render() {
    model.render((int) position.x, (int) position.y, (int) position.z, rotation);
  }
}

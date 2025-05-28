class SpaceShip {
  PVector position;
  float rotationX;
  float rotationY;
  float rotationZ;
  Model3D model;
  public SpaceShip(String path) {
    rotationY = PI/2;
    model = new Model3D(path);
    position = new PVector(0,0,0);
  }
  public void rotate(float dir) {
    rotationX += dir;
  }
  public void render() {
    model.render((int) position.x, (int) position.y, (int) position.z, rotationX, rotationY, rotationZ);
  }
}

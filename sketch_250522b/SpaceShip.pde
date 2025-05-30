class SpaceShip {
  float rotationX;
  float rotationY;
  float rotationZ;
  Model3D model;
  
  public SpaceShip(String path) {
    rotationX = PI;
    rotationY = 0;
    rotationZ = 0;
    model = new Model3D(path);
  }
  
  public void rotate(float dirX, float dirY, float dirZ) {
    rotationX += dirX;
    rotationY += dirY;
    rotationZ += dirZ;
  }
  public void render() {
    model.render((int) 500, (int) 575, (int) 700, map(mouseY, 0, height, PI/2, 3*PI/2), map(mouseX, 0, width, -PI/2, PI/2), rotationZ);
  }
  
}

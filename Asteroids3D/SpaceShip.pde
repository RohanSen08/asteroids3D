class SpaceShip {
  private float rotationX;
  private float rotationY;
  private float rotationZ;
  private Model3D model;
  private PVector gunBarrelOffset = new PVector(0, 9.465, 53.723);
  private PVector position = new PVector(500, 575, 700);
  
  public SpaceShip(String path) {
    rotationX = PI;
    rotationY = 0;
    rotationZ = 0;
    model = new Model3D(path);
  }
  public void render() {
    rotationX = map(mouseY, 0, height, PI/2, 3*PI/2);
    rotationY = map(mouseX, 0, width, -PI/2, PI/2);
    model.render((int) position.x, (int) position.y, (int) position.z, rotationX, rotationY, rotationZ);
  }

  public PVector getGunBarrelPosition() {
    // Save current matrix state
    pushMatrix();
    
    translate(position.x, position.y, position.z);
    rotateX(rotationX);
    rotateY(rotationY);
    rotateZ(rotationZ);
    
    float worldX = modelX(gunBarrelOffset.x, gunBarrelOffset.y, gunBarrelOffset.z);
    float worldY = modelY(gunBarrelOffset.x, gunBarrelOffset.y, gunBarrelOffset.z);
    float worldZ = modelZ(gunBarrelOffset.x, gunBarrelOffset.y, gunBarrelOffset.z);
    
    popMatrix();
    
    return new PVector(worldX, worldY, worldZ);
  }
  
  public PVector getGunDirection() {
    PVector direction = new PVector(0, 0, -1);
    
    float tempY = direction.y * cos(rotationX) - direction.z * sin(rotationX);
    float tempZ = direction.y * sin(rotationX) + direction.z * cos(rotationX);
    direction.y = tempY;
    direction.z = tempZ;
    
    float tempX = direction.x * cos(rotationY) + direction.z * sin(rotationY);
    tempZ = -direction.x * sin(rotationY) + direction.z * cos(rotationY);
    direction.x = tempX;
    direction.z = tempZ;
    
    direction.normalize();
    return direction;
  }
  
  public PVector getPosition() {
    return position;
  }
}

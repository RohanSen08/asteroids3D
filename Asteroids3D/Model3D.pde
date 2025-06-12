class Model3D {
  private PShape shape;
  
  public Model3D(String path) {
    shape = loadShape(path);
  }
  
  public Model3D(PShape asteroid) {
    shape = asteroid;
  } 
  
  public void loadModel(String path) {
    shape = loadShape(path);
  }
  
  public void setTexture(String path) {
    PImage img = loadImage(path);
    shape.setTexture(img);
  }
  
  public void render(int x, int y, int z, float thetaX, float thetaY, float thetaZ) {
    pushMatrix();
    translate(x, y, z);
    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);
    shape(shape);
    popMatrix();
  }
  
  public void renderBullet(int x, int y, int z, float thetaX, float thetaY, float thetaZ) {
    pushMatrix();
    translate(x, y, z);
    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);
    beginShape();
    fill(255,0,0);
    noStroke();
    box(10, 10, 25);
    endShape();
    fill(255,255,255);
    popMatrix();
  }
}

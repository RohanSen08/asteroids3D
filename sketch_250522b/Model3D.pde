class Model3D {
  PShape shape;
  String objFile;
  PImage texture;
  float scale;

  public Model3D(String path, String texturePath) {
    objFile = path;
    shape = loadShape(path);
    texture = loadImage(texturePath);
    shape.setTexture(texture);
  } 
  public Model3D(String path) {
    objFile = path;
    shape = loadShape(path);
  } 
  public void loadModel(String path) {
    objFile = path;
    shape = loadShape(path);
  }
  public void loadModel(String path, String texturePath) {
    objFile = path;
    shape = loadShape(path);
    texture = loadImage(texturePath);
    shape.setTexture(texture);
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
  public void render(int x, int y, int z, float thetaX, float thetaY, float thetaZ, boolean skib) {
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
  public void render(int x, int y, int z, float thetaX, float thetaY, float thetaZ, int scale) {
    pushMatrix();
    translate(x, y, z);
    rotateX(thetaX);
    rotateY(thetaY);
    rotateZ(thetaZ);
    beginShape();
    noStroke();
    sphere(scale);
    endShape();
    popMatrix();
  }
}

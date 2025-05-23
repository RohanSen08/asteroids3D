class Asteroid {
  PVector position;
  PVector velocity;
  AsteroidSize size;
  Model3D model;
  public Asteroid(String name) {
    model = new Model3D(name);
    position = new PVector(random()*250,random()*250,random*250);
    
  }
  
}

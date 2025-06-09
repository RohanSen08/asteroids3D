class Bullet{

    private PVector position;
    private PVector velocity;
    private PVector direction;
    private int lifespan;
    private int maxLifeSpan;
    private float angleX, angleY, angleZ;
    private boolean active;
    private Model3D bullet;
    
    public Bullet(SpaceShip spaceship){
      
    position = new PVector(500, 575, 700);
    
    angleX = map(mouseY, 0, height, PI/2, 3*PI/2);
    angleY = map(mouseX, 0, width, -PI/2, PI/2);
    angleZ = spaceship.rotationZ;
    
    //direction = new PVector(sin(angleX) * cos(angleY), -cos(angleX),sin(angleX) * sin(angleY));
    direction = new PVector(0, 0, -1);
    direction.y = direction.y * cos(angleX) - direction.z * sin(angleX);
    direction.z = direction.y * sin(angleX) + direction.z * cos(angleX);
    
    direction.x = -direction.x * cos(angleY) - direction.z * sin(angleY);
    direction.z = direction.x * sin(angleY) + direction.z * cos(angleY);
    direction.normalize();
    velocity = PVector.mult(direction, -7.5);    

    
    maxLifeSpan = 100; 
    lifespan = maxLifeSpan;
    active = true;
    
    bullet = new Model3D("bullet.obj");
    }
     public void update(){
      position.add(velocity);
      lifespan--;
      if (lifespan <= 0){
        active = false; 
      }
      
    }
    
    public void render(){
      bullet.render((int)position.x, (int)position.y, (int)position.z, angleX, angleY, angleZ);
    } 
    
    public boolean isAlive(){
      return active;
    }
    
    public PVector getPosition() {
        return position;
    }
    
    public float getX() {
        return position.x;
    }
    
    public float getY() {
        return position.y;
    }
    
    public float getZ() {
        return position.z;
    }
}

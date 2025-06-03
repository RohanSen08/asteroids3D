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
    
    direction = new PVector(cos(spaceship.rotationY), sin(spaceship.rotationY), 0);
    velocity = PVector.mult(direction, 15);
    
    angleX = spaceship.rotationX;
    angleY = spaceship.rotationY;
    angleZ = spaceship.rotationZ;
    
    maxLifeSpan = 120; 
    lifespan = maxLifeSpan;
    active = true;
    
    bullet = new Model3D("9mmLuger.obj");
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

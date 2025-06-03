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
    
    direction = new PVector(map(mouseY, 0, height, 0, PI), -map(mouseX, 0, width, 0, PI), spaceship.rotationZ);
    velocity = PVector.mult(direction, 5);
    
    angleX = spaceship.rotationX;
    angleY = spaceship.rotationY;
    angleZ = spaceship.rotationZ;
    
    maxLifeSpan = 12000; 
    lifespan = maxLifeSpan;
    active = true;
    
    bullet = new Model3D("space-shuttle.obj");
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

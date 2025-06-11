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
      position = spaceship.getGunBarrelPosition().copy();
      direction = spaceship.getGunDirection().copy();
      angleX = spaceship.rotationX;
      angleY = spaceship.rotationY;
      angleZ = spaceship.rotationZ;
      velocity = PVector.mult(direction, -15);
      velocity.x *= -1;
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
      bullet.renderBullet((int)position.x, (int)position.y, (int)position.z, angleX, angleY, angleZ);
    } 
    
    public boolean isAlive(){
      return active;
    }
    
    public PVector getPosition() {
        return position;
    }
}

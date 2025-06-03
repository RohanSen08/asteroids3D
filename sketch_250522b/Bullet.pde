class Bullet{

    private PVector position;
    private PVector velocity;
    private PVector direction;
    private int lifespan;
    private int maxLifeSpan;
    private float angleX, angleY, angleZ;
    private boolean active;
    private Model3D bullet;
    private int speed;
    
    public Bullet(SpaceShip spaceship){
      
    position = spaceship.position;
    
    direction = new PVector(cos(spaceship.rotationY), sin(spaceship.rotationY), 0);
    speed = 15;
    velocity = PVector.mult(direction, speed);
    
    rotationX = spaceship.rotationX;
    rotationY = spaceship.rotationY;
    rotationZ = spaceship.rotationZ;
    
    maxLifeSpan = 120; 
    lifespan = maxLifeSpan;
    active = true;
    
    bullet = new Model3D("9mmLuger.obj");
    }
    
    public Bullet(PVector startPos, float shipRotX, float shipRotY, float shipRotZ) {
    position = startPos.copy();
    
    direction = new PVector(cos(shipRotY), 0, sin(shipRotY));
    speed = 15;
    velocity = PVector.mult(direction, speed);
    
    rotationX = shipRotX;
    rotationY = shipRotY;
    rotationZ = shipRotZ;
    
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
      pushMatrix(); 
     translate(position.x, position.y, position.z);
     rotateY(angleY);
      bullet.render((int) position.x, (int) position.y, (int) position.z, map(mouseY, 0, height, PI/2, 3*PI/2), map(mouseX, 0, width, -PI/2, PI/2), rotationZ);>>>>lame
     popMatrix();
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

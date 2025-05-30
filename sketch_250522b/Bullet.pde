class Bullet{

    private PVector position;
    private PVector velocity;
    private PVector direction;
    private int lifespan;
    private float angleX, angleY, angleZ;
    private boolean active;
    private Model3D bullet;
    
    public Bullet(){
      position = new PVector(0,0, 0);
      angleX = (float) SpaceShip.rotationX;
      direction = new PVector(cos(angleX), sin(angleY), 0);
      velocity = PVector.mult(direction, 10);
      lifespan = 100;
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
     rotateY(angle);
      bullet.render((int) position.x, (int) position.y, (int) position.z, map(mouseY, 0, height, PI/2, 3*PI/2), map(mouseX, 0, width, -PI/2, PI/2), rotationZ);
      popMatrix();
    } 
    
    public boolean isAlive(){
      return active;
    }
}

class Bullet{

    private PVector position;
    private PVector velocity;
    private PVector direction;
    private int lifespan;
    private double angle;
    private boolean active;
    private Model3D bullet;
    
    public Bullet(){
      position = new PVector(0,0, 0);
      velocity = PVector.mult(direction, 10);
      direction = new PVector(cos(angle), sin(angle), 0);
      angle = Spaceship.getRotation();
      lifespan = 100;
      active = true;
      bullet = new Model3D("bullet.obj");//find a model;
    }
    
    public void update(){
      position.add(velocity);
      lifespan--;
      if (lifespan <= 0){
        active = false; 
      }
      
    }
    
    public void render(){
      bullet.render((int) position.x, (int) position.y, (int) position.z, angle);
    } 
    
    public boolean isAlive(){
      return active;
    }
}

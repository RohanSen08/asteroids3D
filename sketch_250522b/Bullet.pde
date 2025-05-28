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
      velocity = new PVector(50,50,50);
      direction = new PVector(cos(angle), sin(angle), 0);
      angle = 90;
      lifespan = 20;
      active = true;
      bullet//find a model;
    }
    
    public void update(){
      position.x += velocity.x * angle;
      position.y += velocity.y * angle;
      position.z += velocity.z * angle;
    }
    
    public void render(){
      
    }
    
    public boolean isAlive(){
      return CollisionDetector.checkCollision(bullet, /*asteroid*/) && lifespan >= 0;
    }
  
}

class Bullet{

    private PVector position;
    private PVector velocity;
    private int lifespan;
    private boolean active;
    
    public Bullet(){
      position = new PVector(0,0,0);
      velocity = new PVector(50,50,50);
      
      active = true;
    }
  
}

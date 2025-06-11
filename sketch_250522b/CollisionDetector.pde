class CollisionDetector {
  public boolean checkCollision(Bullet bullet, Asteroid asteroid) {
    PVector bulletPos = bullet.getPosition();
    PVector asteroidPos = asteroid.getPosition();
    
    float bulletWidth = 2, bulletHeight = 2, bulletDepth = 5;
    float asteroidWidth = 50;
    float asteroidHeight = 50; 
    float asteroidDepth = 50;
    
    float bulletMinX = bulletPos.x - bulletWidth/2;
    float bulletMaxX = bulletPos.x + bulletWidth/2;
    float bulletMinY = bulletPos.y - bulletHeight/2;
    float bulletMaxY = bulletPos.y + bulletHeight/2;
    float bulletMinZ = bulletPos.z - bulletDepth/2;
    float bulletMaxZ = bulletPos.z + bulletDepth/2;
    
    float asteroidMinX = asteroidPos.x - asteroidWidth/2;
    float asteroidMaxX = asteroidPos.x + asteroidWidth/2;
    float asteroidMinY = asteroidPos.y - asteroidHeight/2;
    float asteroidMaxY = asteroidPos.y + asteroidHeight/2;
    float asteroidMinZ = asteroidPos.z - asteroidDepth/2;
    float asteroidMaxZ = asteroidPos.z + asteroidDepth/2;
    
    boolean overlapX = (bulletMaxX >= asteroidMinX) && (bulletMinX <= asteroidMaxX);
    boolean overlapY = (bulletMaxY >= asteroidMinY) && (bulletMinY <= asteroidMaxY);
    boolean overlapZ = (bulletMaxZ >= asteroidMinZ) && (bulletMinZ <= asteroidMaxZ);
    
    return overlapX && overlapY && overlapZ;
  }
  public boolean checkLoss(Asteroid asteroid, SpaceShip spaceShip) {
    PVector asteroidPos = asteroid.getPosition();
    PVector userPos = spaceShip.position;
    
    float bulletWidth = 5, bulletHeight = 5, bulletDepth = 4;
    float asteroidWidth = 50;
    float asteroidHeight = 50; 
    float asteroidDepth = 50;
    
    float bulletMinX = asteroidPos.x - bulletWidth/2;
    float bulletMaxX = asteroidPos.x + bulletWidth/2;
    float bulletMinY = asteroidPos.y - bulletHeight/2;
    float bulletMaxY = asteroidPos.y + bulletHeight/2;
    float bulletMinZ = asteroidPos.z - bulletDepth/2;
    float bulletMaxZ = asteroidPos.z + bulletDepth/2;
    
    float asteroidMinX = userPos.x - asteroidWidth/2;
    float asteroidMaxX = userPos.x + asteroidWidth/2;
    float asteroidMinY = userPos.y - asteroidHeight/2;
    float asteroidMaxY = userPos.y + asteroidHeight/2;
    float asteroidMinZ = userPos.z - asteroidDepth/2;
    float asteroidMaxZ = userPos.z + asteroidDepth/2;
    
    boolean overlapX = (bulletMaxX >= asteroidMinX) && (bulletMinX <= asteroidMaxX);
    boolean overlapY = (bulletMaxY >= asteroidMinY) && (bulletMinY <= asteroidMaxY);
    boolean overlapZ = (bulletMaxZ >= asteroidMinZ) && (bulletMinZ <= asteroidMaxZ);
    
    return overlapX && overlapY && overlapZ;
  }
}

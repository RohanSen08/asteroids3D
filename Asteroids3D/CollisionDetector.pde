class CollisionDetector {
  public boolean bulletHitAsteroid(Bullet bullet, Asteroid asteroid) {
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
  
  public boolean asteroidHitShip(Asteroid asteroid, SpaceShip spaceShip) {
    PVector asteroidPos = asteroid.getPosition();
    PVector userPos = spaceShip.getPosition();
    
    float userWidth = 5, userHeight = 5, userDepth = 4;
    float asteroidWidth = 50;
    float asteroidHeight = 50; 
    float asteroidDepth = 50;
    
    float userMinX = asteroidPos.x - userWidth/2;
    float userMaxX = asteroidPos.x + userWidth/2;
    float userMinY = asteroidPos.y - userHeight/2;
    float userMaxY = asteroidPos.y + userHeight/2;
    float userMinZ = asteroidPos.z - userDepth/2;
    float userMaxZ = asteroidPos.z + userDepth/2;
    
    float asteroidMinX = userPos.x - asteroidWidth/2;
    float asteroidMaxX = userPos.x + asteroidWidth/2;
    float asteroidMinY = userPos.y - asteroidHeight/2;
    float asteroidMaxY = userPos.y + asteroidHeight/2;
    float asteroidMinZ = userPos.z - asteroidDepth/2;
    float asteroidMaxZ = userPos.z + asteroidDepth/2;
    
    boolean overlapX = (userMaxX >= asteroidMinX) && (userMinX <= asteroidMaxX);
    boolean overlapY = (userMaxY >= asteroidMinY) && (userMinY <= asteroidMaxY);
    boolean overlapZ = (userMaxZ >= asteroidMinZ) && (userMinZ <= asteroidMaxZ);
    
    return overlapX && overlapY && overlapZ;
  }
}

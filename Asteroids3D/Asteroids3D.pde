SpaceShip spaceShip;
PImage bg;
ArrayList<Asteroid> asteroids = new ArrayList<>();
int tick;
ArrayList<Bullet> bullets = new ArrayList<>();
PShape asteroidModel; 
PImage titleCard;
CollisionDetector col;
ScoreManager sc = new ScoreManager();
boolean firstRun = true;
PFont font;
int coolOff = 5;
Sound sound;
PImage gold, silver, bronze;

void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
  asteroidModel = loadShape("asteroid.obj"); 
  tick = 0;
  titleCard = loadImage("titleCard.png");
  col = new CollisionDetector();
  font = createFont("Arial", 50, true);
  sound = new Sound(this);
  gold = loadImage("gold.jpg");
  silver = loadImage("silver.jpg");
  bronze = loadImage("bronze.jpg");
  
}

void draw() {
  lights();
  if (sc.getStatus()) {
    background(bg);
    fill(255, 255, 255);
    textSize(20);
    text("Score: " + sc.getScore(), 850, 30);
    spaceShip.render();
    if (tick%max(75-sc.getScore(), 25) == 0) asteroids.add(new Asteroid(asteroidModel));
    for (int i = asteroids.size() - 1; i >= 0; i--) {
      if (col.asteroidHitShip(asteroids.get(i), spaceShip)) {
        sc.endGame();
        asteroids.remove(i); 
        sc.reset();
      }
      else asteroids.get(i).render();
    }
    for (int i = bullets.size() - 1; i >= 0; i--) { 
      Bullet bullet = bullets.get(i);
      
      if (bullet.isAlive()) {
        bullet.update();
        bullet.render();
        
        for (int j = asteroids.size() - 1; j >= 0; j--) {
          Asteroid asteroid = asteroids.get(j);
          
          // Check if bullet hits this asteroid
          if (col.bulletHitAsteroid(bullet, asteroid)) {
            sound.playExplosion();
            bullets.remove(i);      
            asteroids.remove(j); 
            sc.addPoints(1);
            break;
          }
        }
      } else {
        bullets.remove(i);
      }
    }
    tick++;
  } else {
    for (int i = bullets.size() - 1; i >= 0; i--) { 
      bullets.remove(i);
    }
    for (int i = asteroids.size() - 1; i >= 0; i--) {
     asteroids.remove(i);
    }
    background(255,255,255);
    image(titleCard, 50, 150);
    if (!firstRun) {
      fill(0, 0, 0);
      textSize(50);
      textFont(font);
      text("Final Score: " + sc.getLastScore(), 350, 800);
      text("High Score: " + sc.getHighScore(), 350, 900);
      if (sc.getLastScore() == sc.getHighScore()) {
        text("NEW HIGH SCORE!!!", 300, 200);
      } else if (sc.getLastScore() < 10) {
        text("less than 10? LLLL", 300, 200);
      } else if (sc.getLastScore() < 35) {
        text("game over!", 350, 200);
      } else {
        text("game over, good job!", 300, 200);
      }
      fill(255,255,255);
      if (sc.getLastScore() >= 50){
        bronze.resize(200, 200);
        image(bronze, width/2 - 100, 500);
      }
      if (sc.getLastScore() >= 100){
        silver.resize(200, 200);
        image(silver, width/2 - 100, 500);
      }
      if (sc.getLastScore() >= 150){
        gold.resize(200, 200);
        image(gold, width/2 - 100, 500);
      }
    }
    coolOff--;
  }
}

void mouseClicked(){
  if (firstRun) firstRun = false;
  if (!sc.getStatus()) {
    if (coolOff < 0) {
      coolOff = 5;
      sc.startGame();
    }
  } else {
    sound.playLaser();
    bullets.add(new Bullet(spaceShip));
  }
}

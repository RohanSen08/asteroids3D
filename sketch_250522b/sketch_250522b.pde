import processing.sound.SoundFile;

float rotationY = 0;
SpaceShip spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
Asteroid asteroid;
ArrayList<Asteroid> asteroids = new ArrayList<>();
int tick;
ArrayList<Bullet> bullets = new ArrayList<>();
PShape asteroidModel; 
boolean alive = false;
PImage titleCard;
boolean showBarrelDebug = false;
float offsetStep = 2.0;
CollisionDetector col;
SoundFile laser;
SoundFile explosion;
ScoreManager sc = new ScoreManager();
int finalScore = 0;
boolean firstRun = true;
PFont font;

void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
  asteroidModel = loadShape("asteroid.obj"); 
  tick = 0;
  titleCard = loadImage("titleCard.png");
  col = new CollisionDetector();
  laser = new SoundFile(this, "laser.mp3");
  explosion = new SoundFile(this, "explosion.mp3");
  font = createFont("Arial", 50, true);
}

void draw() {
  lights();
  if (alive) {
    background(bg);
    fill(255, 255, 255);
    textSize(20);
    text("Score: " + sc.getScore(), 850, 30);
    spaceShip.render();
    if (tick%75 == 0) asteroids.add(new Asteroid(asteroidModel));
    for (int i = asteroids.size() - 1; i >= 0; i--) {
      if (col.checkLoss(asteroids.get(i), spaceShip)) {
        alive = false;
        asteroids.remove(i); 
        finalScore = sc.getScore();
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
          if (col.checkCollision(bullet, asteroid)) {
            explosion.play();
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
      text("Final Score: " + finalScore, 350, 800);
      fill(255,255,255);
    }
  }
}

void mouseClicked(){
  if (firstRun) firstRun = false;
  if (!alive) {
    alive = true;
  } else {
    laser.play();
    bullets.add(new Bullet(spaceShip));
  }
}

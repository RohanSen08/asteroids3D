float rotationY = 0;
SpaceShip spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
Asteroid asteroid;
ArrayList<Asteroid> asteroids = new ArrayList<>();
int tick;
ArrayList<Bullet> alan = new ArrayList<>();
PShape asteroidModel; 
boolean alive = false;
PImage titleCard;

void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
  asteroidModel = loadShape("asteroid.obj"); 
  tick = 0;
  titleCard = loadImage("titleCard.png");
}

void draw() {
  if (alive) {
    background(bg);
    spaceShip.render();
    if (tick%75 == 0) asteroids.add(new Asteroid(asteroidModel));
    for (int i = asteroids.size() - 1; i >= 0; i--) {
      if (!asteroids.get(i).inBounds()) alive = false;
      else asteroids.get(i).render();
    }
    for (int i = alan.size() - 1; i >= 0; i--) { 
      if (alan.get(i).isAlive()){
        alan.get(i).update();
        alan.get(i).render();
      } else {
        alan.remove(i);
      }
    }
    tick++;
  } else {
    for (int i = alan.size() - 1; i >= 0; i--) { 
      alan.remove(i);
    }
    for (int i = asteroids.size() - 1; i >= 0; i--) {
     asteroids.remove(i);
    }
    background(255,255,255);
    image(titleCard, 50, 150);
  }
}

void mouseClicked(){
  if (!alive) {
    alive = true;
  } else {
    alan.add(new Bullet(spaceShip));
  }
}

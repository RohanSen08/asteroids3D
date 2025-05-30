float rotationY = 0;
SpaceShip spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
Asteroid asteroid;
void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
  asteroid = new Asteroid("space-shuttle.obj");
}

void draw() {
  background(bg);
  spaceShip.render();
  asteroid.render();
}

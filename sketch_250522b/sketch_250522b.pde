float rotationY = 0;
SpaceShip spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
Asteroid asteroid;
ArrayList<Asteroid> asteroids = new ArrayList<>();
int tick;
void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
  tick = 0;
}

void draw() {
  background(bg);
  spaceShip.render();
  if (tick%50 == 0) asteroids.add(new Asteroid("Pluto.obj"));
  for (int i = 0; i < asteroids.size(); i++) asteroids.get(i).render();
  tick++;
}

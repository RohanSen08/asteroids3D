float rotationY = 0;
SpaceShip spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new SpaceShip("Mesh_Wep_AR_FNF2000_Body.obj");
}

void draw() {
  background(bg);
  spaceShip.render();
}

void keyPressed(){
  /*if (keyCode == LEFT) spaceShip.rotate(0, -PI/8, 0);
  if (keyCode == RIGHT) spaceShip.rotate(0, PI/8, 0);
  if (keyCode == UP) spaceShip.rotate(-PI/8, 0, 0);
  if (keyCode == DOWN) spaceShip.rotate(PI/8, 0, 0);*/
  spaceShip.rotate(mouseX,0,0);
}

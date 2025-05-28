float rotationY = 0;
Model3D spaceShip;
float rotationX = PI;
float rotationZ = 0;
PImage bg;
void setup() {
  bg = loadImage("background.png");
  background(bg);
  size(1000, 1000, P3D);
  spaceShip = new Model3D("Mesh_Wep_AR_FNF2000_Body.obj");
}

void draw() {
  background(bg);
  spaceShip.render(500,575,700,rotationX, rotationY, rotationZ);
}

void keyPressed(){
  if (keyCode == LEFT) rotationY += PI/8;
  if (keyCode == RIGHT) rotationY -= PI/8;
  if (keyCode == UP) rotationX += PI/8;
  if (keyCode == DOWN) rotationX -= PI/8;
}

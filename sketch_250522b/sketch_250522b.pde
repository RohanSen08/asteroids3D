float rotationY = PI/2;
Model3D spaceShip;
float rotationX = 0;
void setup() {
  size(1000, 1000, P3D);
  spaceShip = new Model3D("space-shuttle.obj");
}

void draw() {
  background(100);
  spaceShip.render(500,575,700,rotationY);
}

void keyPressed(){
  if (keyCode == LEFT) rotationY += PI/8;
  if (keyCode == RIGHT) rotationY -= PI/8;
  if (keyCode == UP) rotationX += PI/8;
  if (keyCode == DOWN) rotationX -= PI/8;
}

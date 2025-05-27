float rotation = 0;
PShape spaceship;
PShape asteroid;
void setup() {
  size(1000, 1000, P3D);
  spaceship = loadShape("space-shuttle.obj");
  spaceship.scale(.4);
  asteroid = loadShape("asteroid.obj");
}

void draw() {
  background(100);
  translate(500, 500, 700);
  rotateX(3* PI/2);
  rotateZ(PI);
  rotateY(PI/2 + rotation);
  shape(spaceship);
  rotation += PI/64;
}

void keyPressed(){
  if (keyCode == LEFT) rotation += PI/8;
  if (keyCode == RIGHT) rotation -= PI/8;
}

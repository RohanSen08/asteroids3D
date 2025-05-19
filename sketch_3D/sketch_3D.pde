float rotation = 0;
PShape asteroid;
void setup() {
  size(1000, 1000, P3D);
  asteroid = loadShape("space-shuttle.obj");
}

void draw() {
  background(100);
  translate(500, 500, 700);
  rotateZ(PI);
  rotateY(PI/2 + rotation);
  shape(asteroid);
  rotation += PI/64;
}

void keyPressed(){
  if (keyCode == LEFT) rotation += PI/8;
  if (keyCode == RIGHT) rotation -= PI/8;
}

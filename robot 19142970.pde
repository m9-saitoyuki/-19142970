float base = 20;
float armL1 = 60;
float armW1 = 10;
float armL2 = 70; 
float armW2 = 10;
float armL3 = 30;
float armW3 = 10;
float angle1 = 0;
float angle2 = 0;
float angle3 = 0;
float dif = 1.0;
float rotX;
float rotY;
void setup() {
  size(800, 600, P3D);
  camera(width/2, height/2, (height/2)/tan(PI/4), width/2, height/2, 0, 0, 1, 0);
  noStroke();
}

void draw() {
  background(255);
  if (keyPressed) {
    if (key == 'a') {
      angle1 = angle1 + dif;
    }
    if (key == 'A') {
      angle1 = angle1 - dif;
    }
    if (key == 'b') {
      angle2 = angle2 + dif;
      if ((angle2>180)||(angle2<0)) {
        dif = -dif;
      }
    }
    if (key == 'B') {
      angle2 = angle2 - dif;
      if ((angle2<0)||(angle2>180)) {
        dif = -dif;
      }
    }
    if (key == 'c') {
      angle3 = angle3 + dif;
    }
    if (key == 'C') {
      angle3 = angle3 - dif;
    }
  }
  drawBase();
  drawArm1();
  drawArm2();
  drawArm3();
  drawTip();
}

void drawBase() {
  translate(width/2, height/2, 0);
  fill(0);
  rotateX(rotX);
  rotateY(-rotY);
  box(base);
}
void drawArm1() {
  rotateY(radians(angle1));
  translate(0, -base/2-armL1/2, 0);
  fill(230);
  box(armW1, armL1, armW1);
}
void drawArm2() {
  translate(0, -armL1/2-armW2/2, 0);
  rotateZ(-radians(angle2));
  translate(armL2/2-armW1/2, 0, 0);
  fill(140);
  box(armL2, armW1, armW1);
}
void drawArm3() {
  translate(armL2/2-armW3/2, 0, armW2/2+armL3/2);
  rotateZ(radians(angle3));
  fill(#F0C2C2);
  box(armW3, armW3, armL3);
}
void drawTip() {
  translate(-armW3/4, 0, armL3/2+10);
  fill(200);
  box(2, 5, 20);

  translate(armW3/2, 0, 0);
  box(2, 5, 20);
}

void mouseDragged() {
  rotY -= (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

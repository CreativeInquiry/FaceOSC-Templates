//
// move the mouse cursor with your face
// angle your face left, right, up, & down
//
// Hit escape to exit. If another app is becomes active, 
// use Alt-Tab/Cmd-Tab to select the running Processing Java app
// and kill it via the keyboard.
//
// derived from the FaceOSCReceiver demo

import oscP5.*;
OscP5 oscP5;

import java.awt.*;
Robot robot;

int found;
float speed = 100;
PVector poseOrientation;
PVector cursorPosition;

PFont font;

void setup() {
  size(screen.width / 6, screen.height / 6);
  frameRate(30);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  try {
    robot = new Robot();
  } catch (AWTException e) {
  }
  poseOrientation = new PVector();
  cursorPosition = new PVector();
}

void draw() {  
  background(255);
  if (found > 0) {
    cursorPosition.x += speed * poseOrientation.y;
    cursorPosition.y += speed * poseOrientation.x;
    cursorPosition.x = constrain(cursorPosition.x, 0, screen.width);
    cursorPosition.y = constrain(cursorPosition.y, 0, screen.height);
    robot.mouseMove((int) cursorPosition.x, (int) cursorPosition.y);
    ellipseMode(CENTER);
    noStroke();
    fill(0);
    ellipse(
      map(cursorPosition.x, 0, screen.width, 0, width),
      map(cursorPosition.y, 0, screen.height, 0, height),
      10, 10);
  }
}

public void found(int i) {
  found = i;
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}


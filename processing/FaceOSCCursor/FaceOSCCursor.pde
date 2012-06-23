// derived from the FaceOSCReceiver demo

import oscP5.*;
OscP5 oscP5;

import java.awt.*;
import java.awt.event.*;
Robot robot;

int found;
float speed = 100;
PVector poseOrientation;
PVector cursorPosition;

void setup() {
  // 1.5+ screen.width
  // 2.05 screenWidth
  // 2.06 displayWidth
  size(screen.width / 6, screen.height / 6);
  frameRate(30);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "mouthWidth", "/gesture/mouth/width");
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
  //println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

public void mouthWidth(float w) {
  println(w);
  if(w > 16) {
    robot.mousePress(InputEvent.BUTTON1_MASK);
  } else {
    robot.mouseRelease(InputEvent.BUTTON1_MASK);
  }
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}


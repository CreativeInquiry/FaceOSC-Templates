//
// a bar graph for overall smiliness
//
// derived from the FaceOSCReceiver demo

import oscP5.*;
OscP5 oscP5;

SmartRobot robot;

int found;
float smileThreshold = 16;
float mouthWidth, previousMouthWidth;

PFont font;

void setup() {
  size(400, 64);
  frameRate(30);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  try {
    robot = new SmartRobot();
  } catch (AWTException e) {
  }
  font = createFont("Helvetica", 64);
  textFont(font);
  textAlign(LEFT, TOP);
}

void draw() {  
  background(255);
  if (found > 0) {
    noStroke();
    fill(mouthWidth > smileThreshold ? color(255, 0, 0) : 0);
    float drawWidth = map(mouthWidth, 10, 25, 0, width);
    rect(0, 0, drawWidth, 64);
    text(nf(mouthWidth, 0, 1), drawWidth + 10, 0);
    if (previousMouthWidth < smileThreshold && mouthWidth > smileThreshold) {
      robot.type(":)\n");
    }
    previousMouthWidth = mouthWidth;
  }
}

public void found(int i) {
  found = i;
}

public void mouthWidthReceived(float w) {
  mouthWidth = w;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}


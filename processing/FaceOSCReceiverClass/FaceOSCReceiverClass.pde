//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// this example includes a class to abstract the Face data
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
// adapted from from Greg Borenstein's 2011 example
// http://www.gregborenstein.com/
// https://gist.github.com/1603230
//
import oscP5.*;
OscP5 oscP5;

// our FaceOSC tracked face dat
Face face = new Face();

void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
}

void draw() {  
  background(255);
  stroke(0);
  
  if(face.found > 0) {
    translate(face.posePosition.x, face.posePosition.y);
    scale(face.poseScale);
    noFill();
    ellipse(-20, face.eyeLeft * -9, 20, 7);
    ellipse(20, face.eyeRight * -9, 20, 7);
    ellipse(0, 20, face.mouthWidth* 3, face.mouthHeight * 3);
    ellipse(-5, face.nostrils * -1, 7, 3);
    ellipse(5, face.nostrils * -1, 7, 3);
    rectMode(CENTER);
    fill(0);
    rect(-20, face.eyebrowLeft * -5, 25, 5);
    rect(20, face.eyebrowRight * -5, 25, 5);
  
    print(face.toString());
  }
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}

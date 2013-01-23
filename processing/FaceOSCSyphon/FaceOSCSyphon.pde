//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// This example is similar to FaceOSCReceiverClass and utilizes Syphon to grab
// the camera stream from FaceOSC+Syphon. Syphon is only available for Mac OSX.
//
// You will need Processing 2.0, a Mac, and
// - FaceOSC+Syphon: https://github.com/kylemcdonald/ofxFaceTracker/downloads
// - Syphon for Processing: http://code.google.com/p/syphon-implementations
//
// 2013 Dan Wilcox danomatika.com
// for the IACD Spring 2013 class at the CMU School of Art
//
// adapted from from the Syphon ReceiveFrames example
//

import codeanticode.syphon.*;
import oscP5.*;

// for Syphon
PGraphics canvas;
SyphonClient client;

// for OSC
OscP5 oscP5;

// our FaceOSC tracked face data
Face face = new Face();

public void setup() {
  size(640, 480, P3D);
    
  println("Available Syphon servers:");
  println(SyphonClient.listServers());
    
  // create syhpon client to receive frames from FaceOSC
  client = new SyphonClient(this, "FaceOSC");
  
  // stat listening on OSC
  oscP5 = new OscP5(this, 8338);
}

public void draw() {    
  background(255);
  
  // grab syphon frame
  if(client.available()) {
    canvas = client.getGraphics(canvas);
    image(canvas, 0, 0, width, height);    
  }
  
  // draw face
  if(face.found > 0) {
    stroke(255, 100, 100);
    strokeWeight(4);
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
  
    //print(face.toString());
  }
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}

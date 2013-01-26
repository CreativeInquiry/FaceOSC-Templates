//
// Can you pass the a face polygraph?
//
// copied and modified from the FaceOSCReceiverClass

import oscP5.*;
OscP5 oscP5;

// our FaceOSC tracked face dat
Face face = new Face();
PFont font;
ArrayList<Graph> graphs;
int totalGraphs;

void setup() {
  size(640, 480);
  frameRate(30);
  
  font = createFont("Helvetica", 10, false);
  textFont(font);

  oscP5 = new OscP5(this, 8338);
  
  totalGraphs = 12;
  reset();
}

void reset() {
  graphs = new ArrayList<Graph>();
    graphs.add(new Graph("poseScale"));
    graphs.add(new Graph("mouthWidth"));
    graphs.add(new Graph("mouthHeight"));
    graphs.add(new Graph("eyeLeft/Right"));
    graphs.add(new Graph("eyebrowLeft/Right"));
    graphs.add(new Graph("jaw"));
    graphs.add(new Graph("nostrils"));
    graphs.add(new Graph("posePosition.x"));
    graphs.add(new Graph("posePosition.y"));
    graphs.add(new Graph("poseOrientation.x"));
    graphs.add(new Graph("poseOrientation.y"));
    graphs.add(new Graph("poseOrientation.z"));
}

void draw() {
  if(face.found > 0) {
    graphs.get(0).add(face.poseScale);
    graphs.get(1).add(face.mouthWidth);
    graphs.get(2).add(face.mouthHeight);
    graphs.get(3).add(face.eyeLeft + face.eyeRight);
    graphs.get(4).add(face.eyebrowLeft + face.eyebrowRight);
    graphs.get(5).add(face.jaw);
    graphs.get(6).add(face.nostrils);
    graphs.get(7).add(face.posePosition.x);
    graphs.get(8).add(face.posePosition.y);
    graphs.get(9).add(face.poseOrientation.x);
    graphs.get(10).add(face.poseOrientation.y);
    graphs.get(11).add(face.poseOrientation.z);
  }
  
  background(255);  
  for(int i = 0; i < totalGraphs; i++) {
    graphs.get(i).draw(width, height / totalGraphs);
    translate(0, height / totalGraphs);
  }
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}

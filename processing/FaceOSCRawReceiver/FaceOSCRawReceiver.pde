// Processing 3.0x template for receiving raw points from
// Kyle McDonald's FaceOSC v.1.1 
// https://github.com/kylemcdonald/ofxFaceTracker
//
// Adapted by Kaleb Crawford and Golan Levin, 2016-7, after:
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
// adapted from from Greg Borenstein's 2011 example
// https://gist.github.com/1603230

import oscP5.*;
OscP5 oscP5;
int found;
float[] rawArray;
int highlighted; //which point is selected

//--------------------------------------------
void setup() {
  size(640, 480);
  frameRate(30);
  
  rawArray = new float[132]; 
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "rawData", "/raw");
}

//--------------------------------------------
void draw() {  
  background(255);
  noStroke();

  if (found != 0) {
    drawFacePoints(); 
    drawFacePolygons();
  }

  fill(0); 
  text("Be certain FaceOSC is sending 'raw' data!", 12, 20); 
  text("Use Left and Right arrow keys to cycle points", 12, 40);
  text("current index = [" + highlighted + "," + (highlighted + 1) + "]", 12, 60);
}

//--------------------------------------------
void drawFacePoints() {
  int nData = rawArray.length;
  for (int val=0; val<nData; val+=2) {
    if (val == highlighted) { 
      fill(255, 0, 0);
      ellipse(rawArray[val], rawArray[val+1], 11, 11);
    } else {
      fill(100);
      ellipse(rawArray[val], rawArray[val+1], 8, 8);
    }
  }
}

//--------------------------------------------
void drawFacePolygons() {
  noFill(); 
  stroke(100); 
 
  // Face outline
  beginShape();
  for (int i=0; i<34; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  for (int i=52; i>32; i-=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape(CLOSE);
  
  // Eyes
  beginShape();
  for (int i=72; i<84; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape(CLOSE);
  beginShape();
  for (int i=84; i<96; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape(CLOSE);
  
  // Upper lip
  beginShape();
  for (int i=96; i<110; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  for (int i=124; i>118; i-=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape(CLOSE);
  
  // Lower lip
  beginShape();
  for (int i=108; i<120; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  vertex(rawArray[96], rawArray[97]);
  for (int i=130; i>124; i-=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape(CLOSE);
  
  // Nose bridge
  beginShape();
  for (int i=54; i<62; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape();
  
  // Nose bottom
  beginShape();
  for (int i=62; i<72; i+=2) {
    vertex(rawArray[i], rawArray[i+1]);
  }
  endShape();
}


//--------------------------------------------
public void found(int i) {
  found = i;
}
public void rawData(float[] raw) {
  rawArray = raw; // stash data in array
}

//--------------------------------------------
void keyPressed() {
  int len = rawArray.length; 
  if (keyCode == RIGHT) {
    highlighted = (highlighted + 2) % len;
  }
  if (keyCode == LEFT) {
    highlighted = (highlighted - 2 + len) % len;
  }
}
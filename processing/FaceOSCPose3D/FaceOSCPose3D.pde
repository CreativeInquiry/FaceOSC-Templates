// 3D Pose receiver for FaceOSC 
// Golan Levin, 2012-17

import oscP5.*;
OscP5 oscP5;
 
int     found; // global variable, indicates if a face is found
PVector poseOrientation = new PVector(); // stores an (x,y,z)
 
//----------------------------------
void setup() {
  size(640, 480, OPENGL);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
}
 
//----------------------------------
void draw() {
  background (180);
  strokeWeight (3); 
  noFill();
 
  if (found != 0) {
    pushMatrix(); 
    translate (width/2, height/2, 0);
    rotateY (0 - poseOrientation.y); 
    rotateX (0 - poseOrientation.x); 
    rotateZ (    poseOrientation.z); 
    box (200, 250, 200); 
    popMatrix();
  }
}
 
//----------------------------------
// Event handlers for receiving FaceOSC data
public void found (int i) { found = i; }
public void poseOrientation(float x, float y, float z) {
  poseOrientation.set(x, y, z);
}
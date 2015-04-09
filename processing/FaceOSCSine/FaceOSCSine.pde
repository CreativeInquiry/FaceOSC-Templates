// derived from the FaceOSCReceiver demo and minim's SineWaveSignal example

import oscP5.*;
OscP5 oscP5;

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioOutput out;
SineWave sine;

PFont font;

void setup() {
  size(512, 200);
  frameRate(30);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "faceScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(100);
  out.addSignal(sine);
}

void draw() {  
  background(255);
  stroke(0);
  for(int i = 0; i < out.bufferSize() - 1; i++) {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
}

public void faceScale(float x) {
  float freq = map(x, 4, 6, 60, 1500);
  sine.setFreq(freq);
}

public void posePosition(float x, float y) {
  float pan = map(x, 0, 640, -1, +1);
  sine.setPan(pan);
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}

void stop() {
  out.close();
  minim.stop();
  super.stop();
}

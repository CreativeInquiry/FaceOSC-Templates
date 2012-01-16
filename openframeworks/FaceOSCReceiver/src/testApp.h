//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2012 Dan Wilcox danomatika.com
// for the IACD class at the CMU School of Art
//
// adapted from Greg Borenstein's Processing example
// https://gist.github.com/1603230
//
#pragma once

#include "ofMain.h"
#include "ofxOsc.h"

#include "Face.h"

class testApp : public ofBaseApp {
	
    public:

		void setup();
		void update();
		void draw();
		
		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);

		ofxOscReceiver	receiver;
        Face face;
};

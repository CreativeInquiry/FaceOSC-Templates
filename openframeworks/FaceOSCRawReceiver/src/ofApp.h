//
// a template for receiving raw face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2017 Dan Wilcox danomatika.com
// for the EDP Creative Coding class @ the University of Denver
//
// adapted from Golan Levin's FaceOSCRawReceiver Processing template
//
#pragma once

#include "ofMain.h"
#include "ofxOsc.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
	
		void drawFacePoints();
		void drawFacePolygons();
	
		ofxOscReceiver receiver;
	
		bool found = false;
		vector<ofVec2f> points;
	
		int highlighted = 0; // which point is selected
};

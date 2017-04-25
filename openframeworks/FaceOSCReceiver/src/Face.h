//
// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2012 Dan Wilcox danomatika.com
// for the IACD class at the CMU School of Art
//
#pragma once

#include "ofMain.h"

class ofxOscMessage;

// a single tracked face from FaceOSC
class Face {

	public:

		int found = 0;
		
		// pose
		float poseScale = 0;
		ofVec2f posePosition;       // FaceOSC win size: 640x680
		ofVec3f poseOrientation;
		
		// gesture
		float mouthWidth = 0;
		float mouthHeight = 0;
		float eyeLeft = 0;
		float eyeRight = 0;
		float eyebrowLeft = 0;
		float eyebrowRight = 0;
		float jaw = 0;
		float nostrils = 0;
		
		Face() {}
			
		// parse an OSC message from FaceOSC
		// returns true if a message was handled
		bool parseOSC(ofxOscMessage& m);
		
		// get the current face values as a string (includes end lines)
		string toString();
};

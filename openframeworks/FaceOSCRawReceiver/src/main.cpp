//
// a template for receiving raw face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2017 Dan Wilcox danomatika.com
// for the EDP Creative Coding class @ the University of Denver
//
// adapted from Golan Levin's FaceOSCRawReceiver Processing template
//
#include "ofMain.h"
#include "ofApp.h"

int main(){
	ofSetupOpenGL(640, 480, OF_WINDOW);
	ofRunApp(new ofApp());
}

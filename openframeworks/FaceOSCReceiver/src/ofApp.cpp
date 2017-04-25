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
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetVerticalSync(true);
	ofSetFrameRate(60);

	// FaceOSC sends to port 8338 by default
	receiver.setup(8338);

	ofBackground(255);
}

//--------------------------------------------------------------
void ofApp::update() {

	// check for waiting osc messages
	while(receiver.hasWaitingMessages()) {
		
		// get the next message
		ofxOscMessage m;
		receiver.getNextMessage(m);
		
		// load face from any FaceOSC messages
		face.parseOSC(m);
	}
	
	// found face?
	if(face.found > 0) {
		cout << "---------" << endl << face.toString();
	}
}


//--------------------------------------------------------------
void ofApp::draw() {

	// draw a face
	if(face.found > 0) {
		ofPushMatrix();
			ofTranslate(face.posePosition);
			ofScale(face.poseScale, face.poseScale);
			
			ofSetColor(0);
			ofNoFill();
			ofDrawEllipse(-20, face.eyeLeft * -9, 20, 7);
			ofDrawEllipse(20, face.eyeRight * -9, 20, 7);
			ofDrawEllipse(0, 20, face.mouthWidth * 3, face.mouthHeight * 3);
			ofDrawEllipse(-5, face.nostrils * -1, 7, 3);
			ofDrawEllipse(5, face.nostrils * -1, 7, 3);
			
			ofSetRectMode(OF_RECTMODE_CENTER);
			ofFill();
			ofDrawRectangle(-20, face.eyebrowLeft * -5, 25, 5);
			ofDrawRectangle(20, face.eyebrowRight * -5, 25, 5);
			ofSetRectMode(OF_RECTMODE_CORNER);
		ofPopMatrix();
	}

}

//--------------------------------------------------------------
void ofApp::keyPressed (int key) {

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key) {

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button) {

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button) {

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h) {

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg) {

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo) { 

}

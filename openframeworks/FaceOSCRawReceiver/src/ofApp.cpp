//
// a template for receiving raw face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2017 Dan Wilcox danomatika.com
// for the EDP Creative Coding class @ the University of Denver
//
// adapted from Golan Levin's FaceOSCRawReceiver Processing template
//
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofSetVerticalSync(true);
	ofSetFrameRate(60);
	
	// FaceOSC sends to port 8338 by default
	receiver.setup(8338);
	
	// FaceOSC raw message is 66 xy pairs
	for(int i = 0; i < 66; ++i) {
		points.push_back(ofVec2f());
	}

	ofBackground(255);
}

//--------------------------------------------------------------
void ofApp::update(){

	// check for waiting osc messages
	while(receiver.hasWaitingMessages()) {
	
		// get the next message
		ofxOscMessage m;
		receiver.getNextMessage(m);
		
		// found face?
		if(m.getAddress() == "/found") {
			found = (bool) m.getArgAsInt32(0);
		}
		
		// raw mesh points: 132 floats for 66 xy pairs
		else if(m.getAddress() == "/raw" && m.getNumArgs() == 132) {
			int p = 0;
			for(int i = 0; i < 132; i = i+2) {
				points[p].x = m.getArgAsFloat(i);
				points[p].y = m.getArgAsFloat(i+1);
				p++;
			}
		}
	}
}

//--------------------------------------------------------------
void ofApp::draw(){

	if(found) {
		drawFacePoints();
		drawFacePolygons();
	}

	ofFill();
	ofSetColor(0);
	ofDrawBitmapString("Be certain FaceOSC is sending 'raw' data!", 12, 20);
	ofDrawBitmapString("Use Left and Right arrow keys to cycle points", 12, 40);
	ofDrawBitmapString("current index = [" + ofToString(highlighted) + "]", 12, 60);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	if(key == OF_KEY_RIGHT) {
		highlighted++;
		if(highlighted >= points.size()) {
			highlighted = 0;
		}
	}
	else if(key == OF_KEY_LEFT) {
		highlighted--;
		if(highlighted < 0) {
			highlighted = points.size()-1;
		}
	}
}

//--------------------------------------------------------------
void ofApp::drawFacePoints() {
	ofFill();
	for(int i = 0; i < points.size(); i++) {
		if(i == highlighted) {
			ofSetColor(255, 0, 0);
			ofDrawCircle(points[i], 11);
		} else {
			ofSetColor(100);
			ofDrawCircle(points[i], 8);
		}
	}
}

//--------------------------------------------------------------
void ofApp::drawFacePolygons() {
	ofNoFill();
	ofSetColor(100);

	// Face outline
	ofBeginShape();
	for(int i = 0; i < 17; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	for(int i = 26; i > 16; i--) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape(OF_CLOSE);

	// Eyes
	ofBeginShape();
	for(int i = 36; i < 42; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape(OF_CLOSE);
	ofBeginShape();
	for(int i = 42; i < 48; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape(OF_CLOSE);

	// Upper lip
	ofBeginShape();
	for(int i = 48; i < 55; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	for(int i = 62; i > 59; i--) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape(OF_CLOSE);

	// Lower lip
	ofBeginShape();
	for(int i = 54; i < 60; i+=2) {
		ofVertex(points[i].x, points[i].y);
	}
		ofVertex(points[48].x, points[48].y);
	for(int i = 65; i > 62; i--) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape(OF_CLOSE);

	// Nose bridge
	ofBeginShape();
	for(int i = 27; i < 31; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape();

	// Nose bottom
	ofBeginShape();
	for(int i = 31; i < 36; i++) {
		ofVertex(points[i].x, points[i].y);
	}
	ofEndShape();
}

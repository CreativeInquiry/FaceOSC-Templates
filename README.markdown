Face Osc Templates
------------------

2012 [Dan Wilcox](http://danomatika.com), et al.
for the Spring 2012 IACD class at the CMU School of Art

Templates for receiving face tracking [Open Sound Control](http://opensoundcontrol.org/introduction-osc) messages from Kyle McDonald's [FaceOSC](https://github.com/kylemcdonald/ofxFaceTracker/downloads) wrapper around Jason Saragih’s [FaceTracker](http://web.mac.com/jsaragih/FaceTracker/FaceTracker.html)

Download [FaceOSC](https://github.com/kylemcdonald/ofxFaceTracker/downloads) and get started with a template project for one of the following creative coding environments:  

* [Processing](http://processing.org/)
	* requires the [OscP5 library](http://www.sojamo.de/libraries/oscP5/)
* [OpenFrameworks](http://www.openframeworks.cc/)
	* currently requires OF version 007
	* make sure to copy the FaceOSCReceiver folder into the openframeworks/apps/myApps folder (it must be 3 levels deep)
* [Max](http://cycling74.com/)
	* requires the [CNMAT Everything for Max package](http://cnmat.berkeley.edu/downloads) for the (OSC-route) object
* [Pure Data Extended](http://puredata.info/)
	* requires Pd-Extended for the [OSCroute] and [udpreceive] objects (part of the mrpeach external included in Pd-Extended)

Make sure FaceOSC is running and a face is detected (face mesh is drawn).

Further info:

* FaceOSC uses port 8338 by default for OSC communication
* the FaceOSC window size is 640 x 480
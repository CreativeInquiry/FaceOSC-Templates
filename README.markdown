## FaceOSC Receiver Templates

2012-2017 by [Dan Wilcox](http://danomatika.com), et al.

This repository contains templates for receiving face tracking OSC ([Open Sound Control](http://opensoundcontrol.org/introduction-osc)) messages from Kyle McDonald's [FaceOSC](https://github.com/kylemcdonald/ofxFaceTracker/downloads) wrapper around Jason Saragih’s [FaceTracker](http://web.mac.com/jsaragih/FaceTracker/FaceTracker.html). Templates are provided for a number of popular arts-engineering toolkits, including Processing, openFrameworks, Max/MSP, Pure Data (pd), and SuperCollider. 

Created for Prof. Golan Levin's [Spring 2012 IACD class](http://golancourses.net/2012spring/) at the [CMU School of Art](http://www.cmu.edu/art/).

--

### Instructions

Download [FaceOSC](https://github.com/kylemcdonald/ofxFaceTracker/releases) and get started with a template project for one of the following creative coding environments:  

* [Processing](http://processing.org/)
	* Requires the [OscP5 library](http://www.sojamo.de/libraries/oscP5/)
	* Known to be compatible with Processing 3.0.
* [OpenFrameworks](http://www.openframeworks.cc/)
	* Currently requires OF version 007+
	* Make sure to copy the FaceOSCReceiver folder into the openframeworks/apps/myApps folder (it must be 3 levels deep)
* [Max/MSP](http://cycling74.com/)
	* requires the [CNMAT Everything for Max package](http://cnmat.berkeley.edu/downloads) for the (OSC-route) object
* [Pure Data Extended](http://puredata.info/)
	* requires *Pd-Extended* for the [OSCroute] and [udpreceive] objects (part of the *mrpeach* external included in Pd-Extended)
* [SuperCollider](http://supercollider.github.io/)

Make sure FaceOSC is running and a face is detected (i.e., a face mesh is drawn). The face detection may run very slowly (0.5 fps) while initially searching for a face. It speeds up to 30-60fps once one is found. For best results, make sure your face is evenly lit.

**Further info:**

* FaceOSC uses port 8338 by default for OSC communication.
* The FaceOSC window size is 640 x 480 pixels.

-- 

### Note: OpenFrameworks Version

If you are using an older version (007, ...) of OpenFrameworks then you'll want to use a git tag of this repo for that version. You can select the tag in the Github "Current Branch" menu or clone and check it out using git.

For example, the following commands will clone  and switch to the OF 007 tagged version:
<pre>
git clone git://github.com/CreativeInquiry/FaceOSC-Templates.git
cd FaceOSC-Templates
git checkout of-007
</pre>

The current master branch should work with the current OF and a tag will only be created when there is an appreciable change in OF, so there may not be a tag for *every* version of OF. 

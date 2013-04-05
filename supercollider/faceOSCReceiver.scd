// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker/downloads
//
// 2013 Arthur Carabott arthurcarabott.com
//

(
//GUI for value posting
~faceKeys = [
	'/found',
	'/gesture/eye/left',
	'/gesture/eye/right',
	'/gesture/eyebrow/left',
	'/gesture/eyebrow/right',
	'/gesture/jaw',
	'/gesture/mouth/height',
	'/gesture/mouth/width',
	'/gesture/nostrils',
	'/pose/orientation',
	'/pose/position',
	'/pose/scale',
	'/raw'
];

~facePost = ();
~faceKeys.do {|key, i|
	~facePost[key] = false;
	OSCdef((key ++ "_post").asSymbol, {|msg, time, addr, recvPort|
		if(~facePost[key]) {
			msg.postln;
		};
	}, key);
};

~facePostWindow = Window("FaceOSC", Rect(150, 400, 210, 580)).front;
~facePostWindow.view.addFlowLayout;
~facePost.keys.asArray.sort.do {|item, i|
	Button(~facePostWindow, 200@40)
	.states_([
		[item.asString, Color.black, Color.white],
		[item.asString, Color.black, Color.green]
	])
	.action_({|button|
		~facePost[item] = ~facePost[item].not;
	});
};
)

//OSCdefs for your actions
OSCdef('/found', {|msg, time, addr, recvPort|

}, '/found');

OSCdef('/gesture/eye/left', {|msg, time, addr, recvPort|

}, '/gesture/eye/left');

OSCdef('/gesture/eye/right', {|msg, time, addr, recvPort|

}, '/gesture/eye/right');

OSCdef('/gesture/eyebrow/left', {|msg, time, addr, recvPort|

}, '/gesture/eyebrow/left');

OSCdef('/gesture/eyebrow/right', {|msg, time, addr, recvPort|

}, '/gesture/eyebrow/right');

OSCdef('/gesture/jaw', {|msg, time, addr, recvPort|

}, '/gesture/jaw');

OSCdef('/gesture/mouth/height', {|msg, time, addr, recvPort|

}, '/gesture/mouth/height');

OSCdef('/gesture/mouth/width', {|msg, time, addr, recvPort|

}, '/gesture/mouth/width');

OSCdef('/gesture/nostrils', {|msg, time, addr, recvPort|

}, '/gesture/nostrils');

OSCdef('/pose/orientation', {|msg, time, addr, recvPort|

}, '/pose/orientation');

OSCdef('/pose/position', {|msg, time, addr, recvPort|

}, '/pose/position');

OSCdef('/pose/scale', {|msg, time, addr, recvPort|

}, '/pose/scale');

OSCdef('/raw', {|msg, time, addr, recvPort|

}, '/raw');
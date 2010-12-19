Array.prototype.insert = function(object) {
	this[this.length] = object;
	return this;
}

Array.prototype.remove = function(object) {
	k = this.indexOf(object);
	while(k != -1) {
		this.splice(k, k+1);
		k = this.indexOf(object);		
	}
	
	return this;
}

// Mobile Safari 
document.addEventListener("touchend", touchEnd, false);

var activeTouches = [];
var touchesMoved = 0;
function touchStart(event) {
	event.preventDefault();
	
	for(touch in event.touches)
		activeTouches.insert(touch);
}

function touchMove(event) {
	touchesMoved += event.changedTouches.length;
}

function touchEnd(event) {
	event.preventDefault();
	if(touchesMoved == 0)
		$(event.target).click();
	
	touchesMoved -= event.changedTouches.length;
}
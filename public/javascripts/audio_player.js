function updateVolume(event) {
	if(event.target.currentTime <= 3.0) {
		event.target.volume = event.target.currentTime / 3.0;
	} else if(event.target.duration - event.target.currentTime <= 3.0) {
		event.target.volume = (event.target.duration - event.target.currentTime) / 3.0;
	} else {
		event.target.volume = 1.0;
	}
}
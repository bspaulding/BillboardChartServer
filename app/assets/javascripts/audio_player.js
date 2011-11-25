$(document).ready(function() {
	// Audio Preview Animation.
	$(".icon_container").click(function(eventObject) {
		icon_id = $(eventObject.currentTarget).attr('id');
		icon_div = $(eventObject.currentTarget).children();
		if(icon_div.css('-webkit-transform') != 'none') 
			icon_div.css('-webkit-transform', '');
		else
			icon_div.css('-webkit-transform', 'rotateY(180deg)');
		
		audio_id = icon_id.substring(0, icon_id.length - 4) + "audio";
		audio_element = $('#' + audio_id)[0];
		if(audio_element.paused) {
			if(audio_element.currentTime == 0.0)
				audio_element.volume = 0.0;
			audio_element.play();
			audio_element.addEventListener('ended', function(event) {
				icon_id = $(event.target).attr('id').substring(0, icon_id.length - 4) + "icon";
				icon_div = $('#' + icon_id).children('.icon');
				icon_div.css('-webkit-transform', '');
			});
			audio_element.addEventListener('timeupdate', updateVolume);
		} else {
			audio_element.pause();
			audio_element.removeEventListener('ended');
		}
	});
});

function updateVolume(event) {
	if(event.target.currentTime <= 3.0) {
		event.target.volume = event.target.currentTime / 3.0;
	} else if(event.target.duration - event.target.currentTime <= 3.0) {
		event.target.volume = (event.target.duration - event.target.currentTime) / 3.0;
	} else {
		event.target.volume = 1.0;
	}
}
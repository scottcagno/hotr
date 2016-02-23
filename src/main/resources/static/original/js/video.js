$(document).ready(function() {
	var play = false;

	function watched() {
		$.ajax({
			type: "post",
			url: "/topic",
			data: $('form[id="watched"]').serializeArray()
		});
	}
    
    var iframe = $('iframe[id="player"]')[0];
    var player = $f(iframe);

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
		player.addEvent('play', function() {
			if (!play) {
				watched();
				play = true;
			}
		})
    });

});

$(document).ready(function() {
	function watched() {
		$.ajax({
			type: "post",
			url: "/topic",
			data: $('form[id="watched"]').serializeArray(),
		}).done(function() {
			console.log('POST Sent');
		});
	};
    
    var iframe = $('iframe[id="player"]')[0];
    var player = $f(iframe);

    // When the player is ready, add listeners for pause, finish, and playProgress
    player.addEvent('ready', function() {
        player.addEvent('finish', watched);
    });

});

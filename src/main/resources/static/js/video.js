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

	$('img[id="video"]').click(function() {
		console.log('Video Started');
		$('div[id="videoDiv"]').html(iframe);
		setTimeout(function() {
			watched();
		}, 30000);
	});
});

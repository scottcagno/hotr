// carousel	resizing
$(window).resize(function() {
	var winWidth = $(window).width();
	var winHeight = $(window).height();
	var carousel = $(".carousel-inner div.item img");
	if (winWidth >= 900 && carousel.height() <= winHeight) {
		console.log("RESIZING: " + carousel.height() + "px X " + carousel.width() + "px");
		$(carousel).css("width", winWidth);
	}
});

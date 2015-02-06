$(document).ready(function(){

	// smooth scroller
    $('a[href^="#"]').on('click',function (e) {
        e.preventDefault();
        var target = this.hash, $target = $(target);
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 900, 'swing', function () {
            window.location.hash = target;
        });
    });

    // auto collapse navbar for mobile devices
    if (window.outerWidth < 768) {
        $('.nav li a').on('click', function(){
            $('.navbar-collapse').collapse('hide');
        });
    }

});

/*var windowSize = {
    width: window.innerWidth || document.body.clientWidth,
    height: window.innerHeight || document.body.clientHeight
};
$(".carousel-inner").width(windowSize.width);

if ($(".carousel-inner").height() > windowSize.height) {
    var h = windowSize.height - 50;
    var w = (1500 * h) / 845;
    $(".carousel-inner").width(w);
}
$(window).resize(function() {

    var windowSize = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    
    $(".carousel-inner").width(windowSize.width);
    
    if ($(".carousel-inner").height() > windowSize.height) {
        var h = windowSize.height - 50;
        var w = (1500 * h) / 845;
        $(".carousel-inner").width(w);
    }
});*/


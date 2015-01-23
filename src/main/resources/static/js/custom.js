// auto collapse navbar for mobile devices
if (window.outerWidth < 768) {
    $('.nav li a').on('click', function(){
        $('.navbar-collapse').collapse('hide');
    });
}

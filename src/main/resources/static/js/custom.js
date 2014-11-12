// auto collapse navbar for mobile devices
if (window.outerWidth < 768) {
    $('.nav li a').on('click', function(){
        $('.navbar-collapse').collapse('hide');
    });
}

 $(document).ready(function() {
     // toggle safe delete modal popup
     $('a[data-toggle="modal"]').click(function(){
         var id = $(this).data('id');
         var form = $('.modal #delete');
         form.html(form.html().replace('{id}',id));
     });
 });

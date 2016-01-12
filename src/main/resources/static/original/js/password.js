
$(document).ready(function() {

    // toggle show password javascript
    $('button[id="toggle-pass"]').on('click', function(){
    	var icon = $('button[id="toggle-pass"] > i');
    	var input = $('input[id="toggle-pass"]');
    	if(icon.hasClass('fa-eye-slash')) {
    		icon.removeClass('fa-eye-slash').addClass('fa-eye');
    		input.attr('type', "text");
    	} else {
    		icon.removeClass('fa-eye').addClass('fa-eye-slash');
			input.attr('type', "password");
    	}
    });

});


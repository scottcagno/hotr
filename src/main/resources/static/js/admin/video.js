$(document).ready(function() {
    $('select[id="categorySelect"]').change(function() {
    	$('input[id="category"]').val($('select[id="categorySelect"]').val());
    	$('div[id="categoryInput"]').attr('hidden', 'hidden');
    	if ($('select[id="categorySelect"]').val() != '') {
    		$('div[id="categorySelectDiv"]').removeClass('has-error');
    	}
    });

    $('a[id="addCategory"]').click(function() {
    	$('div[id="categoryInput"]').removeAttr('hidden');
    	$('input[id="category"]').val('');
    	$('select[id="categorySelect"]').val('');
    });

    $('button[id="save"]').click(function() {
    	if ($('input[id="category"]').val() == '') {
    		$('div[id="categorySelectDiv"]').addClass('has-error');
    		$('select[id="categorySelect"]').focus();
    	} else {
    		$('form[id="videoForm"]').submit();
    	}
    });

    $(function(){
    	// thumbnail request confirm logic
    	$('a[id="thumb"]').on('click', function(){
    		var thumbRequestConfirm = $('div[id="thumb-request-confirm"]');
    		thumbRequestConfirm.removeClass('fadeOut').addClass('fadeIn');
    		thumbRequestConfirm.removeClass('hide');
    	});
    	// thumbnail request confirm cancel/close logic
    	$('div form button[id="thumb-request-confirm-cancel"]').on('click', function(){
    		var thumbRequestConfirm = $('div[id="thumb-request-confirm"]');
    		thumbRequestConfirm.removeClass('fadeIn').addClass('fadeOut');
    		thumbRequestConfirm.addClass('hide');
    	});
    });
});
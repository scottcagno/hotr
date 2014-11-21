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
    		var deleteItemConfirm = $('div[id="thumb-request-confirm"]');
    		deleteItemConfirm.removeClass('fadeOut').addClass('fadeIn');
    		deleteItemConfirm.removeClass('hide');
    	});
    	// thumbnail request confirm cancel/close logic
    	$('div form button[id="delete-item-confirm-cancel"]').on('click', function(){
    		var deleteItemConfirm = $('div[id="thumb-request-confirm"]');
    		deleteItemConfirm.removeClass('fadeIn').addClass('fadeOut');
    		deleteItemConfirm.addClass('hide');
    	});
    });
});
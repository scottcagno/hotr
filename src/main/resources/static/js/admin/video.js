$(document).ready(function() {

    $('select[id="seriesSelect"]').change(function() {
    	if ($('select[id=seriesSelect]').val() == 'add') {
    		$('div[id="seriesInput"]').removeAttr('hidden');
			$('input[id="series"]').val('');
			$('select[id="seriesSelect"]').val('add');
    	} else {
    		$('input[id="series"]').val($('select[id="seriesSelect"]').val());
    		$('div[id="seriesInput"]').attr('hidden', 'hidden');
    	}
    });

    $('button[id="save"]').click(function() {
		$('form[id="videoForm"]').submit();
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
$(document).ready(function () {
    // set delete action and add option button on load if exist
    window.onload = function() {
    	if ($('a[name="removeOption"]')) {
    		$('a[name="removeOption"]').click(function() {
    			$('div[id="'+$(this).attr('id')+'"]').remove();
    		});
    	}
    	if ($('a[id="addOptionButton"]')) {
    		$('a[id="addOptionButton"]').click(function() {
    			addOption();
    		});
    	}
    }
});
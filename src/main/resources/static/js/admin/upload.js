$(document).ready(function () {
    function updateFileInfo() {
    	var filepath = this.value;
    	var m = filepath.match(/([^\/\\]+)$/);
    	var filename = m[1];
    	$('label[for^="'+this.id+'"]').text(filename);
    	var inputs = $('form[id="uploader"] input');
    	var file = true;
    	for (var i = 0; i < 2; i++) {
    		if (inputs[i].value === "") {
    			file = false;
    		}
    	}
    	if (file) {
    		$('button[id="uploader"]').removeAttr('disabled')
    	}
    }

    function addEventListenerBySelector(selector, event, fn) {
    	var list = $(selector);
    	list.bind(event, fn)
    }

    // add event listener on change of the file input
    addEventListenerBySelector('input.uploader', 'change', updateFileInfo);

    $('button[id="uploader"]').click(function() {
    	$('div[id="wait"]').modal();
    });
});
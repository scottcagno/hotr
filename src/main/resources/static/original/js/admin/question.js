
 var addOptionDiv = 'div[id="allOptions"] div[id="addOption"]';
// add input with delete button add placeholder after input set delete action
function addOption() {
	$(addOptionDiv).html($('div[id="nextOptionInput"]').html());
	$(addOptionDiv).attr('id', 'option'+i);
	$('div[id="option' + i + '"] input').attr('id', 'option'+i);
	$('div[id="option' + i + '"] a').attr('id', 'option'+i);
	$('div[id="option' + i + '"]').after($('div[id="nextOptionDiv"]').html());
	$('a[id="option' + i + '"]').click(function() {
		$('div[id="'+$(this).attr('id')+'"]').remove();
	});
	i++;
}

$(document).ready(function() {
    // set variables
    var type = 'select[id="inputType"]';

    // run add option on type select add add option button after input || remove all options on type select
    $(type).change(function() {
    	if ($(type).val() == 'select one' || $(type).val() == 'select many') {
    		if (!multi) {
    			multi = true;
    			addOption();
    			$(addOptionDiv).after($('div[id="nextOptionButton"]').html());
    			$('a[id="addOptionButton"]').click(function() {
    				addOption();
    			});
    		}
    	} else {
    		$('div[id="allOptions"]').html($('div[id="nextOptionDiv"]').html());
    		multi = false;
    	}
    });

    // create option list and submit form
    $('button[id="addQuestionButton"]').click(function() {
    	if ($(type).val() == 'select one' || $(type).val() == 'select many') {
    		var option = []
    		inputs = $('div[id="allOptions"] input[name="option"]');
    		for (i = 0; i < inputs.length; i++) {
    			option.push(inputs[i].value.replace(',', ''));
    		}
    		$('form[id="addQuestion"] input[name="options"]').val(option);
    	}
    	$('form[id="addQuestion"]').submit();
    });
});
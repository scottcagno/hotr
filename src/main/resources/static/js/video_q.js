$(document).ready(function() {
    function formToObject(form) {
        var object = {};
        var formArray = form.serializeArray();
        $.each(formArray, function() {
            if (object[this.name] !== undefined) {
                if (!object[this.name].push) {
                    object[this.name] = [object[this.name]];
                }
                object[this.name].push(this.value || '');
            } else {
                object[this.name] = this.value || '';
            }
        });
        return object;
    };

    $('button[id="submitWorksheet"]').click(function() {
    	obj = formToObject($('form[id="worksheet"]'));
    	j = JSON.stringify(obj);
    	$('input[id="answers"]').val(j);
    	$('form[id="submitForm"]').submit();
    });





    //var html = '<my answer>'
    //alert(re.test(html));
});
    var re = new RegExp($('div[id="regEx"]').text())

function validForm() {
       var formArray = $('form[id="worksheet"]').serializeArray();
       $.each(formArray, function() {
           /*if (re.test(this.value)) {
               return false;
           }*/
           //alert(this.value + ' ' + re.test(this.value))
       });
       return true;
    }
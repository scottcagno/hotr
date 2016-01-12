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



/*
function updateFileInfo(e) {
    var t = e.value;
    var n = t.match(/([^\/\\]+)$/);
    var r;
    if (n == null) {
        if (e.id.split("_")[0] == "f") {
            r = "Select Front"
        } else {
            r = "Select Back"
        }
    } else {
        r = n[1]
    }
    $('label[for^="' + e.id + '"]').text(r);
    var i = $('div[id="' + e.id.split("_")[1] + '"] input');
    var s = true;
    for (var o = 0; o < i.length; o++) {
        if (i[o].value == "") {
            s = false
        }
    }
    if (s) {
        $('button[id="upload"]').removeAttr("disabled")
    } else {
        $('button[id="upload"]').attr("disabled", "true")
    }
}

function fileCheck(e) {
    console.log("filecheck");
    var t = $('input[id="' + e.id + '"]')[0].files[0].size;
    var n = $('input[id="' + e.id + '"]')[0].files[0].type;
    if (t > 4194304) {
        $('input[id="' + e.id + '"]')[0].type = "text";
        $('input[id="' + e.id + '"]')[0].type = "file";
        $('p[id="fileMessage"]').html("File too large. Max file size is 4MB");
        $('div[id="fileError"]').removeClass("hide");
        return
    }
    alert(n);
    switch (n) {
        case "application/png":
            $('div[id="fileError"]').addClass("hide");
            break;
        default:
            $('input[id="' + e.id + '"]')[0].type = "text";
            $('input[id="' + e.id + '"]')[0].type = "file";
            $('p[id="fileMessage"]').html("Incorrect file type. All files must be a PDF");
            $('div[id="fileError"]').removeClass("hide")
    }
}(function() {
    $('button[id="upload"]').click(function() {
        $('div[id="content"]').addClass("hide");
        $('div[id="uploadSpinner"]').removeClass("hide")
    });
    $("input.uploader").change(function() {
        updateFileInfo(this)
    })
})()*/

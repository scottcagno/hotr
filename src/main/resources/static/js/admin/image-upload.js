
function updateFileInfo(e) {
    var t = e.value;
    var n = t.match(/([^\/\\]+)$/);
    var r;
    if (n == null) {
        r = "Add Image";
    } else {
        r = n[1];
    }
    $('label[for^="' + e.id + '"]').text(r);
    var i = $('form[id="uploader"] input');
    var s = true;
    for (var o = 0; o < i.length; o++) {
        if (i[o].value == "") {
            s = false;
        }
    }
    if (s) {
        $('button[id="uploader"]').removeAttr("disabled")
    } else {
        $('button[id="uploader"]').attr("disabled", "true")
    }
}

function fileCheck(e) {
    var t = $('input[id="' + e.id + '"]')[0].files[0].size;
    var n = $('input[id="' + e.id + '"]')[0].files[0].type;
    if (t > 4194304) {
        $('input[id="' + e.id + '"]')[0].type = "text";
        $('input[id="' + e.id + '"]')[0].type = "file";
        $('p[id="fileMessage"]').html("File too large. Max file size is 4MB");
        $('div[id="fileError"]').removeClass("hide");
        return
    }
    switch (n) {
        case "image/png":
        case "image/jpeg":
            $('div[id="fileError"]').addClass("hide");
            break;
        default:
            $('input[id="' + e.id + '"]')[0].type = "text";
            $('input[id="' + e.id + '"]')[0].type = "file";
            $('p[id="fileMessage"]').html("Incorrect file type. All files must be a PNG");
            $('div[id="fileError"]').removeClass("hide")
    }
}

(function() {
    $('button[id="upload"]').click(function() {
        $('div[id="content"]').addClass("hide");
        $('div[id="uploadSpinner"]').removeClass("hide")
    });
    $("input.uploader").change(function() {
        fileCheck(this)
        updateFileInfo(this)
    })
})()

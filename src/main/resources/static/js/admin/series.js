$(document).ready(function() {
    $('select[id="seriesSelect"]').change(function() {
        if ($('select[id="seriesSelect"]').val() == 'none') {
            window.location.href = '/admin/series';
        } else {
            window.location.href = '/admin/series/' + $('select[id="seriesSelect"]').val();
        }
    });

    $('button[id="save"]').click(function() {
        var inputs = $('input.videoId');
        var videoIds = [];
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked) {
                var id =+ inputs[i].value;
                videoIds.push(id);
            }
        }
        var images = $('input.image');
        var thumbnail =  '';
        for (var i = 0; i < images.length; i++) {
            if (images[i].checked) {
                thumbnail = images[i].value;
            }
        }
        $('form[id="seriesForm"] input[name="videoIds"]').val(videoIds);
        $('form[id="seriesForm"] input[name="thumb"]').val(thumbnail);
        $('form[id="seriesForm"]').submit();
    });
});
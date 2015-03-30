$(document).ready(function() {
    $('select[id="seriesSelect"]').change(function() {
        if ($('select[id="seriesSelect"]').val() == 'none') {
            window.location.href = '/admin/series';
        } else {
            window.location.href = '/admin/series/' + $('select[id="seriesSelect"]').val();
        }
    });

    $('button[id="save"]').click(function() {
        var inputs = $('input[type="checkbox"]');
        var videoIds = [];
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked) {
                var id =+ inputs[i].value;
                videoIds.push(id);
            }
        }
        $('form[id="seriesForm"] input[name="videoIds"]').val(videoIds);
        $('form[id="seriesForm"]').submit();
    });
});
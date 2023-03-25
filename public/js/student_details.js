$(document).ready(function(){
    $('.list-item').click(function(){
        let div = $('#stu' + $(this).attr('id'));
        $.ajax({
            url: 'http://localhost/www/CPIA2B4ProjetWeb/public/api.php?t=student.' + $(this).attr('id'),
            type: 'GET',
            dataType: 'json'
        }).done(function(response) {
            let data = JSON.stringify(response);
            let jdata = JSON.parse(data);
            // $('id selector') .html(data to put into it) /or/ .append(data to add to it)
            if (jdata.candidatures[0].offer == null) {
                $(div).html(
                    '<div class="row sombre">' +
                        '<div class="col">' +
                            '<p class="card-text"><h6>Pas de candidature en cours</h6></p>' +
                        '</div>' +
                    '</div>'
                );
            } else {
                $(div).html('');
                jdata.candidatures.forEach(element => {
                    $(div).append(
                        '<div class="row sombre">' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.offer + '</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.state + '</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.company + '</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.startdate + '</p>' +
                            '</div>' +
                        '</div>'
                    );
                });
            }
        });
    });
});
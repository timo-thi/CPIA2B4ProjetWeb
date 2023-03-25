$(document).ready(function(){
    $('.list-item').click(function(){
        let div = $('#pil' + $(this).attr('id'));
        $.ajax({
            url: 'http://localhost/www/CPIA2B4ProjetWeb/public/api.php?t=pilot.' + $(this).attr('id'),
            type: 'GET',
            dataType: 'json'
        }).done(function(response) {
            let data = JSON.stringify(response);
            let jdata = JSON.parse(data);
            // $('id selector') .html(data to put into it) /or/ .append(data to add to it)
            if (!jdata.promos.length || jdata.promos[0].prom == null) {
                $(div).html(
                    '<div class="row sombre">' +
                        '<div class="col">' +
                            '<p class="card-text"><h6>Pas de promos</h6></p>' +
                        '</div>' +
                    '</div>'
                );
            } else {
                $(div).html('');
                jdata.promos.forEach(element => {
                    $(div).append(
                        '<div class="row sombre">' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.prom + '</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.student_count + ' Étudiants</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' + element.campus + '</p>' +
                            '</div>' +
                            '<div class="col">' +
                                '<p class="card-text">' +
                                    element.number +
                                    ' ' +
                                    element.address +
                                    ' ' +
                                    element.city +
                                '</p>' +
                            '</div>' +
                        '</div>'
                    );
                });
            }
        });
    });
});
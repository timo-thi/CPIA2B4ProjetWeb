$(document).ready(function(){
    $('.list-item').click(function(){
        $.ajax({
            url: 'http://localhost/www/CPIA2B4ProjetWeb/public/api.php?t=student.' + $(this).attr('id'),
            type: 'GET',
            dataType: 'json'
        }).done(function(response) {
            let data = JSON.stringify(response);
            let jdata = JSON.parse(data);
            
            // $('id selector') .html(data to put into it) /or/ .append(data to add to it)
            if (jdata.skills.length <= 0) {
                $('#of-skills').html("<li><p class='sombre'> Pas de compétence particulière recommandée</p></li>");
            } else {
                $('#of-skills').html('');
                jdata.skills.forEach(element => {
                    $('#of-skills').append('<li><p class="sombre">' + element.name + '</p></li>');
                });
            }
        });
    });
});
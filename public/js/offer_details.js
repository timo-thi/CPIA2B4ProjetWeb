$(document).ready(function(){
    $('.list-item').click(function(){
        $.ajax({
            url: '../public/api.php?t=offer.' + $(this).attr('id'),
            type: 'GET',
            dataType: 'json'
        }).done(function(response) {
            let data = JSON.stringify(response);
            let jdata = JSON.parse(data);
            
            // $('id selector') .html(data to put into it) /or/ .append(data to add to it)
            $('#of-name').html(jdata.name);
            $('#of-company').html(jdata.company);
            $('#of-address').html(jdata.address);
            $('#of-city_zipcode').html(jdata.city + ' (' + jdata.zipcode + ')');
            $('#of-link').attr('href', jdata.link);
            $('#of-email').html(jdata.contact_email);
            $('#of-telephone').html(jdata.telephone);
            $('#of-amount').html('Gratification : ' + jdata.amount + ' /mois');
            if (jdata.activity == '') {
                $('#of-activity').html("<li><p class='sombre'> Pas de secteur d'activité spécifié</p></li>");
            } else {
                $('#of-activity').html('<li><p class="sombre"> ' + jdata.activity + '</p></li>');
            }
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
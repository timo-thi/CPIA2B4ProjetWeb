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
            $('#postulate-link').attr('href', '../public/index.php?p=offer.postulate&id='+jdata.id_offer);
            $('#of-email').html(jdata.contact_email);
            $('#of-telephone').html(jdata.telephone);
            $('#of-wage').html('Gratification : ' + jdata.wage);
            $('#of-amount').html('Gratification : ' + jdata.amount);
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
            if (jdata.wished) {
                $('#wished').removeClass('fa-sharp fa-regular fa-heart');
                $('#wished').addClass('fa-solid fa-heart');
            } else {
                $('#wished').removeClass('fa-solid fa-heart');
                $('#wished').addClass('fa-sharp fa-regular fa-heart');
            }
        });
    });
});
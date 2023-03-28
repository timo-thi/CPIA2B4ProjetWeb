$(document).ready(function(){
    $('.list-item').click(function(){
        $.ajax({
            url: '../public/api.php?t=company.' + $(this).attr('id'),
            type: 'GET',
            dataType: 'json'
        }).done(function(response) {
            let data = JSON.stringify(response);
            let jdata = JSON.parse(data);
            
            // $('id selector') .html(data to put into it) /or/ .append(data to add to it)
            $('#com-name').html(jdata.name);
            $('#com-link').attr('href', jdata.link);
            $('#com-edit').attr('onclick', 'window.location.href="?p=company.edit&id=' + jdata.id_company + '"');
            $('#com-cesi_accepted').attr('href', "Nombres d'élèves CESI déjà acceptés en stage : " + jdata.cesi_accepted);
            if (jdata.activities.length <= 0) {
                $('#com-activities').html('<li><p class="sombre"> Aucune activité</p></li>');
            } else {
                $('#com-activities').html('');
                jdata.activities.forEach(element => {
                    $('#com-activities').append('<li><p class="sombre">' + element.name + '</p></li>');
                });
            }
            if (jdata.localities.length <= 0) {
                $('#com-localities').html("<li><p class='sombre'> Aucune localisation</p></li>");
            } else {
                $('#com-localities').html('');
                jdata.localities.forEach(element => {
                    $('#com-localities').append("<li><p class='sombre'>" + element.number + ' ' + element.street + ' - ' + element.city + ' (' + element.zipcode + ')</p></li>');
                });
            }
            if (jdata.rates.length <= 0) {
                $('#com-rates').html("<p class='sombre'> Aucun commentaire</p>");
            } else {
                console.log(jdata.rates.length)
                $('#com-rates').html('');
                jdata.rates.forEach(element => {
                    $('#com-rates').append('<p class="sombre"><strong>Notes : ' + element.rating + '</strong><br>' + element.comment + '</p>');
                });
            }
        });
    });
});
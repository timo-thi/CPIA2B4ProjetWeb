<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/fontawesome/css/all.min.css">
    <title>Recherche d'entreprise</title>
</head>




<body class="bg-sombre">

<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width:90%;height:max-content"><!--ou style="width: 40%; max-width=90vh;"-->
            <h1 class="sombre text-center">Ajouter une entreprise</h1>
            <form action="" class="mx-auto" method="post" style="width:95%">
                <div class="container mt-5 position-relative">
                    <label for="nom" class="col ">
                        <strong style="font-size: 130%;">Nom</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="name" id="nom">
                </div>
                
                <div class="container mt-4 position-relative">
                    <label for="activity" class="col ">
                        <strong style="font-size: 130%;">Secteur d'activité</strong>
                    </label>
                    <select name="sector[]" id="activity" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" multiple>
                        <?php foreach ($annonces as $el):?>  
                        <!--boucle foreach secteur
                            on doit pouvoir en choisir plusieurs donc selection multipple-->
                        <option value="<?= $el->id_activity?>"><?php echo "{$el->name}" ?></option>
                        <?php endforeach?>
                    </select>
                </div>
                <br>
                <br>
                <div class="container mt-4 position-relative">
                    <label for="lien" class="col ">
                        <strong style="font-size: 130%;">Lien</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="link" id="lien">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Ville</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city" id="city">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Code Postal</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode" id="zipcode">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Adresse</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address" id="address">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Numéro</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number" id="number">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Comment</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment" id="comment">
                </div>
                            
               <!--pour la visibilité je pense mettre une radio mais je ne sais pas si c'est galère à recup pour le back
            je m'en remet donc entièrement à mon collèquqe et ami Tim parce qu'après tout c'est lui le plus beau-->
                
               
                <div class="row mt-5">
                    <div class="col">
                   
                    </div>
                    <div class="col position-relative">
                    <div class="btn-group position-absolute end-0" role="group">
                    <button type="reset" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Ajouter</button>
                    </div>
                    
                    </div>
                    
                </div>
            </form>
            <br>
                            <br>
                            <br>
</div>


    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>

</html>
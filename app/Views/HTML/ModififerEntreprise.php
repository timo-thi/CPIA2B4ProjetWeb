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

<?php
require './Navbar.php';?>

<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width=90%;height:max-content"><!--ou style="width: 40%; max-width=90vh;"-->
            <h1 class="sombre text-center">Ajouter une entreprise</h1>
            <form action="" class="mx-auto" method="" style="width:95%">
                <div class="container mt-5 position-relative">
                    <label for="nom" class="col ">
                        <strong style="font-size: 130%;">Nom</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="nom">
                </div>
                
                <div class="container mt-4 position-relative">
                    <label for="activity" class="col ">
                        <strong style="font-size: 130%;">Secteur d'activité</strong>
                    </label>
                    <select multiple name="" id="activity" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" >
                      <!--boucle foreach secteur
                            on doit pouvoir en choisir plusieurs donc selection multipple-->
                        <option value="1"><!--un secteur--></option>
                    </select>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="lien" class="col ">
                        <strong style="font-size: 130%;">Lien</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="lien">
                </div>

               <!--pour la visibilité je pense mettre une radio mais je ne sais pas si c'est galère à recup pour le back
            je m'en remet donc entièrement à mon collèquqe et ami Tim parce qu'après tout c'est lui le plus beau-->
                
               
                <div class="row mt-5">
                    <div class="col">
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Supprimer</button>
                    </div>
                    <div class="col position-relative">
                    <div class="btn-group position-absolute end-0" role="group">
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Modifier</button>
                    </div>
                    
                    </div>
                    
                </div>
            </form>

</div>

<?php require './Footer.php'?>
    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>

</html>
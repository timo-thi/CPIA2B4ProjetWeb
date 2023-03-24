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
            <h1 class="sombre text-center">Ajouter une offre</h1>
            <form action="" class="mx-auto" method="" style="width:95%">
                <div class="container mt-5 position-relative">
                    <label for="titre" class="col ">
                        <strong style="font-size: 130%;">Titre de l'offre</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="titre">
                </div>
                
                <div class="container mt-4 position-relative">
                    <label for="Adresse" class="col ">
                        <strong style="font-size: 130%;">Adresse</strong>
                    </label>
                    <select name="" id="adresse" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" >
                        <option value="1"><!--l'adresse de l'offre/ de l'une des localissation de l'entreprise--></option>
                     
                    </select>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="mail" class="col ">
                        <strong style="font-size: 130%;">E-mail</strong>
                    </label>
                    <input type="mail" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mail">
                </div>

                <div class="container mt-4 position-relative">
                    <label for="phone" class="col ">
                        <strong style="font-size: 130%;">Télephone</strong>
                    </label>
                    <input type="mail" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="phone">
                </div>

                <div class="container mt-4 position-relative">
                    <label for="gratification" class="col ">
                        <strong style="font-size: 130%;">Gratification</strong>
                    </label>
                    <input type="mail" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="Gratification">
                </div>

                <div class="container mt-4 position-relative">
                    <label for="activity" class="col ">
                        <strong style="font-size: 130%;">Secteur d'activité</strong>
                    </label>
                    <select name="" id="activity" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" >
                        <!--boucle foreach secteur-->
                        <option value="1"><!--un secteur--></option>
                        
                    </select>
                </div>
                <div class="container mt-4 position-relative">
                    <label for="skill" class="col ">
                        <strong style="font-size: 130%;">Compétences</strong>
                    </label>
                    <select multiple name="" id="skill" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" >
                        <!--boucle foreach compétences
                            on doit pouvoir en choisir plusieurs donc selection multipple-->
                        <option value="1"><!--un secteur--></option>

                    </select>
                </div>

                <div class="container mt-4 position-relative">
                    <div class="row">
                        <p><strong style="font-size: 130%;">Description</strong></p>
                    </div>
                    <div class="row">
                        <div class="partieScrolable">
                            <!--trop fatiqué pour savoir si je dois mettre un input/ textarea ou autre-->
                            <input type="text" class="col rounded position-absolute end-0 " style="width: 100%; min-height:100px ; height:max-content; max-height:20%" name="" id="mdp">
                        </div>
                    </div>
                </div>
                
                
               
                <div class="row mt-5">
                    <div class="col">
                    </div>
                    <div class="col position-relative">
                    <div class="btn-group position-absolute end-0" role="group">
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Ajouter</button>
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
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

<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width=90%;"><!--ou style="width: 40%; max-width=90vh;"-->
            <h1 class="sombre text-center">Ajouter un utilisateur</h1>
            <form action="" class="mx-auto" method="" style="width:95%">
                <div class="container mt-5 position-relative">
                    <label for="nom" class="col ">
                        <strong style="font-size: 130%;">Nom</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="nom">
                </div>
                <div class="container mt-4 position-relative">
                    <label for="nom" class="col ">
                        <strong style="font-size: 130%;">Prenom</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="prennom">
                </div>
                <div class="container mt-4 position-relative">
                    <label for="mail" class="col ">
                        <strong style="font-size: 130%;">E-mail</strong>
                    </label>
                    <input type="mail" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mail">
                </div>
                <div class="container mt-4 position-relative">
                    <label for="role" class="col ">
                        <strong style="font-size: 130%;">Role</strong>
                    </label>
                    <select name="role" id="role" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" >
                        <option value="1"><!--Le role actuel--></option>
                        <option value="2">Pilote</option>
                        <option value="3">Utilisateur</option>
                        <option value="4">Administrateur</option>
                    </select>
                </div>
                <div class="container mt-4 di">
                    <div class="row position-relative di">
                        <label for="role" class="col-mb-auto ">
                            <strong style="font-size: 130%;">Promotion</strong>
                        </label>
                        <div class="position-absolute end-0 dib">
                            <select name="" id="prom" class="col-mb-auto border-1 rounded " style="width: 40%;" >
                                <option value="1">Séléctionez une promotion</option>
                            </select>
                            <button class="col-mb-auto">+</button>
                        </div>
                    </div>
                    
                </div>
                <div class="container mt-4 position-relative">
                    <label for="mdp" class="col ">
                        <strong style="font-size: 130%;">Mot de passe</strong>
                    </label>
                    <input type="password" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mdp">
                </div>
                <div class="container mt-4 position-relative">
                    <label for="mdp2" class="col  ">
                        <strong style="font-size: 130%;"> Confirmation</strong>
                    </label>
                    <input type="password" class="col rounded position-absolute end-0" style="width: 40%;" name="" id="mdp2">
                </div>
                
               
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
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
            <form action="" class="mx-auto" method="post" style="width:95%">
                <div class="container mt-5 position-relative">
                    <label for="title">Titre de l'offre<input type="text" name="title" id="title" placeholder="Entrez le titre de l'offre"></label>
                </div>
                <div class="container mt-4 position-relative">
                    <label for="activities">Entreprise</label>
                    <select name="activities" id="activities">
                        <option value="0">-- Choisissez une option --</option>
                        <?php foreach ($companies as $company) {
                           echo '<option value="' . $company->id_company . '">' . $company->name . '</option>';
                        }?>
                    </select>
                        </div>
                
                <div class="container mt-4 position-relative">
                    <label for="activities">Adresse</label>
                    <select name="activities" id="activities">
                        <option value="0">-- Choisissez une option --</option>
                        <?php foreach ($companies as $company) {
                            echo '<option value="' . $company->id_company . '">' . $company->name . '</option>';
                        }?>
                    </select>
                </div>

                <div class="container mt-4 position-relative">
                  <label for="email">E-mail<input type="email" name="email" id="email" placeholder="Entrez l'email de contact'"></label>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="tel">Téléphone<input type="tel" name="tel" id="tel" placeholder="Entrez le téléphone de contact"></label>
                </div>

                <div class="container mt-4 position-relative">
                   <label for="gratification">Gratification<input type="number" name="gratification" id="gratification" placeholder="Entrez la gratifiction"></label>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="activities">Secteurs d'activité</label>
                    <select name="activities" id="activities">
                        <option value="0">-- Choisissez une option --</option>
                        <option value="1">HTML</option>
                        <option value="2">CSS</option>
                        <option value="3">PHP</option>
                        <option value="4">JS</option>
                        <option value="5">SQL</option>
                    </select>
                    </select>
                </div>
                <div class="container mt-4 position-relative">
                    <label for="skills">Compétences</label>
                    <select name="skills" id="skills">
                        <option value="0">-- Choisissez une option --</option>
                        <option value="1">HTML</option>
                        <option value="2">CSS</option>
                        <option value="3">PHP</option>
                        <option value="4">JS</option>
                        <option value="5">SQL</option>
                    </select>
                </div>

                <div class="container mt-4 position-relative">
                    <label for="description">Description<textarea name="description" id="description" cols="30" rows="10" placeholder="Entrez la description"></textarea></label>
                </div>

                <div class="visibility">
                    <label for="visibility">Visibilité</label>
                    <input type="radio" name="visibility" id="visibility" value="1" checked>
                    <label for="visibility">Publique</label>
                    <input type="radio" name="visibility" id="visibility" value="0">
                    <label for="visibility">Privée</label>
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
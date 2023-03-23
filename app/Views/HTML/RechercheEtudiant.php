<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/fontawesome/css/all.min.css">
    <title>Recherche d'Offres</title>
</head>

<?php 
$page = 'RechercheEtudiant';
?>
<?php require './Navbar.php'?>

<body class="bg-sombre" >


    <div class="container mt-3" style="max-width:80%; height: max-content">
        <?php require './Filter.php'?>
    </div>

    <div class="container mt-3 " style="max-width:80%">
        <?php 
        for ($Identifiant = 1; $Identifiant <= 10; $Identifiant++){
            require './CadreProfile.php';
        }?>
    




     <!--ajouter les autres cadres pilotes (en changeant le nom du bouton collapse)-->
    </div>
 
  <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>

</body>
<?php require './Footer.php'?>
 
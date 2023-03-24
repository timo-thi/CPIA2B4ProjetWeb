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




<body class="bg-sombre">

<?php 
$page = 'RechercheOffre';
?>
<?php require './Navbar.php'?>
<!-- La barre de filtres-->


<div class="container mt-3  " style="max-width:90%">
        <?php require './Filter.php'?>

  <div class="row mt-3 position-relative">

    <div class=" col-6 ">
      <div class="partieScrollable">
            <?php 
            for ($i = 1; $i <= 10; $i++){
                echo '<div class="row me-2 ms-1 rounded-3">';
                require './CadreAnnonce.php';
                echo '</div>';
            }?>
            <!--Pagination-->
      </div>
    </div>

  
    <div class="col-6 position-absolute end-0">
      <div class="position-absolute ms-2 end-0">
      <?php require './DetailOffre.php';?>
      </div>
    </div>
  

  </div>
</div>
       
      

    <?php require './Footer.php'?>
    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>


</html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/fontawesome/css/all.min.css">
    <title>Wish-List</title>
</head>




<body class="bg-sombre">

<?php 
$page = 'WishList';
?>

<?php require './Navbar.php'?>
<!-- La barre de filtres-->
<div class="container mt-3" style="max-width:80%">
        <?php require './Filter.php'?>
    </div>
    <div class="row g- justify-content-around mt-3 mb-">
  <div class="col-5 col-rows-1 col-rows-md-2 g- di">
    
          <?php 
          for ($i = 1; $i <= 10; $i++){
              echo '<div class="row ms-5">';
              require './cadreOffre.php';
              echo '</div>';
          }?>
       


      
  </div>
  <div class="col-5 col-rows-1 col-rows-md-2 g- di">
    
  </div>
</div>


    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>
<?php require './Footer.php'?>

</html>
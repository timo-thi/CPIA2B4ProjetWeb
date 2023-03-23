<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/css/style.css">
    <link rel="stylesheet" href="../../../BootStrap/assets/vendors/fontawesome/css/all.min.css">
    <title>cadre Offre</title>
</head>

<body class="bg-sombre">

<?php include 'TplVar.php' ?> 

<div class="card bg-clair mb-3 " style="max-width: 100%;">
  <div class="row g-0">
    <div class="col-md-4 my-auto" >
      <img src="../assets/imgs/oeil_fond_fffaf0.png" class="img-fluid rounded-start" alt="..." >
    </div>
    <div class="col-md-7">
      <div class="card-body sombre di" >
        <h5 class="card-title"> <?= $Titre ?> </h5>
        <p class="card-text"><?php echo $SousInfo1.$Delimit1.$SousInfo2.$Delimit2.$SousInfo3.$Delimit3; ?> </p>
      </div>
    </div>
   
  </div>
</div>

    <script src="../../../BootStrap/assets/vendors/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../../../BootStrap/assets/vendors/jquery/jquery.min.js"></script>
</body>

</html>

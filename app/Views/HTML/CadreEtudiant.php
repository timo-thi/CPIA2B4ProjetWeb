

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
include 'TplVar.php';
?>

<div class="col mt-3">
<div class="card bg-clair mb-3" style="max-width: 100%;">
  <div class="row g-0 ">
    <div class="col-md-2 my-auto mx-auto" style="max-width: 150px;">
      <img src="../assets/imgs/oeil_fond_fffaf0.png" class="img-fluid rounded-start di" alt="..." >
    </div>
    <!--Les infos en entête-->

    <div class="col-md-10">
      <div class="card-body sombre row">
      <?php
        for ($Info=1; $Info <= 5; $Info++){ 
            echo '<div class="col text-center mb-auto mt-auto"> 
                <p class="card-text"> '.${'CadreInfo'.$Info}.'</p> 
                </div>';
        }
        ?> 
        <div class="col text-end ">
        <button class="rounded-4 but clair px-2 py-2" type="button" data-bs-toggle="collapse" data-bs-target="#<?= $Identifiant ?>" aria-expanded="false" aria-controls="<?= $Identifiant ?>" style="width:max-content;">
        <?= $CadreDrop?>
        </button>
        </div>
      </div>
    </div>

    
    <!--Les infos qui apparaissent-->
    
    <div class="collapse row sombre" id="<?= $Identifiant ?>">
    <?php
    for ($Detail=1; $Detail <= 4; $Detail++){ 
        echo '<div class="col"> 
            <p class="card-text">'.${'CadreDetail'.$Detail}.'</p> 
            </div>';
    }
    ?>     

    </div>
  </div>
</div>
</div>


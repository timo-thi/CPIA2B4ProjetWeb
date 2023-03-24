<?php
extract($announce_interface)
?>
<div class="card bg-clair mb-3 " style="max-width: 100%;">
  <div class="row g-0">
    <div class="col-md-4 my-auto" >
      <img src="<?= $annonces[$i]->$image?>" class="img-fluid rounded-start" alt="..." >
    </div>
    <div class="col-md-7">
      <div class="card-body sombre di" >
        <h5 class="card-title"> <?= $annonces[$i]->$titre ?> </h5>
        <p class="card-text"><?php echo $annonces[$i]->$sousinfo1 . $Delimit1 . $annonces[$i]->$sousinfo2 . $Delimit2 . $annonces[$i]->$sousinfo3 . $Delimit3; ?> </p>
      </div>
    </div>
  </div>
</div>

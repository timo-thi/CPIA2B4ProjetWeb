<div class="row g- justify-content-around mt-3 mb-">
  <div class="col-5 col-rows-1 col-rows-md-2 g-">
    
    <?php foreach ($annonces as $el):?>

      <div class="row ms-5">
        <div class="card bg-clair mb-3 " style="max-width: 100%;">
          <div class="row g-0">
            <div class="col-md-4 my-auto" >
              <img src="<?= ($el->link == '') ? $el->link : 'https://cdn.discordapp.com/attachments/1072440528026738688/1088735990673317978/company.png'?>" class="img-fluid rounded-start" alt="..." >
            </div>
            <div class="col-md-7">
              <div class="card-body sombre di" >
                <h5 class="card-title"> <?= $el->name ?> </h5>
                <p class="card-text"><?php echo "Nombre d'étudiants CESI acceptés : {$el->cesi_accepted}"; ?> </p>
              </div>
            </div>
          </div>
        </div>
      </div>

    <?php endforeach?>
  </div>
  <div class="col-5 col-rows-1 col-rows-md-2 g- di">
    <!-- viendra la partie détails -->
  </div>
</div>
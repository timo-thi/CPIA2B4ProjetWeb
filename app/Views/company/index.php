<script src="../public/js/company_details.js"></script>
<div class="container mt-3 " style="max-width:90%">
  <?php
  $filtre1 = 'Nom';
  $filtre2 = 'Secteur';
  $filtre3 = 'Localisation';
  $filtre4 = 'Étudiants CESI acceptés';

  $HideFilter1 = '';
  $HideFilter2 = '';
  $HideFilter3 = '';
  $HideFilter4 = '';

  require '../app/Views/templates/Filter.php';
  ?>
  <div class="row mt-3 position-relative">
    <div class="col-6  ">
      <div class="partieScrollable">
        <?php foreach ($annonces as $el):?>

          <div class="row ms-5">
            <div class="card bg-clair mb-3 list-item" style="max-width: 100%;" id="<?= $el->id_company?>">
              <div class="row g-0 dib">
                <div class="col-md-4 my-auto di">
                  <img src="https://cdn.discordapp.com/attachments/1072440528026738688/1088735990673317978/company.png" class="img-fluid rounded-start" alt="...">
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
    </div>

    <div class="col-6 position-absolute end-0 ">
      <div class="position-absolute ms-2 end-0 ">
        <?php require '../app/Views/templates/DetailEntreprise.php';?>
      </div>
    </div>
  </div>
</div>

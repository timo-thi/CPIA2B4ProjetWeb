

<div class="col mt-3">
<div class="card bg-clair " style="max-width: 100%;">
  <div class="row g-0 ">
    <div class="col-md-4 my-auto" style="max-width: 150px;">
      <img src="../assets/imgs/oeil_fond_fffaf0.png" class="img-fluid rounded-start" alt="..." >
    </div>
    <!--Les infos en entête-->
    <div class="col-md-8">
      <div class="card-body sombre row">
        <div class="col text-center mb-auto mt-auto">
        <p class="card-text"> Nom</p>
        </div>
        <div class="col text-center mb-auto mt-auto">
        <p class="card-text"> Prénom</p>
        </div>
        <div class="col text-center mb-auto mt-auto">
        <p class="card-text"> Mail</p>
        </div>
        <div class="col text-end ">
        <button class="rounded-4 but clair px-2 py-2" type="button" data-bs-toggle="collapse" data-bs-target="#Pilote1" aria-expanded="false" aria-controls="Pilote1">
        <?= $CadreDrop?>
        </button>
        </div>
      </div>
    </div>

    <!--Les infos qui apparaissent-->
    <div class="collapse row sombre " id="Pilote1">
        <div class="col">
        <p class="card-text"> NomPromo</p>
        </div>
        <div class="col">
        <p class="card-text"> Nombre d'étudiants</p>
        </div>
        <div class="col">
        <p class="card-text"> Campus</p>
        </div>
        <div class="col">
        <p class="card-text"> Adresse</p>
        </div>

    </div>
  </div>
</div>
</div>



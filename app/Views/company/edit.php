<!--<script src="../public/js/company_edit.js"></script>
<input type="text" id="nbr" name="nbr" value="<?=count($company->localities);?>">
-->

<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width:90%;height:max-content"><!--ou style="width: 40%; max-width=90vh;"-->
    <h1 class="sombre text-center">Modifier une entreprise</h1>
    <form class="mx-auto" method="post" style="width:95%">
        <div class="container mt-5 position-relative">
            <label for="nom" class="col ">
                <strong style="font-size: 130%;">Nom</strong>
            </label>
            <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="name" id="nom" value="<?= isset($company->name) ? $company->name : ''?>">
        </div>
        
        <div class="container mt-4 position-relative">
            <label for="activity" class="col ">
                <strong style="font-size: 130%;">Secteur d'activité</strong>
            </label>
            <select name="sector[]" id="activity" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" multiple>
                <?php foreach ($activity as $el):?>
                    <option value="<?= $el->id_activity?>" <?= in_array($el->id_activity,$company->activities) ? 'selected' : '' ?> ><?= $el->name ?></option>
                <?php endforeach?>
            </select>
        </div>
        <br>
        <br>
        <div class="container mt-4 position-relative">
            <label for="lien" class="col ">
                <strong style="font-size: 130%;">Lien</strong>
            </label>
            <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="link" id="lien" value="<?= isset($company->link) ? $company->link : ''?>">
        </div>
        <!-- 
            Partie adresse :
                chargement des données de l'entreprise, idéalement bouton pour supprimer :thinking: (j'ai une idée mais c'est du bonus)
                bouton pour ajouter une adresse
            -->

            <div class="container">
            <label class="col "> <strong style="font-size: 130%;">Ajouter une adresse:</strong> </label>

            <button type="button" onclick="addAddress()" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3">+</button>
            </div>
            <?php $num_addresse=0;?>
            <?php foreach ($company->localities as $locality):?>
                 <?php $num_addresse++;?>
                 <div class="container">
                 <button class="bg-sombre clair border-0 rounded px-2 mb- mt-3 ms- me- dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#adresse<?=$num_addresse;?>" aria-expanded="false" aria-controls="adresse<?=$num_addresse;?>">
                 Adresse <?=$num_addresse;?>
                </button>
                <div class="collapse border-sombre border-top-0 border-start-0 border-end-0" id="adresse<?=$num_addresse;?>" data-address-id="<?=$num_addresse;?>"> <!-- À modifier :+1: -->
                    <input type="hidden" name="id_locality[]" value="<?= isset($locality->id_localities) ? $locality->id_localities : '' ?>">
                    <div class="container mt-4 position-relative">
                        <label class="col ">
                            <strong style="font-size: 130%;">Ville</strong>
                        </label>
                        <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city[]" id="city" value="<?= isset($locality->city) ? $locality->city : ''?>">
                    </div>
                    <div class="container mt-4 position-relative">
                        <label class="col ">
                            <strong style="font-size: 130%;">Code Postal</strong>
                        </label>
                        <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode[]" id="zipcode" value="<?= isset($locality->zipcode) ? $locality->zipcode : ''?>">
                    </div>
                    <div class="container mt-4 position-relative">
                        <label class="col ">
                            <strong style="font-size: 130%;">Adresse</strong>
                        </label>
                        <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address[]" id="address" value="<?= isset($locality->street) ? $locality->street : ''?>">
                    </div>
                    <div class="container mt-4 position-relative">
                        <label class="col ">
                            <strong style="font-size: 130%;">Numéro</strong>
                        </label>
                        <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number[]" id="number" value="<?= isset($locality->number) ? $locality->number : ''?>">
                    </div>
                    <div class="container mt-4 position-relative">
                        <label class="col ">
                            <strong style="font-size: 130%;">Comment</strong>
                        </label>
                        <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment[]" id="comment" value="<?= isset($locality->comment) ? $locality->comment : ''?>">
                    </div>
                </div>
                </div>
                
            
            <?php endforeach?>
            
<div id="addresses">

</div>

<script>
var num_address= <?=count($company->localities);?>;
function addAddress() {
  // Incrémenter le nombre d'adresses
 
 num_address++;
  // Créer un nouveau bloc d'adresse avec un identifiant unique
  var newAddress = `
    <div class="container">
      <button class="bg-sombre clair border-0 rounded px-2 mb- mt-3 ms- me- dropdown-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#adresse`+ num_address +`" aria-expanded="false" aria-controls="adresse`+ num_address +`">
        Adresse `+ num_address +`
      </button>
      <div class="collapse border-sombre border-top-0 border-start-0 border-end-0" id="adresse`+ num_address +`" data-address-id="`+ num_address +`">
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Ville</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city[]" id="city">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Code Postal</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode[]" id="zipcode">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Adresse</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address[]" id="address">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Numéro</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number[]" id="number">
        </div>
        <div class="container mt-4 position-relative">
          <label class="col ">
            <strong style="font-size: 130%;">Comment</strong>
          </label>
          <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment[]" id="comment">
        </div>
      </div>
    </div>
  `;

  // Ajouter le bloc d'adresse au HTML
  document.getElementById("addresses").innerHTML += newAddress;
}
</script>

            
        <div class="container">
            <div class="row mt-4">
                <label class="col ">
                    <strong style="font-size: 130%;">Visibilité</strong>
                </label>
                    <div class="col">
                        <input type="radio" id="public" class="btn-check" checked name="visibility" value="public">
                        <label for="public" class="btn">Public</label>
                    </div>
                    <div class="col">
                        <input type="radio" id="private" class="btn-check" name="visibility" value="private">
                        <label for="private" class="btn">Privé</label>
                    </div>
            </div>
        </div>
        
        <div class="row mt-5">
            
            <div class="col position-relative">
                <div class="btn-group position-absolute end-0" role="group">
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;" name="delete">Supprimer</button>
                    <button type="reset" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;" name="cancel">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;" name="edit">Modifier</button>
                </div>
            </div>
        </div>
    </form>
    <br>
    <br>
    <br>
</div>
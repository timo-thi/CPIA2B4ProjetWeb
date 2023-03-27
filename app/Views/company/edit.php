<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width:90%;height:max-content"><!--ou style="width: 40%; max-width=90vh;"-->
    <h1 class="sombre text-center">Modifier une entreprise</h1>
    <form action="" class="mx-auto" method="post" style="width:95%">
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
        <div class="adress_container">
            <?php foreach ($company->localities as $locality):?>
                <div class="future-colapse"> <!-- À modifier :+1: -->
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
            <?php endforeach?>
        </div>
        <!--pour la visibilité je pense mettre une radio mais je ne sais pas si c'est galère à recup pour le back
    je m'en remet donc entièrement à mon collèquqe et ami Tim parce qu'après tout c'est lui le plus beau-->
        <!-- Radio input about visibility of the company -->
        <label class="col ">
            <strong style="font-size: 130%;">Visibilité</strong>
        </label>
        <div class="row">
            <div class="col">
                <input type="radio" id="public" name="visibility" value="public" <?= $company->active == '1' ? 'checked' : '' ?>>
                <label for="public" class="claire">Public</label>
            </div>
            <div class="col">
                <input type="radio" id="private" name="visibility" value="private" <?= $company->active == '0' ? 'checked' : '' ?>>
                <label for="private" class="claire">Privé</label>
            </div>
        </div>
        
        <div class="row mt-5">
            <div class="col">
            
            </div>
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
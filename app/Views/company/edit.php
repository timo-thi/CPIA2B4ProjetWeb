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
                            <?= var_dump($el)?>

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
                <?php foreach ($company->localities as $locality):?> 
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Ville</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city" id="city" value="<?= isset($locality->city) ? $locality->city : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Code Postal</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode" id="zipcode" value="<?= isset($locality->zipcode) ? $locality->zipcode : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Adresse</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address" id="address" value="<?= isset($locality->street) ? $locality->street : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Numéro</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number" id="number" value="<?= isset($locality->number) ? $locality->number : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Comment</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment" id="comment" value="<?= isset($locality->comment) ? $locality->comment : ''?>">
                </div>
                <?php endforeach?>
                <!--
                <br>
                <br>
                <br>
                <br>
                <div class="container mt-4 position-relative">
                    <label for="lien" class="col ">
                        <strong style="font-size: 130%;">Lien</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="link2" id="lien" value="<?= isset($company->link) ? $company->link : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Ville</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="city2" id="city" value="<?= isset($localities->city) ? $localities->city : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Code Postal</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="zipcode2" id="zipcode" value="<?= isset($localities->zipcode) ? $localities->zipcode : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Adresse</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="address2" id="address" value="<?= isset($localities->street) ? $localities->street : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Numéro</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="number2" id="number" value="<?= isset($localities->number) ? $localities->number : ''?>">
                </div>
                <div class="container mt-4 position-relative">
                    <label class="col ">
                        <strong style="font-size: 130%;">Comment</strong>
                    </label>
                    <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="comment2" id="comment" value="<?= isset($localities->comment) ? $localities->city : ''?>">
                </div>
                        -->         
               <!--pour la visibilité je pense mettre une radio mais je ne sais pas si c'est galère à recup pour le back
            je m'en remet donc entièrement à mon collèquqe et ami Tim parce qu'après tout c'est lui le plus beau-->
                
               
                <div class="row mt-5">
                    <div class="col">
                   
                    </div>
                    <div class="col position-relative">
                    <div class="btn-group position-absolute end-0" role="group">
                    <!-- <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Supprimer</button> -->
                    <button type="reset" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Modifier</button>
                    </div>
                    
                    </div>
                    
                </div>
            </form>
            <br>
                            <br>
                            <br>
</div>
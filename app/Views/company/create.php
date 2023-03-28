<script src="../public/js/company_create.js"></script>
<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width:90%;height:max-content"><!--ou style="width: 40%; max-width=90vh;"-->
    <h1 class="sombre text-center">Ajouter une entreprise</h1>
    <?php if ($errors):?>
        <div class="alert alert-danger">
            Champ(s) manquant(s)!  
        </div>
    <?php endif; ?>
    <form class="mx-auto" method="post" style="width:95%">
        <div class="container mt-5 position-relative">
            <label for="nom" class="col ">
                <strong style="font-size: 130%;">Nom</strong>
            </label>
            <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="name" id="nom">
        </div>
        
        <div class="container mt-4 position-relative">
            <label for="activity" class="col ">
                <strong style="font-size: 130%;">Secteur d'activité</strong>
            </label>
            <select name="sector[]" id="activity" class="col border-1 rounded  position-absolute end-0" style="width: 40%;" multiple>
                <?php foreach ($annonces as $el):?>  
                <!--boucle foreach secteur
                    on doit pouvoir en choisir plusieurs donc selection multipple-->
                <option value="<?= $el->id_activity?>"><?php echo "{$el->name}" ?></option>
                <?php endforeach?>
            </select>
        </div>
        <br>
        <br>
        <div class="container mt-4 position-relative">
            <label for="lien" class="col ">
                <strong style="font-size: 130%;">Lien</strong>
            </label>
            <input type="text" class="col rounded position-absolute end-0" style="width: 40%;" name="link" id="lien">
        </div>
        <!-- 
            Partie à dupliquer et mettre dans des colapse
            avec un boutton + pour ajouter une collapse
            sûrement js pour ajouter une collapse

            tous les champs sont obligatoires sauf le commentaire
        -->
        
<div class="container">
<label class="col "> <strong style="font-size: 130%;">Ajouter une adresse:</strong> </label>

<button type="button" onclick="addAddress()" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3">+</button>
</div>
<div id="addresses">
</div>


        <!--pour la visibilité je pense mettre une radio mais je ne sais pas si c'est galère à recup pour le back
    je m'en remet donc entièrement à mon collèquqe et ami Tim parce qu'après tout c'est lui le plus beau-->
        
        <div class="container">
        <div class="row mt-4">
        <label class="col ">
            <strong style="font-size: 130%;">Visibilité</strong>
        </label>
            <div class="col">
                <input type="radio" id="public" class="btn-check" checked name="visibility" value="1">
                <label for="public" class="btn">Public</label>
            </div>
            <div class="col">
                <input type="radio" id="private" class="btn-check" name="visibility" value="0">
                <label for="private" class="btn">Privé</label>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col">
            </div>
            <div class="col position-relative">
                <div class="btn-group position-absolute end-0" role="group">
                    <button type="reset" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Ajouter</button>
                </div>
            </div>
        </div>
        </div>
    </form>
</div>

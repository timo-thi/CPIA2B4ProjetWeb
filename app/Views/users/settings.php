<div class=" bg-clair rounded mx-auto mt-5 p-2 " style="width: 40%;">
    <div class="">
        <h1 class="sombre text-center">Changez votre mot de passe</h1>
        <form method="post">
            <?php if ($errors):?>
                <div class="alert alert-danger">
                    <p>Champ(s) Manquant(s)</p>
                </div>
            <?php endif;?>
            <?php if ($errors2):?>
                <div class="alert alert-danger">
                    <p>Mot de passe Incorrecte</p>
                </div>
            <?php endif;?>
            <div class="row mt-5">
                <label for="password" class="col ms-5 ">
                    <strong style="font-size: 130%;">Mot de passe actuel</strong>
                </label>
                <input type="password" class="col-4 me-5 rounded" name="password" id="password">
            </div>
            <div class="row mb-4 mt-4">
                <label for="pwd" class="col ms-5 ">
                    <strong style="font-size: 130%;">Nouveau  mot de passe</strong>
                </label>
                <input type="password" class="col-4 me-5 rounded" name="pwd" id="pwd">
            </div>
            <div class="row mb-4 mt-4">
                <label for="conf" class="col ms-5 ">
                    <strong style="font-size: 130%;">Confirmation</strong>
                </label>
                <input type="password" class="col-4 me-5 rounded" name="conf" id="conf">
            </div>
            <div class="row justify-content-center">
                <input class="valider nav-link rounded p-2" type="submit" name="edit" value="Modifier">
                <input class="valider nav-link rounded p-2" type="reset" name="cancel" value="Annnuler">
            </div>
        </form>
    </div>
</div>
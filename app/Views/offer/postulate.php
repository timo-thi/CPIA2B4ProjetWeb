

<form method="post">
    <?php if ($errors):?>
	    <div class="alert alert-danger">
		    Fichier(s) manquant(s)
	    </div>
    <?php endif; ?>
    <div class="container mt-5  bg-clair rounded-3  di pe-1" style="width:50vh;height:30vh;">
    <div class="row">
    <label> <strong style="font-size:130%">CV</strong></label>
    <input type="file" name="CV" id="CV">
	<label class="mt-4"><strong style="font-size:130%">Lettre de Motivation</strong></label>
    <input type="file" name="LM" id="LM">
    </div>
    <div class="row position-relative" >
    <div class="position-absolute end-0 di mt-3" style="height:max-content;">
	<input type="reset" class="bg-sombre border-0 rounded-2 px-2 me-2 clair" name="cancel" value="Annuler">
    <input type="submit" class="bg-sombre border-0 rounded-2 px-2 me-2 clair" name="postulate" value="Postuler">
    </div>
</div>
    
    </div>

</form>








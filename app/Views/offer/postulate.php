<form action="" method="post">
    <?php if ($errors):?>
	    <div class="alert alert-danger">
		    Fichier(s) manquant(s)
	    </div>
    <?php endif; ?>
    <label>CV</label>
    <input type="file" name="CV" id="CV" value="CV">
	<label>Lettre de Motivation</label>
    <input type="file" name="LM" id="LM" value="LM">

    <input type="submit" name="postulate" value="Postuler">
	<input type="reset" name="cancel" value="Annuler">

</form>







<form action="" method="post">
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
    <label for="password">Ancien mot de passe<input type="password" name="password" id="password"></label>
	<label for="pwd">Nouveau mot de passe<input type="password" name="pwd" id="pwd"></label>
	<label for="conf">Confirmation<input type="password" name="conf" id="conf"></label>
    <br>
    <input type="submit" name="edit" value="Modifier">
	<input type="reset" name="cancel" value="Annnuler">
</form>
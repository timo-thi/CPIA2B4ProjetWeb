<div class="bg-clair">
	<h1>Ajouter un utilisateur</h1>
	<form action="" method="post">
		<label for="lname">Nom<input type="text" name="lname" id="lname" placeholder="Ex : Dupond'" value="<?= isset($profile->lname) ? $profile->lname : ''?>"></label>
		<label for="fname">Prénom<input type="text" name="fname" id="fname" placeholder="Ex : Antoine'" value="<?= isset($profile->fname) ? $profile->fname : ''?>"></label>
		<label for="email">E-mail<input type="email" name="email" id="email" placeholder="Ex : nom.prenom@viacesi.fr'" value="<?= isset($profile->email) ? $profile->email : ''?>"></label>
		<?php if ($errors):?>
			<div class="alert alert-danger">
				<p>Veuiller entrer des identifiants valides</p>
			</div>
		<?php endif;?>
		<label for="pwd">Mot de passe<input type="password" name="pwd" id="pwd"></label>
		<label for="conf">Confirmation<input type="password" name="conf" id="conf"></label>
		<!-- Promo si étudiant ou pilote -->
		<?php if (!($profile->id_roles == 1)): ?>
			<label for="prom">Promotion
				<select name="prom" id="prom">
					<option value="0" <?= (!isset($profile->id_prom) || $profile->id_prom == 0 || $profile->id_prom == null) ? 'selected' : ''?>>Choisissez une option</option>
					<?php foreach ($promos as $promo): ?>
						<option value="<?= $promo->id_prom ?>" <?= (isset($profile->id_prom) && $profile->id_prom == $promo->id_prom) ? 'selected' : ''?>><?= $promo->name ?></option>
					<?php endforeach;?>
				</select>
			</label>
		<?php endif; ?>
		<input type="hidden" name="id_profile" value="<?= $profile->id_profile?>">

		<input type="submit" value="Ajouter">
		<input type="reset" value="Annnuler">
	</form>
</div>
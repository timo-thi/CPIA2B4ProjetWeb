<div class="bg-clair">
	<h1>Ajouter un utilisateur</h1>
	<form action="" method="post">
		<label for="lname">Nom<input type="text" name="lname" id="lname" placeholder="Ex : Dupond" value="<?= isset($_POST['lname']) ? $_POST['lname'] : ''?>"></label>
		<label for="fname">Prénom<input type="text" name="fname" id="fname" placeholder="Ex : Antoine" value="<?= isset($_POST['fname']) ? $_POST['fname'] : ''?>"></label>
		<label for="email">E-mail<input type="email" name="email" id="email" placeholder="Ex : nom.prenom@viacesi.fr" value="<?= isset($_POST['email']) ? $_POST['email'] : ''?>"></label>
		<?php if ($errors):?>
			<div class="alert alert-danger">
				<p>Veuiller entrer des identifiants valides</p>
			</div>
		<?php endif;?>
		<label for="pwd">Mot de passe<input type="password" name="pwd" id="pwd"></label>
		<label for="conf">Confirmation<input type="password" name="conf" id="conf"></label>
		<!-- Role si admin ou pilote -->
		<label for="role">Role
				<?php if ($_SESSION['role'] == 2): ?>
			<select name="role" id="role">
				<option value="3" selected hidden>Etudiant</option>
				<?php elseif ($_SESSION['role'] == 1): ?>
			<select name="role" id="role">
				<option value="0" <?= (!isset($_POST['role']) || $_POST['role'] == 0) ? 'selected' : ''?>>Choisissez une option</option>
				<option value="1" <?= (isset($_POST['role']) && $_POST['role'] == 1) ? 'selected' : ''?>>Administrateur</option>
				<option value="2" <?= (isset($_POST['role']) && $_POST['role'] == 2) ? 'selected' : ''?>>Pilote</option>
				<option value="3" <?= (isset($_POST['role']) && $_POST['role'] == 3) ? 'selected' : ''?>>Etudiant</option>
				<?php endif;?>
			</select>
		</label>
		<!-- Promo si étudiant ou pilote -->
		<label for="prom">Promotion
			<select name="prom" id="prom" <?= (isset($_SESSION['role']) && $_SESSION['role'] == 1) ? 'multiple' : ''?>>
				<option value="0" <?= (!isset($_POST['prom']) || $_POST['prom'] == 0) ? 'selected' : ''?>>Choisissez une option</option>
				<?php foreach ($promos as $promo): ?>
					<option value="<?= $promo->id_prom ?>" <?= (isset($_POST['prom']) && $_POST['prom'] == $promo->id_prom) ? 'selected' : ''?>><?= $promo->name ?></option>
				<?php endforeach;?>
			</select>
		</label>

		<input type="submit" value="Ajouter">
		<input type="reset" value="Annnuler">
	</form>
</div>
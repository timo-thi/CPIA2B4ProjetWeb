<div class="bg-clair">
	<form action="" method="post">
		<label for="title">Titre de l'offre<input type="text" name="title" id="title" placeholder="Entrez le titre de l'offre"></label>

		<label for="activities">Entreprise</label>
		<select name="activities" id="activities">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($companies as $company) {
				echo '<option value="' . $company->id_company . '">' . $company->name . '</option>';
			}?>
		</select>

		<label for="activities">Adresse</label>
		<select name="activities" id="activities">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($companies as $company) {
				echo '<option value="' . $company->id_company . '">' . $company->name . '</option>';
			}?>
		</select>

		<label for="email">E-mail<input type="email" name="email" id="email" placeholder="Entrez l'email de contact'"></label>
		<label for="tel">Téléphone<input type="tel" name="tel" id="tel" placeholder="Entrez le téléphone de contact"></label>
		<label for="gratification">Gratification<input type="number" name="gratification" id="gratification" placeholder="Entrez la gratifiction"></label>
		<label for="description">Description<textarea name="description" id="description" cols="30" rows="10" placeholder="Entrez la description"></textarea></label>

		<label for="activities">Secteurs d'activité</label>
		<select name="activities" id="activities">
			<option value="0">-- Choisissez une option --</option>
			<option value="1">HTML</option>
			<option value="2">CSS</option>
			<option value="3">PHP</option>
			<option value="4">JS</option>
			<option value="5">SQL</option>
		</select>

		<label for="skills">Compétences</label>
		<select name="skills" id="skills">
			<option value="0">-- Choisissez une option --</option>
			<option value="1">HTML</option>
			<option value="2">CSS</option>
			<option value="3">PHP</option>
			<option value="4">JS</option>
			<option value="5">SQL</option>
		</select>

		<div class="visibility">
			<label for="visibility">Visibilité</label>
			<input type="radio" name="visibility" id="visibility" value="1" checked>
			<label for="visibility">Publique</label>
			<input type="radio" name="visibility" id="visibility" value="0">
			<label for="visibility">Privée</label>
		</div>

		<input type="submit" value="Ajouter">
		<input type="reset" value="Annuler">
	</form>
</div>
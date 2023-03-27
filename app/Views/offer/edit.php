<div class="bg-clair">
	<h1>Ajouter un offre</h1>
	<h5>
		Entreprise : <?= $company->name?>
	</h5>
	<form action="" method="post">
		<label for="title">Titre de l'offre<input type="text" name="title" id="title" placeholder="Entrez le titre de l'offre"></label>

		<label for="locality">Adresse</label>
		<select name="locality" id="locality">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($localities as $company):?>
				<option value='<?= $company->id_localities?>'><?= "{$company->number} {$company->street} - {$company->city} ({$company->zipcode})"?></option>";
			<?php endforeach?>
		</select>

		<label for="startdate">Date de début<input type="date" name="startdate" id="startdate"></label>
		<label for="period">Durée<input type="text" name="period" id="period" placeholder="Ex : entre 35 jours et 4mois"></label>
		<label for="email">E-mail<input type="email" name="email" id="email" placeholder="Entrez l'email de contact"></label>
		<label for="tel">Téléphone<input type="tel" name="tel" id="tel" placeholder="Entrez le téléphone de contact"></label>
		<label for="wage">Gratification<input type="text" name="wage" id="wage" placeholder="Ex : 750€ (Rapporter au mois)"></label>
		<label for="amount">Nombre de places<input type="number" name="amount" id="amount" placeholder="Ex : 4"></label>
		<label for="description">Description<textarea name="description" id="description" cols="30" rows="10" placeholder="Donnez plus de détails"></textarea></label>

		<label for="activity">Secteurs d'activité</label>
		<select name="activity" id="activity">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($activities as $activity): ?>
				<option value="<?= $activity->id_activity?>"><?= $activity->name?></option>
			<?php endforeach; ?>
		</select>

		<label for="skills">Compétences</label>
		<select name="skills[]" id="skills" multiple>
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($skills as $skill): ?>
				<option value="<?= $skill->id_skill?>"><?= $skill->name?></option>
			<?php endforeach; ?>
		</select>

		<div class="visibility">
			<label for="visibility">Privé</label>
			<input type="radio" name="visibility" id="visibility" value="1">
			<label for="visibility">Publique</label>
			<input type="radio" name="visibility" id="visibility" value="0" checked>
		</div>
		<input type="hidden" name="id_offer" value="<?= $offer->id_offer?>">
		<input type="submit" name="delete" value="Supprimer">

		<input type="submit" name="edit" value="Ajouter">
		<input type="reset" name="cancel" value="Annuler">
	</form>
</div>
<div class="container mt-5 bg-clair rounded-3 mb-5" style="width: 60vh; max-width=90%;height:max-content">
	<h1 class="sombre text-center">Modifier un offre</h1>
	<h5>
		Entreprise : <?= $company->name?>
	</h5>
	<form action="" method="post">
	<div class="container mt-4 position-relative">
		<label for="title"><strong style="font-size: 130%;">Titre de l'offre</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="text" name="title" id="title" placeholder="Entrez le titre de l'offre" value="<?= $offer->name?>"></label>
		<div class=" mt-4 ">
		<label for="locality"><strong style="font-size: 130%;">Adresse</strong></label>
		<select name="locality" class="col rounded position-absolute end-0" id="locality">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($localities as $locality):?>
				<option value='<?= $locality->id_localities?>' <?= ($locality->id_localities == $offer->id_localities) ? 'selected' : ''?>><?= "{$locality->number} {$locality->street} - {$locality->city} ({$locality->zipcode})"?></option>";
			<?php endforeach?>
		</select></div>

		<div class=" mt-4 "><label for="startdate"><strong style="font-size: 130%;">Date de début</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="date" name="startdate" id="startdate" value="<?=$offer->startdate?>"></label></div>
		<div class=" mt-4 "><label for="period"><strong style="font-size: 130%;">Durée</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="text" name="period" id="period" placeholder="Ex : entre 35 jours et 4mois" value="<?= $offer->period?>"></label></div>
		<div class=" mt-4 "><label for="email"><strong style="font-size: 130%;">E-mail</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="email" name="email" id="email" placeholder="Entrez l'email de contact" value="<?= $offer->contact_mail?>"></label></div>
		<div class=" mt-4 "><label for="tel"><strong style="font-size: 130%;">Téléphone</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="tel" name="tel" id="tel" placeholder="Entrez le téléphone de contact" value="<?= $offer->telephone?>"></label></div>
		<div class=" mt-4 "><label for="wage"><strong style="font-size: 130%;">Gratification</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="text" name="wage" id="wage" placeholder="Ex : 750€ (Rapporter au mois)" value="<?= $offer->wage?>"></label></div>
		<div class=" mt-4 "><label for="amount"><strong style="font-size: 130%;">Nombre de places</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="number" name="amount" id="amount" placeholder="Ex : 4"  value="<?= $offer->amount?>"></label></div>
		<div class=" mt-4 "><label for="description"> <strong style="font-size: 130%;">Description</strong></label><br>
	<textarea class="col rounded" style="width: 100%;"name="description" id="description" cols="3" rows="5" placeholder="Donnez plus de détails"><?= ($offer->descr == '' || $offer->descr == null) ? '' : $offer->descr?></textarea></div>
	<div class="mt-4">
		<label for="activity"><strong style="font-size: 130%;">Secteurs d'activité</strong></label>
		<select name="activity" class="col rounded position-absolute end-0" id="activity">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($activities as $activity): ?>
				<option value="<?= $activity->id_activity?>" <?= ($activity->id_activity == $offer->id_activity) ? 'selected' : ''?>><?= $activity->name?></option>
			<?php endforeach; ?>
		</select>
		</div>
		<div class="mt-4">
		<label for="skills"><strong style="font-size: 130%;">Compétences</strong></label> <br>
		<select name="skills[]" class="col rounded" id="skills" multiple style="width: 100%;">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($skills as $skill): ?>
				<option value="<?= $skill->id_skill?>" <?= (in_array($skill->id_skill, $offer->skills)) ? 'selected' : ''?>><?= $skill->name?></option>
			<?php endforeach; ?>
		</select>
		</div>
		<div class=" mt-4 ">
			<div class="row mt-4">
			<label class="col ">
				<strong style="font-size: 130%;">Visibilité</strong>
			</label>
				<div class="col">
					<input type="radio" id="public" class="btn-check" autocomplete="off" checked name="visibility" value="1" checked>
					<label for="public" class="btn bg-sombre">Public</label>
				</div>
				<div class="col">
					<input type="radio" id="private" class="btn-check" autocomplete="off" name="visibility" value="0">
					<label for="private" class="btn bg-sombre">Privé</label>
				</div>
			</div>
		</div> 
		<div class="postion-relative">
		<input type="hidden" name="id_offer" value="<?= $offer->id_offer?>">
		<input class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" type="submit" name="delete" value="Supprimer">
		<div class="btn-group position-absolute end-0" role="group">
		<button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
        <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Ajouter</button>
		</div>
		</div>
		</div>

	</form>
</div>
<div class="container mt-5 bg-clair rounded-3" style="width: 60vh; max-width=90%;height:max-content">
<h1 class="sombre text-center">Ajouter une offre</h1>
	<h5>
		Entreprise : <?= $company->name?>
	</h5>
	<form action="" method="post">
		<div class="container mt-4 position-relative">
		<label for="title"><strong style="font-size: 130%;">Titre de l'offre</strong><input class="col rounded position-absolute end-0" style="width: 40%;"type="text" name="title" id="title" placeholder="Entrez le titre de l'offre"></label>
		
		<div class=" mt-4">
		<label for="locality" ><strong style="font-size: 130%;">Adresse</strong></label>
		<select name="locality" class="col rounded position-absolute end-0" id="locality">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($localities as $company):?>
				<option value='<?= $company->id_localities?>'><?= "{$company->number} {$company->street} - {$company->city} ({$company->zipcode})"?></option>";
			<?php endforeach?>
		</select>
		</div>
		
		<label for="startdate" class="mt-4"> <strong style="font-size: 130%;">Date de début</strong> <input type="date" class="col rounded position-absolute end-0" style="width: 40%;"name="startdate" id="startdate"></label>
		<div class=" mt-4 "><label for="period"> <strong style="font-size: 130%;">Durée</strong><input type="text" class="col rounded position-absolute end-0" style="width: 40%;"name="period" id="period" placeholder="Ex : entre 35 jours et 4mois"></label></div>
		<div class=" mt-4 "><label for="email"> <strong style="font-size: 130%;">E-mail</strong><input type="email" class="col rounded position-absolute end-0" style="width: 40%;"name="email" id="email" placeholder="Entrez l'email de contact"></label></div>
		<div class=" mt-4 "><label for="tel"> <strong style="font-size: 130%;">Téléphone</strong><input type="tel" class="col rounded position-absolute end-0" style="width: 40%;"name="tel" id="tel" placeholder="Entrez le téléphone de contact"></label></div>
		<div class=" mt-4 "><label for="wage"> <strong style="font-size: 130%;">Gratification</strong><input type="text" class="col rounded position-absolute end-0" style="width: 40%;"name="wage" id="wage" placeholder="Ex : 750€ (Rapporter au mois)"></label></div>
		<div class=" mt-4 "><label for="amount"> <strong style="font-size: 130%;">Nombre de places</strong><input type="number" class="col rounded position-absolute end-0" style="width: 40%;"name="amount" id="amount" placeholder="Ex : 4"></label></div>
		<div class=" mt-4 "><label for="description"> <strong style="font-size: 130%;">Description</strong></label><br>
	<textarea class="col rounded" style="width: 100%;"name="description" id="description" cols="3" rows="5" placeholder="Donnez plus de détails"></textarea></div>
		
		<div class="mt-4">
		<label for="activity"><strong style="font-size: 130%;">Secteurs d'activité</strong></label>
		<select name="activity" class="col rounded position-absolute end-0" id="activity">
			<option value="0">-- Choisissez une option --</option>
			<?php foreach ($activities as $activity): ?>
				<option value="<?= $activity->id_activity?>"><?= $activity->name?></option>
			<?php endforeach; ?>
		</select>
		</div>

		<div class=" mt-4 mb-4 ">
		<label for="skills"><strong style="font-size: 130%;">Compétences</strong></label> <br>
		<select name="skills[]" class="col rounded" id="skills" multiple style="width:100%">
			<option value="0" class="">-- Choisissez une option --</option>
			<?php foreach ($skills as $skill): ?>
				<option value="<?= $skill->id_skill?>"><?= $skill->name?></option>
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
		</div>

		<div class="row mt-5 mb-5">
                    <div class="col">
                    </div>
                    <div class="col position-relative">
                    <div class="btn-group position-absolute end-0" role="group">
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3" style="width: fit-content;">Annuler</button>
                    <button type="submit" class="bg-sombre clair border-0 rounded px-2 mb-2 mt-3 ms-2 me-3" style="width: fit-content;">Ajouter</button>
                    </div>
                    
                    </div>
                    
                </div>
	</form>
</div>


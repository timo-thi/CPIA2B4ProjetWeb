<script src="../public/js/student_details.js"></script>
<div class="container mt-3 " style="max-width:80%">
	<?php
	$filtre1 = 'Nom';
    $filtre2 = 'Prénom';
    $filtre3 = 'Promo';
    $filtre4 = 'Progression';

    $HideFilter1 = '';
    $HideFilter2 = '';
    $HideFilter3 = '';
    $HideFilter4 = '';

	require '../app/Views/templates/Filter.php';
	?>
	<?php foreach ($profiles as $profile):?>

		<div class="col mt-3">
			<div class="card bg-clair mb-3" style="max-width: 100%;">
				<div class="row g-0 ">
					<div class="col-md-2 my-auto mx-auto" style="max-width: 150px;">
						<img src="<?= (isset($profile->photo)) ? $profile->photo : '../app/Views/assets/imgs/oeil_fond_fffaf0.png'?>" class="img-fluid rounded-start" alt="..." >
					</div>

					
					<!--Les infos en entête-->

					<div class="col-md-10">
						<div class="card-body sombre row">
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$profile->lname?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$profile->fname?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$profile->email?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$profile->prom?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$profile->accepted?></p>
							</div>
							<div class="col text-end list-item" id="<?= $profile->id_profile ?>">
								<button class="rounded-4 but clair px-2 py-2" type="button" data-bs-toggle="collapse" data-bs-target="#stu<?= $profile->id_profile ?>" aria-expanded="false" aria-controls="stu<?= $profile->id_profile ?>" style="width:max-content;">
									Voir les candidatures
								</button>
							</div>
						</div>
					</div>

					
					<!--Les infos qui apparaissent-->
					<div class="collapse" id="stu<?= $profile->id_profile ?>">
						<div class="row sombre">
							<div class="col">
								<p class="card-text">Chargement</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<?php endforeach?>


	<!--ajouter les autres cadres pilotes (en changeant le nom du bouton collapse)-->
</div>

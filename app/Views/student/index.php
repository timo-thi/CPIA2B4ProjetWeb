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

		
	<?php endforeach?>

	
	<?php

// Configuration
$items_per_page = 6; // Nombre de pilotes par page

// Connexion à la base de données

$db = new PDO("mysql:host=localhost;dbname=web", "root", "");

// Récupération du nombre total d'offres
$total_items = $db->query("SELECT COUNT(*) FROM profile")->fetchColumn();

// Calcul du nombre de pages
$total_pages = ceil($total_items / $items_per_page);

// Récupération du numéro de la page courante
$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

// Vérification de la validité du numéro de page
if ($current_page < 1 || $current_page > $total_pages) {
	$current_page = 1;
}

// Calcul des bornes LIMIT pour la requête SQL
$offset = ($current_page - 1) * $items_per_page;
$limit = $items_per_page;

// Exécution de la requête SQL avec pagination
$stmt = $db->prepare("
select * from VIEW_STUDENT group by id_profile
	LIMIT :offset, :limit;
");
$stmt->bindParam(":offset", $offset, PDO::PARAM_INT);
$stmt->bindParam(":limit", $limit, PDO::PARAM_INT);
$stmt->execute();

// Affichage des résultats
while ($row = $stmt->fetch()) { ?>
	<div class="col mt-3">
			<div class="card bg-clair mb-3" style="max-width: 100%;">
				<div class="row g-0 ">
					<div class="col-md-2 my-auto mx-auto" style="max-width: 150px;">
						<img src="<?= (isset($row['photo'])) ? $row['photo'] : '../app/Views/assets/imgs/oeil_fond_fffaf0.png'?>" class="img-fluid rounded-start" alt="..." >
					</div>

					<!--Les infos en entête-->

					<div class="col-md-10">
						<div class="card-body sombre row">
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$row['lname']?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$row['fname']?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$row['email']?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$row['prom']?></p>
							</div>
							<div class="col text-center mb-auto mt-auto">
								<p class="card-text"><?=$row['accepted']?></p>
							</div>
							<div class="col text-end list-item" id="<?= $row['id_profile'] ?>">
								<button class="rounded-4 but clair px-2 py-2" type="button" data-bs-toggle="collapse" data-bs-target="#stu<?= $row['id_profile'] ?>" aria-expanded="false" aria-controls="stu<?= $profile->id_profile ?>" style="width:max-content;">
									Voir les candidatures
								</button>
							</div>
						</div>
					</div>

					
					<!--Les infos qui apparaissent-->
					<div class="collapse" id="stu<?= $row['id_profile'] ?>">
						<div class="row sombre">
							<div class="col">
								<p class="card-text">Chargement</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<?php
}

// Affichage de la pagination
if ($total_pages > 1) {
	echo '<div class=" row justify-content-center ms-5">';
	$precedent= "?p=student.index&page=" . ($current_page - 1);
	echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$precedent}\"><</a></div>";
	for ($i = 1; $i <= $total_pages; $i++) {
		$class = ($i == $current_page) ? "active" : "";
		$url = "?p=student.index&page=" . $i;
		echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$url}\">{$i}</a></div>";
	}
	$suivant= "?p=student.index&page=" . ($current_page + 1);
	echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$suivant}\">></a></div>";
	echo '</div>';
}


?>



	<!--ajouter les autres cadres pilotes (en changeant le nom du bouton collapse)-->
</div>

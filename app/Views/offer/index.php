<script src="../public/js/offer_details.js"></script>
<div class="container mt-3  " style="max-width:90%">
	<?php
	$filtre1 = 'Rémunération';
	$filtre2 = 'Secteur';
	$filtre3 = 'Entreprise';
	$filtre4 = '';

	$HideFilter1 = '';
	$HideFilter2 = '';
	$HideFilter3 = '';
	$HideFilter4 = 'd-none';

	require '../app/Views/templates/Filter.php';
	?>
  <div class="row mt-3 position-relative">

    <div class=" col-6 ">
      <div class="partieScrollable">
	  <?php foreach ($annonces as $el):?>

			<div class="row ms-5 dropend">
				<div class="card bg-clair mb-3 list-item " style="max-width: 100%;" id="<?= $el->id_offer?>">
					<div class="row g-0">
						<div class="col-md-4 my-auto" >
							<img src="https://cdn.discordapp.com/attachments/1072440528026738688/1090227429697650698/offre.png" class="img-fluid rounded-start" alt="..." >
						</div>
						<div class="col-md-7">
							<div class="card-body sombre di" >
							<h5 class="card-title"> <?= $el->name ?> </h5>
							<p class="card-text"><?php echo "{$el->company} - {$el->city} ({$el->zipcode})"; ?> </p>
							</div>
						</div>
					</div>
					<button class="dropdown-toggle"></button>
				</div>
	  		</div>
			<?php endforeach; ?>
		<?php
		// Affichage de la pagination
		if ($total_pages >= 1) {
			echo '<div class=" row justify-content-center ms-5">';
			$precedent= "?p=offer.index&page=" . ($current_page - 1);
			echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$precedent}\">&lt;</a></div>";
			for ($i = 1; $i <= $total_pages; $i++) {
				$class = ($i == $current_page) ? "active" : "";
				$url = "?p=offer.index&page=" . $i;
				echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$url}\">{$i}</a></div>";
			}
			$suivant= "?p=offer.index&page=" . ($current_page + 1);
			echo "<div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href=\"{$suivant}\">></a></div>";
			echo '</div>';
		}
		?>
      </div>
    </div>
    <div class="col-6 position-absolute end-0">
      <div class="position-absolute ms-2 end-0">
      <?php require '../app/Views/templates/DetailOffre.php';?>
      </div>
    </div>
  </div>
</div>

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

			<div class="row ms-5">
				<div class="card bg-clair mb-3 " style="max-width: 100%;">
					<div class="row g-0">
						<div class="col-md-4 my-auto" >
							<img src="<?= $el->link?>" class="img-fluid rounded-start" alt="..." >
						</div>
						<div class="col-md-7">
							<div class="card-body sombre di" >
							<h5 class="card-title"> <?= $el->name ?> </h5>
							<p class="card-text"><?php echo "{$el->company} - {$el->city} ({$el->zipcode})"; ?> </p>
							</div>
						</div>
					</div>
				</div>
			</div>

		<?php endforeach?>
            <!--Pagination-->
      </div>
    </div>

  
    <div class="col-6 position-absolute end-0">
      <div class="position-absolute ms-2 end-0">
      <?php require '../app/Views/templates/DetailOffre.php';?>
      </div>
    </div>
  

  </div>
</div>
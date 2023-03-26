<script src="../public/js/offer_details.js"></script>
<div class="row g- justify-content-around mt-3 mb-">
  <div class="col-5 col-rows-1 col-rows-md-2 g-">
    
  <?php foreach ($annonces as $el):?>

	<div class="row ms-5">
		<div class="card bg-clair mb-3 " style="max-width: 100%;">
			<div class="row g-0">
				<div class="col-md-4 my-auto" >
					<img src="<?//= $el->link?>" class="img-fluid rounded-start" alt="..." >
				</div>
				<div class="col-md-7">
					<div class="card-body sombre di" >
					<h5 class="card-title"> <?= $el->offer ?> </h5>
					<p class="card-text"><?php echo "{$el->company}"; ?> </p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<?php endforeach?>

  </div>
  <div class="col-6 position-absolute end-0">
      <div class="position-absolute ms-2 end-0">
      <?php require '../app/Views/templates/DetailOffre.php';?>
      </div>
    </div>
</div>
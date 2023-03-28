<?php echo "Nombre d'étudiants CESI acceptés :"?>
    <div class="row mt-4 text-center">
        <figure class="figure">
            <img src="https://cdn.discordapp.com/attachments/1088413788342071388/1088414218056892478/oeil_fond_2c2c2c.png" class="figure-img img-fluid rounded border border-light" style="width: 90%;"
                alt="...">
        </figure>
    </div>

<div class="container">
<div class="row g-4 justify-content-around">
    <div class="col-5 col-rows-1 col-rows-md-2 g-4">
        <?php foreach ($offer as $count=>$el):?>
            <?php if ( $count >2) break;?>
            <div class="row ms-5">
				<div class="card bg-clair mb-3 list-item " style="max-width: 100%;" id="<?= $el->id_offer?>">
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
        <?php endforeach;?>
    
    </div>

    <div class="col-5 col-rows-1 col-rows-md-2 g-4">
        <?php foreach ($comp as $count=>$el) :?>
            <?php if ($count >2) break;?>
            <div class="row ms-5">
                <div class="card bg-clair mb-3 list-item" style="max-width: 100%;" id="<?= $el->id_company?>">
                  <div class="row g-0 dib">
                    <div class="col-md-4 my-auto di">
                        <img src="https://cdn.discordapp.com/attachments/1072440528026738688/1088735990673317978/company.png" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-7">
                    <div class="card-body sombre di" >
                        <h5 class="card-title"> <?= $el->name ?> </h5>
                        <p class="card-text"><?php echo "Nombre d'étudiants CESI acceptés : {$el->cesi_accepted}"; ?> </p>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        <?php endforeach;?>
    </div>
</div>
</div>


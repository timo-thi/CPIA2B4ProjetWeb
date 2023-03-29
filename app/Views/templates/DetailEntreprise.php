<div class="card bg-clair" style="max-width:100%; min-height:80vh">
    <div class="row">
        <div class="card-title ">
            <div class="container">
                <div class="row">
                    <div class="col-md-auto">
                        <h1 class="sombre " style="width: max-content;" id="com-name"><?= $first->name?></h1>
                    </div>
                    
                    <?php if ($_SESSION['role'] != 3):?>
                        <br>
                        <div class="col-md-auto ">
                            <div class="btn-group position-absolute end-0 mt-2" role="group" >
                                <button class="active border-0 bg-sombre clair rounded " style="width: max-content;" onclick="window.location.href='<?= '?p=company.create&id=' . $first->id_company?>'" id="com-new_offer">Ajouter une offre</button>
                            </div>
                        </div>
                    <?php endif?>
                </div>
                <div class="row">
                    <div class="col-md-auto ">
                    
                        <div class="btn-group position-absolute end-0 mt-2" role="group" >
                        <button id="com-rate" class="active border-0 bg-sombre clair rounded " style="width: max-content;" onclick="window.location.href='<?= '?p=company.rate&id=' . $first->id_company?>'"><i class="fa-regular fa-star-half-stroke" style="color: #fffaf0;"> </i></button>
                            <?php if ($_SESSION['role'] != 3):?>
                                <button class="active border-0 bg-sombre clair rounded " style="width: max-content;" onclick="window.location.href='<?= '?p=company.edit&id=' . $first->id_company?>'" id="com-edit"><i class="fa-regular fa-pen-to-square"> </i></button>
                            <?php endif?>
                            <button class="active border-0 bg-sombre clair rounded ms-2 me-3" style="width: max-content;" onclick="window.location.href='?p=offer.index'">Voir les offres</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="card-body">
            <div class="container">
                    <ul class="navbar-nav">
                        <li>
                            <a class="nav-link" href="<?= $first->link?>" id="com-link"> Lien vers le site</a>
                        </li>
                        <li id="com-cesi_accepted">Nombres d'élèves CESI déjà acceptés en stage : <?= $first->cesi_accepted?></li>
                        
                    </ul>
                
            </div>
        </div>
        <div class="card-body">
            <div class="container">
                <h5 class="but clair p-1" style="width:max-content">Secteur d'activité:</h5>
                <ul class="navbar-nav border-sombre rounded-4 ps-2" id="com-activities">
                    <!--faire une boucle-->
                    <?php if (!empty($first->activities)):?>
                        <?php foreach ($first->activities as $el):?>
                            <li><p class='sombre'><?= $el->name?></p></li>
                        <?php endforeach?>
                    <?php else :?>
                        <li><p class="sombre"> Aucune activité</p></li>
                    <?php endif?>
                    </ul>
                

                    <h5 class="but clair p-1 mt-4" style="width:max-content">Localisations</h5>
                    <ul class="navbar-nav border-sombre rounded-4 ps-2" id="com-localities">
                        <?php if (!empty($first->localities)):?>
                            <?php foreach ($first->localities as $el):?>
                                <li><p class='sombre'><?= $el->number?> <?= $el->street?> - <?= $el->city?> (<?= $el->zipcode?>)</p></li>
                            <?php endforeach?>
                        <?php else :?>
                            <li><p class='sombre'> Aucune localisation</p></li>
                        <?php endif?>
                    </ul>

                    <h5 class="but clair p-1 mt-4" style="width:max-content">Commentaires</h5>
                    <div class="">
                        <div class="border-sombre rounded-4 px-2" id="com-rates">
                            <?php if (!empty($first->rates)):?>
                                <?php foreach ($first->rates as $el):?>
                                    <p class='sombre'>
                                        <strong>Notes : <?= $el->rating?></strong><br><?= $el->comment?>
                                    </p>
                                <?php endforeach?>
                            <?php else :?>
                                <p class='sombre'> Aucun commentaire</p>
                            <?php endif?>
                        </div>
                    </div>
            </div>
        </div>
       


            
    </div>

    



</div>
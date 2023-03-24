<div class="card bg-clair" style="max-width:100%; min-height:80vh">

    <div class="row">
        <div class="card-title ">
            <div class="container">
                <div class="row">
                    <div class="col-md-auto">
                        <h1 class="sombre " style="width: max-content;"><?= $first->name?></h1>
                    </div>
                    
                    <div class="col-md-auto ">
                    
                        <div class="btn-group position-absolute end-0 mt-2" role="group" >
                              <button class="active border-0 bg-sombre clair rounded " style="width: max-content;"> Like</button>
                              <button class="active border-0 bg-sombre clair rounded ms-2 me-3" style="width: max-content;"> Postuler</button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div> 
        <div class="card-body">
            <div class="container">
            <div class="row">
                <div class="col col-lg-1">
                </div>
    
                 <div class="col-md-auto " >
                    <h3 class="sombre"> <?= $first->company?></h3>
                    <ul class="navbar-nav">
                        <li><?= $first->address?></li>
                        <li><?= $first->city?> (<?= $first->zipcode?>)</li>
                        <li><a href="<?= $first->link?>" class="nav-link sombre">Site web</a></li>
                    </ul>
                </div>
                <div class="col-md-auto ">
                     <ul class="navbar-nav align-self-end">
                        <li><!--logoMail--> <?= $first->contact_mail?></li>
                        <li><!--logoPhone--> <?= $first->telephone?></li>
                    </ul>
                </div>

                
                </div>
            </div>
        </div>
        <div class="card-text">
            <div class="container">
            <p><?=$first->comment?></p>
            <p>Gratification: <?= $first->amount?> /mois</p>
            </div>
        </div>
        <div class="card-body">
            <div class="container">
                <h5 class="but clair p-1" style="width:max-content">Secteur d'activité:</h5>        
                <ul class="navbar-nav border-sombre rounded-4 ps-2">
                <?php
                    if (isset($first->activity)) {
                        echo "<li><p class='sombre'> $first->activity</p></li>";
                    } else {
                        echo "<li><p class='sombre'> Pas de compétence particulière recommandée</p></li>";
                    }
                    ?>
                </ul>
            

                <h5 class="but clair p-1 mt-3" style="width:max-content">Skills:</h5>
                <ul class="navbar-nav border-sombre rounded-4 ps-2 ">
                    
                    <?php
                    if (!empty($first->skills)) {
                        foreach ($first->skills as $skill) {
                            echo "<li><p class='sombre'> $skill->name</p></li>";
                        }
                    } else {
                        echo "<li><p class='sombre'> Pas de compétence particulière recommandée</p></li>";
                    }
                    ?>
                </ul>
            </div>
        </div>
    </div>
</div>
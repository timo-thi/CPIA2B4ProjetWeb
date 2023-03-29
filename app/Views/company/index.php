<script src="../public/js/company_details.js"></script>
<div class="container mt-3 " style="max-width:90%">
    <?php if ($_SESSION['role'] != 3):?>
        <button class="active border-0 bg-clair sombre rounded ms-2 me-3" style="width: max-content;" onclick="window.location.href='?p=company.create'">Ajouter</button>
    <?php endif?>
    <div class="row mt-3 position-relative dropend">
        <div class="col-6  ">
            <div class="partieScrollable">
                <?php foreach ($annonces as $el):?>
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
                <?php endforeach; ?>
                <?php

                // Affichage de la pagination
                if ($total_pages >= 1): ?>
                    <div class=" row justify-content-center ms-5">
                        <?php $precedent= "?p=company.index&page=" . ($current_page - 1);?>
                        <div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href="<?= $precedent?>">&lt;</a></div>
                        <?php for ($i = 1; $i <= $total_pages; $i++):?>
                            <?php $class = ($i == $current_page) ? "active" : "";
                            $url = "?p=company.index&page=" . $i;?>
                            <div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href="<?= $url?>"><?=$i?></a></div>";
                        <?php endfor;?>
                        <?php $suivant= "?p=company.index&page=" . ($current_page + 1);?>
                        <div class='col-md-auto bg-clair ms-2 rounded-2'> <a class='nav-link' href="<?= $suivant?>">></a></div>
                    </div>
                <?php endif?>
            </div>
        </div>
        <div class="col-6 position-absolute end-0 ">
            <div class="position-absolute ms-2 end-0 ">
                <?php require '../app/Views/templates/DetailEntreprise.php';?>
            </div>
        </div>
    </div>
</div>

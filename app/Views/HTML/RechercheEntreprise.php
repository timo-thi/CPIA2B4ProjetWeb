
<div class="container mt-3 " style="max-width:90%">
    <div class="row mt-3 position-relative">
        <div class="col-6  ">
            <div class="partieScrollable">
                <?php 
                for ($i = 1; $i <= 10; $i++){
                    echo '<div class="row me-2">';
                    require './CadreAnnonce.php';
                    echo '</div>';
                }?>
                <!--Pagination-->
            </div>
        </div>

        <div class="col-6 position-absolute end-0 ">
            <div class="position-absolute ms-2 end-0 ">
                <?php require './DetailEntreprise.php';?>
            </div>
        </div>
    </div>
</div>
